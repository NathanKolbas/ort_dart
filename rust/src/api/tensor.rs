use std::fmt::Debug;
use std::iter::Map;
use flutter_rust_bridge::frb;
use ort::Error;
pub use ort::error::Result;
use ort::tensor::{IntoTensorElementType};
pub use ort::tensor::TensorElementType;
pub use ort::value::{DynValue, Tensor};
use ort::value::{DynTensor, ValueRef};

/// Enum mapping ONNX Runtime's supported tensor data types.
#[derive(Debug, PartialEq, Eq, Clone, Copy)]
#[frb(mirror(TensorElementType))]
pub enum _TensorElementType {
  /// 32-bit floating point number, equivalent to Rust's `f32`.
  Float32,
  /// Unsigned 8-bit integer, equivalent to Rust's `u8`.
  Uint8,
  /// Signed 8-bit integer, equivalent to Rust's `i8`.
  Int8,
  /// Unsigned 16-bit integer, equivalent to Rust's `u16`.
  Uint16,
  /// Signed 16-bit integer, equivalent to Rust's `i16`.
  Int16,
  /// Signed 32-bit integer, equivalent to Rust's `i32`.
  Int32,
  /// Signed 64-bit integer, equivalent to Rust's `i64`.
  Int64,
  /// String, equivalent to Rust's `String`.
  String,
  /// Boolean, equivalent to Rust's `bool`.
  Bool,
  /// 16-bit floating point number, equivalent to [`half::f16`] (with the `half` feature).
  Float16,
  /// 64-bit floating point number, equivalent to Rust's `f64`. Also known as `double`.
  Float64,
  /// Unsigned 32-bit integer, equivalent to Rust's `u32`.
  Uint32,
  /// Unsigned 64-bit integer, equivalent to Rust's `u64`.
  Uint64,
  /// Brain 16-bit floating point number, equivalent to [`half::bf16`] (with the `half` feature).
  Bfloat16,
  Complex64,
  Complex128,
  /// 8-bit floating point number with 4 exponent bits and 3 mantissa bits, with only NaN values and no infinite
  /// values.
  Float8E4M3FN,
  /// 8-bit floating point number with 4 exponent bits and 3 mantissa bits, with only NaN values, no infinite
  /// values, and no negative zero.
  Float8E4M3FNUZ,
  /// 8-bit floating point number with 5 exponent bits and 2 mantissa bits.
  Float8E5M2,
  /// 8-bit floating point number with 5 exponent bits and 2 mantissa bits, with only NaN values, no infinite
  /// values, and no negative zero.
  Float8E5M2FNUZ,
  /// 4-bit unsigned integer.
  Uint4,
  /// 4-bit signed integer.
  Int4,
  Undefined
}

#[derive(Debug)]
pub struct TensorImpl {
  pub(crate) tensor: DynTensor,
  mutable: bool,
}

#[frb(ignore)]
fn create_tensor<T: IntoTensorElementType + Debug>(tensor: Tensor<T>, mutable: bool) -> Result<TensorImpl> {
  Ok(TensorImpl {
    tensor: tensor.upcast(),
    mutable,
  })
}

macro_rules! impl_from_array_type {
	($t:ty) => {
    ::paste::paste! {
      #[frb(sync)]
      pub fn [<from_array_ $t>](shape: Option<Vec<i64>>, data: Vec<$t>) -> Result<TensorImpl> {
        let shape = TensorImpl::parse_shape(shape, &data)?;
        let tensor = if shape.contains(&0) {
          if !data.is_empty() {
            return Err(Error::new("Data must be empty for tensors with a zero dimension"));
          }

          let shape: Vec<usize> = shape.iter().map(|&d| d as usize).collect();
          let array = ndarray::Array::from_shape_vec(shape, data).unwrap();
          Tensor::from_array(array)?
        } else {
          Tensor::<$t>::from_array((shape, data))?
        };
        create_tensor(tensor, true)
      }
    }
	};
}

