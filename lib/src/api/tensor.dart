import 'dart:collection';
import 'dart:ffi' as ffi;
import 'dart:math';

import 'package:ort/src/rust/api/tensor.dart';

export 'package:ort/src/rust/api/tensor.dart' show TensorElementType;

Tensor tensorFromImpl(TensorImpl tensor) => Tensor._(tensor);

// class TensorList<T> implements List<T> {
//   TensorImpl get _tensor;
//
//   @override
//   T first;
//
//   @override
//   T last;
//
//   @override
//   int length;
//
//   @override
//   List<T> operator +(List<T> other) {
//     // TODO: implement +
//     throw UnimplementedError();
//   }
//
//   @override
//   T operator [](int index) {
//     // TODO: implement []
//     throw UnimplementedError();
//   }
//
//   @override
//   void operator []=(int index, T value) {
//     // TODO: implement []=
//   }
//
//   @override
//   void add(T value) {
//     // TODO: implement add
//   }
//
//   @override
//   void addAll(Iterable<T> iterable) {
//     // TODO: implement addAll
//   }
//
//   @override
//   bool any(bool Function(T element) test) {
//     // TODO: implement any
//     throw UnimplementedError();
//   }
//
//   @override
//   Map<int, T> asMap() {
//     // TODO: implement asMap
//     throw UnimplementedError();
//   }
//
//   @override
//   List<R> cast<R>() {
//     // TODO: implement cast
//     throw UnimplementedError();
//   }
//
//   @override
//   void clear() {
//     // TODO: implement clear
//   }
//
//   @override
//   bool contains(Object? element) {
//     // TODO: implement contains
//     throw UnimplementedError();
//   }
//
//   @override
//   T elementAt(int index) {
//     // TODO: implement elementAt
//     throw UnimplementedError();
//   }
//
//   @override
//   bool every(bool Function(T element) test) {
//     // TODO: implement every
//     throw UnimplementedError();
//   }
//
//   @override
//   Iterable expand<T>(Iterable Function(T element) toElements) {
//     // TODO: implement expand
//     throw UnimplementedError();
//   }
//
//   @override
//   void fillRange(int start, int end, [T? fillValue]) {
//     // TODO: implement fillRange
//   }
//
//   @override
//   T firstWhere(bool Function(T element) test, {T Function()? orElse}) {
//     // TODO: implement firstWhere
//     throw UnimplementedError();
//   }
//
//   @override
//   fold<T>(initialValue, Function(previousValue, T element) combine) {
//     // TODO: implement fold
//     throw UnimplementedError();
//   }
//
//   @override
//   Iterable<T> followedBy(Iterable<T> other) {
//     // TODO: implement followedBy
//     throw UnimplementedError();
//   }
//
//   @override
//   void forEach(void Function(T element) action) {
//     // TODO: implement forEach
//   }
//
//   @override
//   Iterable<T> getRange(int start, int end) {
//     // TODO: implement getRange
//     throw UnimplementedError();
//   }
//
//   @override
//   int indexOf(T element, [int start = 0]) {
//     // TODO: implement indexOf
//     throw UnimplementedError();
//   }
//
//   @override
//   int indexWhere(bool Function(T element) test, [int start = 0]) {
//     // TODO: implement indexWhere
//     throw UnimplementedError();
//   }
//
//   @override
//   void insert(int index, T element) {
//     // TODO: implement insert
//   }
//
//   @override
//   void insertAll(int index, Iterable<T> iterable) {
//     // TODO: implement insertAll
//   }
//
//   @override
//   // TODO: implement isEmpty
//   bool get isEmpty => throw UnimplementedError();
//
//   @override
//   // TODO: implement isNotEmpty
//   bool get isNotEmpty => throw UnimplementedError();
//
//   @override
//   // TODO: implement iterator
//   Iterator<T> get iterator => throw UnimplementedError();
//
//   @override
//   String join([String separator = ""]) {
//     // TODO: implement join
//     throw UnimplementedError();
//   }
//
//   @override
//   int lastIndexOf(T element, [int? start]) {
//     // TODO: implement lastIndexOf
//     throw UnimplementedError();
//   }
//
//   @override
//   int lastIndexWhere(bool Function(T element) test, [int? start]) {
//     // TODO: implement lastIndexWhere
//     throw UnimplementedError();
//   }
//
//   @override
//   T lastWhere(bool Function(T element) test, {T Function()? orElse}) {
//     // TODO: implement lastWhere
//     throw UnimplementedError();
//   }
//
//   @override
//   Iterable map<T>(Function(T e) toElement) {
//     // TODO: implement map
//     throw UnimplementedError();
//   }
//
//   @override
//   T reduce(T Function(T value, T element) combine) {
//     // TODO: implement reduce
//     throw UnimplementedError();
//   }
//
//   @override
//   bool remove(Object? value) {
//     // TODO: implement remove
//     throw UnimplementedError();
//   }
//
//   @override
//   T removeAt(int index) {
//     // TODO: implement removeAt
//     throw UnimplementedError();
//   }
//
//   @override
//   T removeLast() {
//     // TODO: implement removeLast
//     throw UnimplementedError();
//   }
//
//   @override
//   void removeRange(int start, int end) {
//     // TODO: implement removeRange
//   }
//
//   @override
//   void removeWhere(bool Function(T element) test) {
//     // TODO: implement removeWhere
//   }
//
//   @override
//   void replaceRange(int start, int end, Iterable<T> replacements) {
//     // TODO: implement replaceRange
//   }
//
//   @override
//   void retainWhere(bool Function(T element) test) {
//     // TODO: implement retainWhere
//   }
//
//   @override
//   // TODO: implement reversed
//   Iterable<T> get reversed => throw UnimplementedError();
//
//   @override
//   void setAll(int index, Iterable<T> iterable) {
//     // TODO: implement setAll
//   }
//
//   @override
//   void setRange(int start, int end, Iterable<T> iterable, [int skipCount = 0]) {
//     // TODO: implement setRange
//   }
//
//   @override
//   void shuffle([Random? random]) {
//     // TODO: implement shuffle
//   }
//
//   @override
//   // TODO: implement single
//   T get single => throw UnimplementedError();
//
//   @override
//   T singleWhere(bool Function(T element) test, {T Function()? orElse}) {
//     // TODO: implement singleWhere
//     throw UnimplementedError();
//   }
//
//   @override
//   Iterable<T> skip(int count) {
//     // TODO: implement skip
//     throw UnimplementedError();
//   }
//
//   @override
//   Iterable<T> skipWhile(bool Function(T value) test) {
//     // TODO: implement skipWhile
//     throw UnimplementedError();
//   }
//
//   @override
//   void sort([int Function(T a, T b)? compare]) {
//     // TODO: implement sort
//   }
//
//   @override
//   List<T> sublist(int start, [int? end]) {
//     // TODO: implement sublist
//     throw UnimplementedError();
//   }
//
//   @override
//   Iterable<T> take(int count) {
//     // TODO: implement take
//     throw UnimplementedError();
//   }
//
//   @override
//   Iterable<T> takeWhile(bool Function(T value) test) {
//     // TODO: implement takeWhile
//     throw UnimplementedError();
//   }
//
//   @override
//   List<T> toList({bool growable = true}) {
//     // TODO: implement toList
//     throw UnimplementedError();
//   }
//
//   @override
//   Set<T> toSet() {
//     // TODO: implement toSet
//     throw UnimplementedError();
//   }
//
//   @override
//   Iterable<T> where(bool Function(T element) test) {
//     // TODO: implement where
//     throw UnimplementedError();
//   }
//
//   @override
//   Iterable<T> whereType<T>() {
//     // TODO: implement whereType
//     throw UnimplementedError();
//   }
// }













