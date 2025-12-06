use std::ffi::{CString, NulError};
use std::fmt::Debug;
use std::os::raw::c_char;
use std::ptr::NonNull;
use flutter_rust_bridge::frb;
use ort::{AsPointer, Error};
pub use ort::error::Result;
use ort::tensor::{IntoTensorElementType};
pub use ort::tensor::TensorElementType;
pub use ort::value::{DynValue, Tensor};
use ort::value::{DynTensor, ValueRef};
use crate::api::memory::MemoryInfo;

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

pub struct ArrayPointer {
  pub ptr: usize,
  pub len: usize,
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

macro_rules! impl_type {
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

      #[frb(sync)]
      pub fn [<get_data_ $t _pointer>](&mut self) -> Result<ArrayPointer> {
        let arr = self.tensor.try_extract_tensor_mut::<$t>()?.1;
        let ptr = arr.as_mut_ptr() as usize;
        let len = arr.len();
        Ok(ArrayPointer { ptr, len })
      }

      #[frb(sync)]
      pub fn [<free_ $t _pointer>](arr: ArrayPointer) {
        unsafe {
          let _ = std::slice::from_raw_parts(arr.ptr as *mut $t, arr.len);
          // The slice is dropped when it goes out of scope here, freeing the memory.
        };
      }
    }
	};
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

  pub(crate) fn from_value_ref(tensor: ValueRef) -> TensorImpl {
    let tensor = DynTensor::from(tensor.downcast().unwrap().clone());
    TensorImpl {
      tensor,
      mutable: false,
    }
  }

  impl_type!(f64);
  impl_type!(i64);
  impl_type!(u64);
  impl_type!(f32);
  impl_type!(u32);
  impl_type!(i32);
  impl_type!(u16);
  impl_type!(i16);
  impl_type!(u8);
  impl_type!(i8);
  impl_type!(bool);

  #[frb(sync)]
  pub fn from_array_string(shape: Option<Vec<i64>>, data: Vec<String>) -> Result<TensorImpl> {
    let shape = TensorImpl::parse_shape(shape, &data)?;
    let tensor = Tensor::from_string_array((shape, &*data))?;
    create_tensor(tensor, false)
  }

  #[frb(sync)]
  pub fn get_data_string_pointer(&mut self) -> Result<ArrayPointer> {
    // Extract strings and convert to CStrings, handling potential null bytes
    let c_strings: std::result::Result<Vec<CString>, NulError> = self.tensor.try_extract_string_array()?
      .iter()
      .map(|s| CString::new(s.clone()))
      .collect();
    let c_strings = c_strings.map_err(|e| Error::new(format!("Failed to create CString: {}", e)))?;

    // Create a Vec of pointers from the CStrings
    let pointers_vec: Vec<*const c_char> = c_strings
      .iter()
      .map(|s| s.as_ptr())
      .collect();
    let pointers: &[*const c_char] = pointers_vec.iter().as_slice();

    let ptr = pointers.as_ptr() as usize;
    let len = pointers.len();

    Ok(ArrayPointer { ptr, len })
  }

  #[frb(sync)]
  pub fn free_string_pointer(arr: ArrayPointer) {
    unsafe {
      let _ = std::slice::from_raw_parts(arr.ptr as *const *const c_char, arr.len);
      // The slice is dropped when it goes out of scope here, freeing the memory.
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

  /// Creates a copy of this tensor but pointing to the same data.
  #[frb(sync)]
  pub fn copy(&mut self) -> TensorImpl {
    Self {
      tensor: unsafe { DynTensor::from_ptr(NonNull::new_unchecked(self.tensor.ptr_mut()), None) },
      mutable: self.mutable,
    }
  }

  /// Creates a copy of this tensor and its data on the same device it resides on.
  #[frb(sync)]
  pub fn clone(&self) -> TensorImpl {
    Self {
      tensor: self.tensor.clone(),
      mutable: self.mutable,
    }
  }

  #[frb(sync)]
  pub fn memory_info(self) -> Result<MemoryInfo> {
    MemoryInfo::new(self)
  }
}

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