macro_rules! impl_get_data {
	($t:ty) => {
    ::paste::paste! {
      #[frb(sync)]
      pub fn [<get_data_ $t>](&mut self) -> std::result::Result<Vec<$t>, Error> {
        Ok(self.tensor.try_extract_tensor::<$t>()?.1.to_vec())
      }

      #[frb(sync)]
      pub fn [<get_data_mut_ $t>](&mut self) -> Result<Vec<$t>> {
        Ok(self.tensor.try_extract_tensor_mut::<$t>()?.1.to_vec())
      }

      #[frb(sync)]
      pub fn [<get_index_ $t>](&mut self, index: usize) -> Result<$t> {
        Ok(self.tensor.try_extract_tensor_mut::<$t>()?.1[index])
      }

      #[frb(sync)]
      pub fn [<set_index_ $t>](&mut self, index: usize, value: $t) -> Result<()> {
        if !self.mutable {
          return Err(Error::new("Tensor is not mutable"));
        }

        self.tensor.try_extract_tensor_mut::<$t>()?.1[index] = value;
        Ok(())
      }
    }
	};
}

macro_rules! impl_dart_list {
	($t:ty) => {
    ::paste::paste! {
      // #[frb(sync)]
      // pub fn [<get_data_ $t>](&mut self) -> std::result::Result<Vec<$t>, Error> {
      //   Ok(self.tensor.try_extract_tensor::<$t>()?.1.to_vec())
      // }

      #[frb(sync)]
      pub fn [<at_ $t>](&mut self, index: usize) -> Result<$t> {
        Ok(self.[<get_data_ $t>]()?[index])
      }
    }
	};
}

pub struct ArrayPointer {
  pub data: usize,
  pub length: usize,
}

impl TensorImpl {
  /// A helper method to get the shape of the data. Handles determining -1 and 0 for dynamic sizes
  /// or treating the shape as a 1-D array if no shape was provided.
  fn parse_shape<T>(shape: Option<Vec<i64>>, data: &Vec<T>) -> Result<Vec<i64>> {
    if let Some(shape) = shape {
      let mut inferred_shape = Vec::with_capacity(shape.len());
      let mut product = 1;
      let mut unknown_dim_idx = None;

      for (i, &dim) in shape.iter().enumerate() {
        if dim == -1 {
          if unknown_dim_idx.is_some() {
            return Err(Error::new("Only one dynamic dimension (-1 or 0) is allowed in the shape"));
          }
          unknown_dim_idx = Some(i);
          inferred_shape.push(1); // Placeholder, will be updated later
        } else if dim < -1 {
          return Err(Error::new(format!("Invalid dimension in shape: {}", dim)));
        } else {
          inferred_shape.push(dim);
          product *= dim;
        }
      }

      if let Some(idx) = unknown_dim_idx {
        if data.len() as i64 % product != 0 {
          return Err(Error::new(format!(
            "Data length ({}) is not divisible by the product of known dimensions ({})",
            data.len(),
            product
          )));
        }
        inferred_shape[idx] = data.len() as i64 / product;
      } else if product != data.len() as i64 {
        return Err(Error::new(format!(
          "Product of shape dimensions ({}) does not match data length ({})",
          product,
          data.len()
        )));
      }

      return Ok(inferred_shape);
    }

    // If no shape was provided then default to the length of the data (1-D array)
    Ok(vec![data.len() as i64])
  }

  impl_from_array_type!(f64);
  impl_from_array_type!(i64);
  impl_from_array_type!(u64);
  impl_from_array_type!(f32);
  impl_from_array_type!(u32);
  impl_from_array_type!(i32);
  impl_from_array_type!(u16);
  impl_from_array_type!(i16);
  impl_from_array_type!(u8);
  impl_from_array_type!(i8);
  impl_from_array_type!(bool);

  #[frb(sync)]
  pub fn from_array_string(shape: Option<Vec<i64>>, data: Vec<String>) -> Result<TensorImpl> {
    let shape = TensorImpl::parse_shape(shape, &data)?;
    let tensor = Tensor::from_string_array((shape, &*data))?;
    create_tensor(tensor, false)
  }

  pub(crate) fn from_value_ref(tensor: ValueRef) -> TensorImpl {
    let tensor = DynTensor::from(tensor.downcast().unwrap().clone());
    TensorImpl {
      tensor,
      mutable: false,
    }
  }

  /// If this Tensor's underlying data is mutable
  #[frb(sync)]
  pub fn is_mutable(&self) -> bool {
    self.mutable
  }