/// This class is used so that [Finalizer] can be used to free the
/// [ArrayPointer].
class _ArrayPointerWrapper {
  ArrayPointer? arrayPointer;
  bool _disposed = false;

  void dispose() {
    // To prevent double free of memory
    if (_disposed) return;
    _disposed = true;

    Tensor._freeArrayPointer(arrayPointer);
  }
}

class Tensor<T> with ListMixin<T> {
  static Tensor<bool> fromArrayBool({
    List<int>? shape,
    required List<bool> data,
  }) => Tensor._(TensorImpl.fromArrayBool(
    shape: shape,
    data: data,
  ));

  static Tensor<double> fromArrayF32({
    List<int>? shape,
    required List<double> data,
  }) => Tensor._(TensorImpl.fromArrayF32(
    shape: shape,
    data: data,
  ));

  static Tensor<double> fromArrayF64({
    List<int>? shape,
    required List<double> data,
  }) => Tensor._(TensorImpl.fromArrayF64(
    shape: shape,
    data: data,
  ));

  static Tensor<int> fromArrayI16({
    List<int>? shape,
    required List<int> data,
  }) => Tensor._(TensorImpl.fromArrayI16(
    shape: shape,
    data: data,
  ));

  static Tensor<int> fromArrayI32({
    List<int>? shape,
    required List<int> data,
  }) => Tensor._(TensorImpl.fromArrayI32(
    shape: shape,
    data: data,
  ));