  /// Get the data type of the Tensor
  #[frb(sync)]
  pub fn dtype(&self) -> TensorElementType {
    self.tensor.data_type().clone()
  }

  /// Get the shape of the Tensor
  #[frb(sync)]
  pub fn shape(&self) -> Vec<i64> {
    self.tensor.shape().to_vec()
  }

  impl_get_data!(f64);
  impl_get_data!(i64);
  impl_get_data!(u64);
  impl_get_data!(f32);
  impl_get_data!(u32);
  impl_get_data!(i32);
  impl_get_data!(u16);
  impl_get_data!(i16);
  impl_get_data!(u8);
  impl_get_data!(i8);
  impl_get_data!(bool);

  #[frb(sync)]
  pub fn get_data_string(&mut self) -> Result<Vec<String>> {
    Ok(self.tensor.try_extract_strings()?.1.to_vec())
  }

  #[frb(sync)]
  pub fn get_index_string(&mut self, index: usize) -> Result<String> {
    Ok(self.tensor.try_extract_strings()?.1[index].clone())
  }

  // #[frb(sync)]
  // pub fn get_data_string_pointer(&mut self) -> Result<ArrayPointer> {
  //   let arr = self.tensor.try_extract_strings()?.1.to_vec();
  //   let data = arr.as_ptr() as usize;
  //   let length = arr.len();
  //   std::mem::forget(arr);
  //   Ok(ArrayPointer { data, length })
  // }

  #[frb(sync)]
  pub fn get_data_f32_pointer(&mut self) -> Result<ArrayPointer> {
    let arr = self.tensor.try_extract_tensor_mut::<f32>()?;
    let data = arr.1.as_mut_ptr() as usize;
    let length = arr.0.len();
    std::mem::forget(arr);
    Ok(ArrayPointer { data, length })
  }

  /// Frees the memory of a f32 pointer.
  #[frb(sync)]
  pub fn free_f32_pointer(ptr: ArrayPointer) {
    unsafe {
      let _ = Vec::from_raw_parts(ptr.data as *mut f32, ptr.length, ptr.length);
      // The Vec is dropped when it goes out of scope here, freeing the memory.
    }
  }

  // impl_dart_list!(f64);
  // impl_dart_list!(i64);
  // impl_dart_list!(u64);
  // impl_dart_list!(f32);
  // impl_dart_list!(u32);
  // impl_dart_list!(i32);
  // impl_dart_list!(u16);
  // impl_dart_list!(i16);
  // impl_dart_list!(u8);
  // impl_dart_list!(i8);
  // impl_dart_list!(bool);
  //
  // #[frb(sync)]
  // pub fn at_string(&mut self, index: usize) -> Result<String> {
  //   Ok(self.get_data_string()?[index])
  // }
  
  /// Creates a copy of this tensor and its data on the same device it resides on.
  #[frb(sync)]
  pub fn clone(&self) -> TensorImpl {
    Self {
      tensor: self.tensor.clone(),
      mutable: self.mutable,
    }
  }
}

// impl<T> TensorImpl {
//   /// Dart method signature: List<T> operator +(List<T> other)
//   #[frb(sync)]
//   pub fn append(&mut self, element: &Self) -> Result<String> {
//     Err(Error::new("Tensor is not growable"))
//   }
//
//   /// Dart method signature: T operator [](int index)
//   #[frb(sync)]
//   pub fn at(&mut self, index: usize) -> T {
//     self.get_data()?[index]
//   }
//
//   // /// Dart method signature: void operator []=(int index, T value)
//   // #[frb(sync)]
//   // fn set(&self, index: usize, value: T) -> ();
//   //
//   // /// Dart method signature: void add(T value)
//   // #[frb(sync)]
//   // fn add(&self, value: T) -> ();
//   //
//   // /// Dart method signature: void addAll(Iterable<T> iterable)
//   // #[frb(sync)]
//   // fn add_all(&self, value: Vec<T>) -> ();
//   //
//   // /// Dart method signature: bool any(bool Function(T element) test)
//   // #[frb(sync)]
//   // fn any(&self, test: fn(T) -> bool) -> ();
//   //
//   // /// Dart method signature: Map<int, T> asMap()
//   // #[frb(sync)]
//   // fn as_map(&self) -> Map<usize, T>;
//   //
//   // // /// Dart method signature: List<R> cast<R>()
//   // // #[frb(sync)]
//   // // fn cast<R>(&self) -> R;
//   //
//   // /// Dart method signature: void clear()
//   // #[frb(sync)]
//   // fn clear(&self) -> ();
//   //
//   // /// Dart method signature: bool contains(Object? element)
//   // #[frb(sync)]
//   // fn contains(&self, element: T) -> ();
//   //
//   // /// Dart method signature: T elementAt(int index)
//   // #[frb(sync)]
//   // fn element_at(&self, index: usize) -> T;
//   //
//   // /// Dart method signature: bool every(bool Function(T element) test)
//   // #[frb(sync)]
//   // fn every(&self, test: fn(T) -> bool) -> bool;
//   //
//   // // /// Dart method signature: Iterable expand<T>(Iterable Function(T element) toElements)
//   // // #[frb(sync)]
//   // // fn expand(&self, test: fn(T) -> bool) -> bool;
//   //
//   // /// Dart method signature: void fillRange(int start, int end, [T? fillValue])
//   // #[frb(sync)]
//   // fn fill_range(&self, start: usize, end: usize, fill_value: T) -> bool;
//   //
//   // /// Dart method signature: T firstWhere(bool Function(T element) test, {T Function()? orElse})
//   // #[frb(sync)]
//   // fn first_where(&self, test: fn(T) -> bool, or_else: Option<fn() -> T>) -> T;
//   //
//   // /// Dart method signature: fold<T>(initialValue, Function(previousValue, T element) combine)
//   // #[frb(sync)]
//   // fn fold<R>(&self, initial_value: R, combine: fn(R, T) -> R) -> R;
//   //
//   // /// Dart method signature: Iterable<T> followedBy(Iterable<T> other)
//   // #[frb(sync)]
//   // fn followed_by(&self, other: Vec<T>) -> T;
//   //
//   // /// Dart method signature: void forEach(void Function(T element) action)
//   // #[frb(sync)]
//   // fn for_each(&self, action: fn(T) -> ()) -> ();
//   //
//   // /// Dart method signature: Iterable<T> getRange(int start, int end)
//   // #[frb(sync)]
//   // fn get_range(&self, start: usize, end: usize) -> Vec<T>;
//   //
//   // /// Dart method signature: int indexOf(T element, [int start = 0])
//   // #[frb(sync)]
//   // fn index_of(&self, element: T, start: Option<usize>) -> usize;
//   //
//   // /// Dart method signature: int indexWhere(bool Function(T element) test, [int start = 0])
//   // #[frb(sync)]
//   // fn index_where(&self, test: fn(T) -> bool, start: Option<usize>) -> usize;
//   //
//   // /// Dart method signature: void insert(int index, T element)
//   // #[frb(sync)]
//   // fn insert(&self, index: usize, element: T) -> ();
//   //
//   // /// Dart method signature: void insertAll(int index, Iterable<T> iterable)
//   // #[frb(sync)]
//   // fn insert_all(&self, index: usize, iterable: Vec<T>) -> ();
//   //
//   // /// Dart method signature: bool get isEmpty
//   // #[frb(sync)]
//   // fn is_empty(&self) -> bool;
//   //
//   // /// Dart method signature: bool get isNotEmpty
//   // #[frb(sync)]
//   // fn is_not_empty(&self) -> bool;
//   //
//   // // /// Dart method signature: Iterator<T> get iterator
//   // // #[frb(sync)]
//   // // fn iterator(&self) -> ();
//   //
//   // /// Dart method signature: String join([String separator = ""])
//   // #[frb(sync)]
//   // fn join(&self, separator: Option<String>) -> String;
//   //
//   // /// Dart method signature: int lastIndexOf(T element, [int? start])
//   // #[frb(sync)]
//   // fn last_index_of(&self, element: T, start: Option<usize>) -> usize;
//   //
//   // /// Dart method signature: int lastIndexWhere(bool Function(T element) test, [int? start])
//   // #[frb(sync)]
//   // fn last_index_where(&self, test: fn(T) -> bool, start: Option<usize>) -> usize;
//   //
//   // /// Dart method signature: T lastWhere(bool Function(T element) test, {T Function()? orElse})
//   // #[frb(sync)]
//   // fn last_where(&self, test: fn(T) -> bool, start: Option<fn() -> T>) -> T;
//   //
//   // // /// Dart method signature: T reduce(T Function(T value, T element) combine)
//   // // #[frb(sync)]
//   // // fn reduce<R>(&self, to_element: fn(T) -> R) -> R;
//   //
//   // /// Dart method signature: bool remove(Object? value)
//   // #[frb(sync)]
//   // fn remove(&self, value: T) -> bool;
//   //
//   // /// Dart method signature: T removeAt(int index)
//   // #[frb(sync)]
//   // fn remove_at(&self, index: usize) -> T;
//   //
//   // /// Dart method signature: T removeLast()
//   // #[frb(sync)]
//   // fn remove_last(&self) -> T;
//   //
//   // /// Dart method signature: void removeRange(int start, int end)
//   // #[frb(sync)]
//   // fn remove_range(&self, start: usize, end: usize) -> ();
//   //
//   // /// Dart method signature: void removeWhere(bool Function(T element) test)
//   // #[frb(sync)]
//   // fn remove_where(&self, test: fn(T) -> bool) -> ();
//   //
//   // /// Dart method signature: void replaceRange(int start, int end, Iterable<T> replacements)
//   // #[frb(sync)]
//   // fn replace_range(&self, start: usize, end: usize, replacements: Vec<T>) -> ();
//   //
//   // /// Dart method signature: void retainWhere(bool Function(T element) test)
//   // #[frb(sync)]
//   // fn retain_where(&self, test: fn(T) -> bool) -> ();
//   //
//   // /// Dart method signature: Iterable<T> get reversed
//   // #[frb(sync)]
//   // fn reversed(&self) -> Vec<T>;
//   //
//   // /// Dart method signature: void setAll(int index, Iterable<T> iterable)
//   // #[frb(sync)]
//   // fn set_all(&self, index: usize, iterable: Vec<T>) -> ();
//   //
//   // /// Dart method signature: void setRange(int start, int end, Iterable<T> iterable, [int skipCount = 0])
//   // #[frb(sync)]
//   // fn set_range(&self, start: usize, end: usize, iterable: Vec<T>, skip_count: Option<usize>) -> ();
//   //
//   // // /// Dart method signature: void shuffle([Random? random])
//   // // #[frb(sync)]
//   // // fn shuffle(&self) -> ();
//   //
//   // /// Dart method signature: T get single
//   // #[frb(sync)]
//   // fn single(&self) -> T;
//   //
//   // /// Dart method signature: T singleWhere(bool Function(T element) test, {T Function()? orElse})
//   // #[frb(sync)]
//   // fn single_where(&self, test: fn(T) -> bool, or_else: Option<fn() -> T>) -> T;
//   //
//   // /// Dart method signature: Iterable<T> skip(int count)
//   // #[frb(sync)]
//   // fn skip(&self, count: usize) -> Vec<T>;
//   //
//   // /// Dart method signature: Iterable<T> skipWhile(bool Function(T value) test)
//   // #[frb(sync)]
//   // fn skip_while(&self, test: fn(T) -> bool) -> Vec<T>;
//   //
//   // /// Dart method signature: void sort([int Function(T a, T b)? compare])
//   // #[frb(sync)]
//   // fn sort(&self, compare: Option<fn(T, T) -> i32>) -> ();
//   //
//   // /// Dart method signature: List<T> sublist(int start, [int? end])
//   // #[frb(sync)]
//   // fn sublist(&self, start: usize, end: Option<usize>) -> Vec<T>;
//   //
//   // /// Dart method signature: Iterable<T> take(int count)
//   // #[frb(sync)]
//   // fn take(&self, count: usize) -> Vec<T>;
//   //
//   // /// Dart method signature: Iterable<T> takeWhile(bool Function(T value) test)
//   // #[frb(sync)]
//   // fn take_while(&self, test: fn(T) -> bool) -> Vec<T>;
//   //
//   // // /// Dart method signature: List<T> toList({bool growable = true})
//   // // #[frb(sync)]
//   // // fn to_list(&self, test: fn(T) -> bool) -> Vec<T>;
//   //
//   // // /// Dart method signature: Set<T> toSet()
//   // // #[frb(sync)]
//   // // fn to_set(&self) -> Vec<T>;
//   //
//   // /// Dart method signature: Iterable<T> where(bool Function(T element) test)
//   // #[frb(sync)]
//   // fn is_where(&self, test: fn(T) -> bool) -> Vec<T>;
//   //
//   // // /// Dart method signature: Iterable<T> whereType<T>()
//   // // #[frb(sync)]
//   // // fn is_where(&self, test: fn(T) -> bool) -> Vec<T>;
// }