  static Tensor<int> fromArrayI64({
    List<int>? shape,
    required List<int> data,
  }) => Tensor._(TensorImpl.fromArrayI64(
    shape: shape,
    data: data,
  ));

  static Tensor<int> fromArrayI8({
    List<int>? shape,
    required List<int> data,
  }) => Tensor._(TensorImpl.fromArrayI8(
    shape: shape,
    data: data,
  ));

  static Tensor<String> fromArrayString({
    List<int>? shape,
    required List<String> data,
  }) => Tensor._(TensorImpl.fromArrayString(
    shape: shape,
    data: data,
  ));

  static Tensor<int> fromArrayU16({
    List<int>? shape,
    required List<int> data,
  }) => Tensor._(TensorImpl.fromArrayU16(
    shape: shape,
    data: data,
  ));

  static Tensor<int> fromArrayU32({
    List<int>? shape,
    required List<int> data,
  }) => Tensor._(TensorImpl.fromArrayU32(
    shape: shape,
    data: data,
  ));

  static Tensor<int> fromArrayU64({
    List<int>? shape,
    required List<int> data,
  }) => Tensor._(TensorImpl.fromArrayU64(
    shape: shape,
    data: data,
  ));

  static Tensor<int> fromArrayU8({
    List<int>? shape,
    required List<int> data,
  }) => Tensor._(TensorImpl.fromArrayU8(
    shape: shape,
    data: data,
  ));