// pub trait DartList<T>: Send + Sync {
//   /// Dart method signature: List<T> operator +(List<T> other)
//   #[frb(sync)]
//   fn append(&mut self, element: &Self) -> String;
//
//   /// Dart method signature: T operator [](int index)
//   #[frb(sync)]
//   fn at(&self, index: usize) -> T;
//
//   /// Dart method signature: void operator []=(int index, T value)
//   #[frb(sync)]
//   fn set(&self, index: usize, value: T) -> ();
//
//   /// Dart method signature: void add(T value)
//   #[frb(sync)]
//   fn add(&self, value: T) -> ();
//
//   /// Dart method signature: void addAll(Iterable<T> iterable)
//   #[frb(sync)]
//   fn add_all(&self, value: Vec<T>) -> ();
//
//   /// Dart method signature: bool any(bool Function(T element) test)
//   #[frb(sync)]
//   fn any(&self, test: fn(T) -> bool) -> ();
//
//   /// Dart method signature: Map<int, T> asMap()
//   #[frb(sync)]
//   fn as_map(&self) -> Map<usize, T>;
//
//   // /// Dart method signature: List<R> cast<R>()
//   // #[frb(sync)]
//   // fn cast<R>(&self) -> R;
//
//   /// Dart method signature: void clear()
//   #[frb(sync)]
//   fn clear(&self) -> ();
//
//   /// Dart method signature: bool contains(Object? element)
//   #[frb(sync)]
//   fn contains(&self, element: T) -> ();
//
//   /// Dart method signature: T elementAt(int index)
//   #[frb(sync)]
//   fn element_at(&self, index: usize) -> T;
//
//   /// Dart method signature: bool every(bool Function(T element) test)
//   #[frb(sync)]
//   fn every(&self, test: fn(T) -> bool) -> bool;
//
//   // /// Dart method signature: Iterable expand<T>(Iterable Function(T element) toElements)
//   // #[frb(sync)]
//   // fn expand(&self, test: fn(T) -> bool) -> bool;
//
//   /// Dart method signature: void fillRange(int start, int end, [T? fillValue])
//   #[frb(sync)]
//   fn fill_range(&self, start: usize, end: usize, fill_value: T) -> bool;
//
//   /// Dart method signature: T firstWhere(bool Function(T element) test, {T Function()? orElse})
//   #[frb(sync)]
//   fn first_where(&self, test: fn(T) -> bool, or_else: Option<fn() -> T>) -> T;
//
//   /// Dart method signature: fold<T>(initialValue, Function(previousValue, T element) combine)
//   #[frb(sync)]
//   fn fold<R>(&self, initial_value: R, combine: fn(R, T) -> R) -> R;
//
//   /// Dart method signature: Iterable<T> followedBy(Iterable<T> other)
//   #[frb(sync)]
//   fn followed_by(&self, other: Vec<T>) -> T;
//
//   /// Dart method signature: void forEach(void Function(T element) action)
//   #[frb(sync)]
//   fn for_each(&self, action: fn(T) -> ()) -> ();
//
//   /// Dart method signature: Iterable<T> getRange(int start, int end)
//   #[frb(sync)]
//   fn get_range(&self, start: usize, end: usize) -> Vec<T>;
//
//   /// Dart method signature: int indexOf(T element, [int start = 0])
//   #[frb(sync)]
//   fn index_of(&self, element: T, start: Option<usize>) -> usize;
//
//   /// Dart method signature: int indexWhere(bool Function(T element) test, [int start = 0])
//   #[frb(sync)]
//   fn index_where(&self, test: fn(T) -> bool, start: Option<usize>) -> usize;
//
//   /// Dart method signature: void insert(int index, T element)
//   #[frb(sync)]
//   fn insert(&self, index: usize, element: T) -> ();
//
//   /// Dart method signature: void insertAll(int index, Iterable<T> iterable)
//   #[frb(sync)]
//   fn insert_all(&self, index: usize, iterable: Vec<T>) -> ();
//
//   /// Dart method signature: bool get isEmpty
//   #[frb(sync)]
//   fn is_empty(&self) -> bool;
//
//   /// Dart method signature: bool get isNotEmpty
//   #[frb(sync)]
//   fn is_not_empty(&self) -> bool;
//
//   // /// Dart method signature: Iterator<T> get iterator
//   // #[frb(sync)]
//   // fn iterator(&self) -> ();
//
//   /// Dart method signature: String join([String separator = ""])
//   #[frb(sync)]
//   fn join(&self, separator: Option<String>) -> String;
//
//   /// Dart method signature: int lastIndexOf(T element, [int? start])
//   #[frb(sync)]
//   fn last_index_of(&self, element: T, start: Option<usize>) -> usize;
//
//   /// Dart method signature: int lastIndexWhere(bool Function(T element) test, [int? start])
//   #[frb(sync)]
//   fn last_index_where(&self, test: fn(T) -> bool, start: Option<usize>) -> usize;
//
//   /// Dart method signature: T lastWhere(bool Function(T element) test, {T Function()? orElse})
//   #[frb(sync)]
//   fn last_where(&self, test: fn(T) -> bool, start: Option<fn() -> T>) -> T;
//
//   // /// Dart method signature: T reduce(T Function(T value, T element) combine)
//   // #[frb(sync)]
//   // fn reduce<R>(&self, to_element: fn(T) -> R) -> R;
//
//   /// Dart method signature: bool remove(Object? value)
//   #[frb(sync)]
//   fn remove(&self, value: T) -> bool;
//
//   /// Dart method signature: T removeAt(int index)
//   #[frb(sync)]
//   fn remove_at(&self, index: usize) -> T;
//
//   /// Dart method signature: T removeLast()
//   #[frb(sync)]
//   fn remove_last(&self) -> T;
//
//   /// Dart method signature: void removeRange(int start, int end)
//   #[frb(sync)]
//   fn remove_range(&self, start: usize, end: usize) -> ();
//
//   /// Dart method signature: void removeWhere(bool Function(T element) test)
//   #[frb(sync)]
//   fn remove_where(&self, test: fn(T) -> bool) -> ();
//
//   /// Dart method signature: void replaceRange(int start, int end, Iterable<T> replacements)
//   #[frb(sync)]
//   fn replace_range(&self, start: usize, end: usize, replacements: Vec<T>) -> ();
//
//   /// Dart method signature: void retainWhere(bool Function(T element) test)
//   #[frb(sync)]
//   fn retain_where(&self, test: fn(T) -> bool) -> ();
//
//   /// Dart method signature: Iterable<T> get reversed
//   #[frb(sync)]
//   fn reversed(&self) -> Vec<T>;
//
//   /// Dart method signature: void setAll(int index, Iterable<T> iterable)
//   #[frb(sync)]
//   fn set_all(&self, index: usize, iterable: Vec<T>) -> ();
//
//   /// Dart method signature: void setRange(int start, int end, Iterable<T> iterable, [int skipCount = 0])
//   #[frb(sync)]
//   fn set_range(&self, start: usize, end: usize, iterable: Vec<T>, skip_count: Option<usize>) -> ();
//
//   // /// Dart method signature: void shuffle([Random? random])
//   // #[frb(sync)]
//   // fn shuffle(&self) -> ();
//
//   /// Dart method signature: T get single
//   #[frb(sync)]
//   fn single(&self) -> T;
//
//   /// Dart method signature: T singleWhere(bool Function(T element) test, {T Function()? orElse})
//   #[frb(sync)]
//   fn single_where(&self, test: fn(T) -> bool, or_else: Option<fn() -> T>) -> T;
//
//   /// Dart method signature: Iterable<T> skip(int count)
//   #[frb(sync)]
//   fn skip(&self, count: usize) -> Vec<T>;
//
//   /// Dart method signature: Iterable<T> skipWhile(bool Function(T value) test)
//   #[frb(sync)]
//   fn skip_while(&self, test: fn(T) -> bool) -> Vec<T>;
//
//   /// Dart method signature: void sort([int Function(T a, T b)? compare])
//   #[frb(sync)]
//   fn sort(&self, compare: Option<fn(T, T) -> i32>) -> ();
//
//   /// Dart method signature: List<T> sublist(int start, [int? end])
//   #[frb(sync)]
//   fn sublist(&self, start: usize, end: Option<usize>) -> Vec<T>;
//
//   /// Dart method signature: Iterable<T> take(int count)
//   #[frb(sync)]
//   fn take(&self, count: usize) -> Vec<T>;
//
//   /// Dart method signature: Iterable<T> takeWhile(bool Function(T value) test)
//   #[frb(sync)]
//   fn take_while(&self, test: fn(T) -> bool) -> Vec<T>;
//
//   // /// Dart method signature: List<T> toList({bool growable = true})
//   // #[frb(sync)]
//   // fn to_list(&self, test: fn(T) -> bool) -> Vec<T>;
//
//   // /// Dart method signature: Set<T> toSet()
//   // #[frb(sync)]
//   // fn to_set(&self) -> Vec<T>;
//
//   /// Dart method signature: Iterable<T> where(bool Function(T element) test)
//   #[frb(sync)]
//   fn is_where(&self, test: fn(T) -> bool) -> Vec<T>;
//
//   // /// Dart method signature: Iterable<T> whereType<T>()
//   // #[frb(sync)]
//   // fn is_where(&self, test: fn(T) -> bool) -> Vec<T>;
// }