  /// A helper method for creating a [Tensor] from a [List]. You may optionally
  /// set the generic type [T] if the type of Tensor is known.
  static Tensor<T> fromArray<T>({
    required TensorElementType dtype,
    required List<dynamic> data,
    List<int>? shape,
  }) => switch (dtype) {
    TensorElementType.float32 => Tensor.fromArrayF32(shape: shape, data: data is List<double> ? data : data.map((e) => (e as num).toDouble()).toList()),
    TensorElementType.uint8 => Tensor.fromArrayU8(shape: shape, data: data is List<int> ? data : data.map((e) => (e as num).toInt()).toList()),
    TensorElementType.int8 => Tensor.fromArrayI8(shape: shape, data: data is List<int> ? data : data.map((e) => (e as num).toInt()).toList()),
    TensorElementType.uint16 => Tensor.fromArrayU16(shape: shape, data: data is List<int> ? data : data.map((e) => (e as num).toInt()).toList()),
    TensorElementType.int16 => Tensor.fromArrayI16(shape: shape, data: data is List<int> ? data : data.map((e) => (e as num).toInt()).toList()),
    TensorElementType.int32 => Tensor.fromArrayI32(shape: shape, data: data is List<int> ? data : data.map((e) => (e as num).toInt()).toList()),
    TensorElementType.int64 => Tensor.fromArrayI64(shape: shape, data: data is List<int> ? data : data.map((e) => (e as num).toInt()).toList()),
    TensorElementType.string => Tensor.fromArrayString(shape: shape, data: data is List<String> ? data : throw ArgumentError('Provided data is not List<String>, data: $data')),
    TensorElementType.bool => Tensor.fromArrayBool(shape: shape, data: data is List<bool> ? data : throw ArgumentError('Provided data is not List<bool>, data: $data')),
    TensorElementType.float16 => Tensor.fromArrayF32(shape: shape, data: data is List<double> ? data : data.map((e) => (e as num).toDouble()).toList()),
    TensorElementType.float64 => Tensor.fromArrayF64(shape: shape, data: data is List<double> ? data : data.map((e) => (e as num).toDouble()).toList()),
    TensorElementType.uint32 => Tensor.fromArrayU32(shape: shape, data: data is List<int> ? data : data.map((e) => (e as num).toInt()).toList()),
    TensorElementType.uint64 => Tensor.fromArrayU64(shape: shape, data: data is List<int> ? data : data.map((e) => (e as num).toInt()).toList()),
    TensorElementType.bfloat16 => throw ArgumentError('Unsupported data type ${TensorElementType.bfloat16}'),
    TensorElementType.complex64 => throw ArgumentError('Unsupported data type ${TensorElementType.complex64}'),
    TensorElementType.complex128 => throw ArgumentError('Unsupported data type ${TensorElementType.complex128}'),
    TensorElementType.float8E4M3Fn => throw ArgumentError('Unsupported data type ${TensorElementType.float8E4M3Fn}'),
    TensorElementType.float8E4M3Fnuz => throw ArgumentError('Unsupported data type ${TensorElementType.float8E4M3Fnuz}'),
    TensorElementType.float8E5M2 => throw ArgumentError('Unsupported data type ${TensorElementType.float8E5M2}'),
    TensorElementType.float8E5M2Fnuz => throw ArgumentError('Unsupported data type ${TensorElementType.float8E5M2Fnuz}'),
    TensorElementType.uint4 => throw ArgumentError('Unsupported data type ${TensorElementType.uint4}'),
    TensorElementType.int4 => throw ArgumentError('Unsupported data type ${TensorElementType.int4}'),
    TensorElementType.undefined => throw ArgumentError('Unsupported data type ${TensorElementType.undefined}'),
  } as Tensor<T>;

  /// Frees the memory allocated by [getDataPointer].
  static void _freeArrayPointer(ArrayPointer? pointer) {
    if (pointer == null) return;

    TensorImpl.freeF32Pointer(ptr: pointer);
  }

  static final Finalizer<_ArrayPointerWrapper> _finalizer = Finalizer((a) => a.dispose());

  final TensorImpl _tensor;

  final _ArrayPointerWrapper _arrayPointerWrapper = _ArrayPointerWrapper();

  Tensor._(this._tensor) {
    _finalizer.attach(this, _arrayPointerWrapper, detach: this);
  }

  bool _disposed = false;

  void dispose() {
    if (_disposed) return;
    _disposed = true;

    _finalizer.detach(this);
    _arrayPointerWrapper.dispose();
    _tensor.dispose();
  }

  TensorImpl get rawTensor => _tensor;

  TensorElementType get dtype => _tensor.dtype();

  List<int> get shape => _tensor.shape();

  bool get isDisposed => _tensor.isDisposed;

  List<T> get data => switch (dtype) {
    TensorElementType.float32 => _tensor.getDataF32().toList(),
    TensorElementType.uint8 => _tensor.getDataU8().toList(),
    TensorElementType.int8 => _tensor.getDataI8().toList(),
    TensorElementType.uint16 => _tensor.getDataU16().toList(),
    TensorElementType.int16 => _tensor.getDataI16().toList(),
    TensorElementType.int32 => _tensor.getDataI32().toList(),
    TensorElementType.int64 => _tensor.getDataI64(),
    TensorElementType.string => _tensor.getDataString(),
    TensorElementType.bool => _tensor.getDataBool(),
    TensorElementType.float16 => _tensor.getDataF32().toList(),
    TensorElementType.float64 => _tensor.getDataF64().toList(),
    TensorElementType.uint32 => _tensor.getDataU32().toList(),
    TensorElementType.uint64 => _tensor.getDataU64(),
    TensorElementType.bfloat16 => throw ArgumentError('Unsupported data type ${TensorElementType.bfloat16}'),
    TensorElementType.complex64 => throw ArgumentError('Unsupported data type ${TensorElementType.complex64}'),
    TensorElementType.complex128 => throw ArgumentError('Unsupported data type ${TensorElementType.complex128}'),
    TensorElementType.float8E4M3Fn => throw ArgumentError('Unsupported data type ${TensorElementType.float8E4M3Fn}'),
    TensorElementType.float8E4M3Fnuz => throw ArgumentError('Unsupported data type ${TensorElementType.float8E4M3Fnuz}'),
    TensorElementType.float8E5M2 => throw ArgumentError('Unsupported data type ${TensorElementType.float8E5M2}'),
    TensorElementType.float8E5M2Fnuz => throw ArgumentError('Unsupported data type ${TensorElementType.float8E5M2Fnuz}'),
    TensorElementType.uint4 => throw ArgumentError('Unsupported data type ${TensorElementType.uint4}'),
    TensorElementType.int4 => throw ArgumentError('Unsupported data type ${TensorElementType.int4}'),
    TensorElementType.undefined => throw ArgumentError('Unsupported data type ${TensorElementType.undefined}'),
  }.cast<T>();

  @override
  set length(int newLength) {
    throw StateError('Tensor is not growable');
  }

  @override
  int get length => shape.fold(1, (previous, e) => previous * e);

  @override
  T operator [](int index) => switch (dtype) {
    TensorElementType.float32 => _tensor.getIndexF32(index: index),
    TensorElementType.uint8 => _tensor.getIndexU8(index: index),
    TensorElementType.int8 => _tensor.getIndexI8(index: index),
    TensorElementType.uint16 => _tensor.getIndexU16(index: index),
    TensorElementType.int16 => _tensor.getIndexI16(index: index),
    TensorElementType.int32 => _tensor.getIndexI32(index: index),
    TensorElementType.int64 => _tensor.getIndexI64(index: index),
    TensorElementType.string => _tensor.getIndexString(index: index),
    TensorElementType.bool => _tensor.getIndexBool(index: index),
    TensorElementType.float16 => _tensor.getIndexF32(index: index),
    TensorElementType.float64 => _tensor.getIndexF64(index: index),
    TensorElementType.uint32 => _tensor.getIndexU32(index: index),
    TensorElementType.uint64 => _tensor.getIndexU64(index: index),
    TensorElementType.bfloat16 => throw ArgumentError('Unsupported data type ${TensorElementType.bfloat16}'),
    TensorElementType.complex64 => throw ArgumentError('Unsupported data type ${TensorElementType.complex64}'),
    TensorElementType.complex128 => throw ArgumentError('Unsupported data type ${TensorElementType.complex128}'),
    TensorElementType.float8E4M3Fn => throw ArgumentError('Unsupported data type ${TensorElementType.float8E4M3Fn}'),
    TensorElementType.float8E4M3Fnuz => throw ArgumentError('Unsupported data type ${TensorElementType.float8E4M3Fnuz}'),
    TensorElementType.float8E5M2 => throw ArgumentError('Unsupported data type ${TensorElementType.float8E5M2}'),
    TensorElementType.float8E5M2Fnuz => throw ArgumentError('Unsupported data type ${TensorElementType.float8E5M2Fnuz}'),
    TensorElementType.uint4 => throw ArgumentError('Unsupported data type ${TensorElementType.uint4}'),
    TensorElementType.int4 => throw ArgumentError('Unsupported data type ${TensorElementType.int4}'),
    TensorElementType.undefined => throw ArgumentError('Unsupported data type ${TensorElementType.undefined}'),
  } as T;