#[cfg(test)]
mod tests {
  use ort::error::Result;
  use ort::tensor::{TensorElementType};
  use crate::api::tensor::TensorImpl;

  #[test]
  fn tensor_parse_shape_1d() {
    let shape = None;
    let data = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    let result = TensorImpl::parse_shape(shape, &data).unwrap();

    assert_eq!(result, vec![data.len() as i64]);
  }

  #[test]
  fn tensor_parse_shape_dynamic_dim_negative_one() {
    let shape = Some(vec![4, -1]);
    let data = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    let result = TensorImpl::parse_shape(shape, &data).unwrap();

    assert_eq!(result, vec![4, 3]);
  }

  #[test]
  fn tensor_parse_shape_no_dynamic_dim_match_data() {
    let shape = Some(vec![3, 4]);
    let data = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    let result = TensorImpl::parse_shape(shape, &data).unwrap();

    assert_eq!(result, vec![3, 4]);
  }

  #[test]
  fn tensor_parse_shape_dynamic_dim_negative_one_4d() {
    let shape = Some(vec![1, 2, -1, 2]);
    let data = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    let result = TensorImpl::parse_shape(shape, &data).unwrap();

    assert_eq!(result, vec![1, 2, 3, 2]);
  }


  #[test]
  fn tensor_parse_shape_no_dynamic_dim_mismatch_data() {
    let shape = Some(vec![3, 3]);
    let data = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    let result = TensorImpl::parse_shape(shape, &data);

    assert!(result.is_err());
    assert_eq!(
      result.unwrap_err().to_string(),
      "Product of shape dimensions (9) does not match data length (12)"
    );
  }

  #[test]
  fn tensor_parse_shape_dynamic_dim_not_divisible() {
    let shape = Some(vec![3, -1]);
    let data = vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; // 10 is not divisible by 3

    let result = TensorImpl::parse_shape(shape, &data);

    assert!(result.is_err());
    assert_eq!(
      result.unwrap_err().to_string(),
      "Data length (10) is not divisible by the product of known dimensions (3)"
    );
  }

  #[test]
  fn test_from_array_f32() -> Result<()> {
    let vec = vec![1., 2., 3.];
    let tensor = TensorImpl::from_array_f32(None, vec)?;

    assert_eq!(tensor.dtype(), TensorElementType::Float32);

    Ok(())
  }

  #[test]
  fn tensor_from_array_with_zero_dim() -> Result<()> {
    let shape = Some(vec![1, 3, 0, 64]);
    let data: Vec<f32> = vec![];
    let tensor = TensorImpl::from_array_f32(shape, data)?;

    assert_eq!(tensor.shape(), vec![1, 3, 0, 64]);
    assert_eq!(tensor.dtype(), TensorElementType::Float32);
    assert!(tensor.is_mutable());
    Ok(())
  }
}