  @override
  void operator []=(int index, T value) {
    switch (dtype) {
      case TensorElementType.float32:
        _tensor.setIndexF32(index: index, value: value as double);
        break;
      case TensorElementType.uint8:
        _tensor.setIndexU8(index: index, value: value as int);
        break;
      case TensorElementType.int8:
        _tensor.setIndexI8(index: index, value: value as int);
        break;
      case TensorElementType.uint16:
        _tensor.setIndexU16(index: index, value: value as int);
        break;
      case TensorElementType.int16:
        _tensor.setIndexI16(index: index, value: value as int);
        break;
      case TensorElementType.int32:
        _tensor.setIndexI32(index: index, value: value as int);
        break;
      case TensorElementType.int64:
        _tensor.setIndexI64(index: index, value: value as int);
        break;
      case TensorElementType.string:
        throw ArgumentError('Unsupported data type ${TensorElementType.string}');
      case TensorElementType.bool:
        _tensor.setIndexBool(index: index, value: value as bool);
        break;
      case TensorElementType.float16:
        _tensor.setIndexF32(index: index, value: value as double);
        break;
      case TensorElementType.float64:
        _tensor.setIndexF64(index: index, value: value as double);
        break;
      case TensorElementType.uint32:
        _tensor.setIndexU32(index: index, value: value as int);
        break;
      case TensorElementType.uint64:
        _tensor.setIndexU64(index: index, value: value as int);
        break;
      case TensorElementType.bfloat16:
        throw ArgumentError('Unsupported data type ${TensorElementType.bfloat16}');
      case TensorElementType.complex64:
        throw ArgumentError('Unsupported data type ${TensorElementType.complex64}');
      case TensorElementType.complex128:
        throw ArgumentError('Unsupported data type ${TensorElementType.complex128}');
      case TensorElementType.float8E4M3Fn:
        throw ArgumentError('Unsupported data type ${TensorElementType.float8E4M3Fn}');
      case TensorElementType.float8E4M3Fnuz:
        throw ArgumentError('Unsupported data type ${TensorElementType.float8E4M3Fnuz}');
      case TensorElementType.float8E5M2:
        throw ArgumentError('Unsupported data type ${TensorElementType.float8E5M2}');
      case TensorElementType.float8E5M2Fnuz:
        throw ArgumentError('Unsupported data type ${TensorElementType.float8E5M2Fnuz}');
      case TensorElementType.uint4:
        throw ArgumentError('Unsupported data type ${TensorElementType.uint4}');
      case TensorElementType.int4:
        throw ArgumentError('Unsupported data type ${TensorElementType.int4}');
      case TensorElementType.undefined:
        throw ArgumentError('Unsupported data type ${TensorElementType.undefined}');
    }
  }

  /// Creates a copy of this tensor and its data on the same device it resides on.
  Tensor<T> clone() => Tensor._(_tensor.clone());

  /// If this Tensor's underlying data is mutable
  bool get isMutable => _tensor.isMutable();

  List<double>? _dataPointer;

  List<double> get dataPointer {
    if (_dataPointer != null) return _dataPointer!;

    final arrayPointerStruct = _tensor.getDataF32Pointer();
    _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

    final arrayPointer = ffi.Pointer<ffi.Float>.fromAddress(arrayPointerStruct.data);
    _dataPointer = arrayPointer.asTypedList(arrayPointerStruct.length);

    return _dataPointer!;
  }
}
