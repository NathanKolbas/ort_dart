import 'dart:collection';
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart' as pffi;
import 'package:ort/src/rust/api/memory.dart';
import 'dart:typed_data';

import 'package:ort/src/rust/api/tensor.dart';

export 'package:ort/src/rust/api/tensor.dart' show TensorElementType;
export 'package:ort/src/rust/api/memory.dart';

Tensor tensorFromImpl(TensorImpl tensor) => Tensor._(tensor);

/// This class is used so that [Finalizer] can be used to free the
/// [ArrayPointer].
class _ArrayPointerWrapper {
  final TensorElementType dtype;

  ArrayPointer? _arrayPointer;
  ArrayPointer? get arrayPointer => _arrayPointer;
  set arrayPointer(ArrayPointer? value) {
    dispose();
    _arrayPointer = value;
    _disposed = false;
  }

  bool _disposed = false;

  _ArrayPointerWrapper(this.dtype);

  void dispose() {
    // To prevent double free of memory
    if (_disposed) return;
    _disposed = true;

    Tensor._freeArrayPointer(dtype, arrayPointer);
  }
}

/// This is a wrapper class around an FFI pointer to a Rust's slice of bools.
/// Under the hood there is no bool in C but Rust uses 1 byte. To make sure that
/// the underlying data can still be updated and retrieved from the C array this
/// class is used. This way to anyone using this the list appears as
/// [List<bool>] but under the hood it still represents the correct data.
class BoolList with ListMixin<bool> {
  final Int8List int8list;

  BoolList(this.int8list);

  @override
  int get length => int8list.length;

  @override
  set length(int newLength) {
    throw StateError('BoolList is not growable');
  }

  @override
  bool operator [](int index) => int8list[index] != 0;

  @override
  void operator []=(int index, bool value) {
    int8list[index] = value ? 1 : 0;
  }
}

class Tensor<T> {
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
  static void _freeArrayPointer(TensorElementType dtype, ArrayPointer? arr) {
    if (arr == null) return;

    final free = switch (dtype) {
      TensorElementType.float32 => TensorImpl.freeF32Pointer,
      TensorElementType.uint8 => TensorImpl.freeU8Pointer,
      TensorElementType.int8 => TensorImpl.freeI8Pointer,
      TensorElementType.uint16 => TensorImpl.freeU16Pointer,
      TensorElementType.int16 => TensorImpl.freeI16Pointer,
      TensorElementType.int32 => TensorImpl.freeI32Pointer,
      TensorElementType.int64 => TensorImpl.freeI64Pointer,
      TensorElementType.string => TensorImpl.freeStringPointer,
      TensorElementType.bool => TensorImpl.freeBoolPointer,
      TensorElementType.float16 => TensorImpl.freeF32Pointer,
      TensorElementType.float64 => TensorImpl.freeF64Pointer,
      TensorElementType.uint32 => TensorImpl.freeU32Pointer,
      TensorElementType.uint64 => TensorImpl.freeU64Pointer,
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
    };

    free(arr: arr);
  }

  static final Finalizer<_ArrayPointerWrapper> _finalizer = Finalizer((a) => a.dispose());

  final TensorImpl _tensor;

  late final _ArrayPointerWrapper _arrayPointerWrapper = _ArrayPointerWrapper(dtype);

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

  /// **Note: If you are trying to get the Tensor's data use [data].**
  ///
  /// Extract the raw Tensor's data with the returned List pointing to the
  /// Tensor's underlying data.
  List<T> extractTensor() {
    switch (dtype) {
      case TensorElementType.float32:
        final arrayPointerStruct = _tensor.getDataF32Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Float>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
      case TensorElementType.uint8:
        final arrayPointerStruct = _tensor.getDataU8Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Uint8>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
      case TensorElementType.int8:
        final arrayPointerStruct = _tensor.getDataI8Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Int8>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
      case TensorElementType.uint16:
        final arrayPointerStruct = _tensor.getDataU16Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Uint16>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
      case TensorElementType.int16:
        final arrayPointerStruct = _tensor.getDataI16Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Int16>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
      case TensorElementType.int32:
        final arrayPointerStruct = _tensor.getDataI32Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Int32>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
      case TensorElementType.int64:
        final arrayPointerStruct = _tensor.getDataI64Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Int64>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
      case TensorElementType.string:
      // A String Tensor is not mutable so once the data is pulled that's it.

        final arrayPointerStruct = _tensor.getDataStringPointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Pointer<pffi.Utf8>>.fromAddress(arrayPointerStruct.ptr);
        List<String> data = [];
        int index = 0;
        while (true) {
          final charPointer = arrayPointer[index];
          if (charPointer == ffi.nullptr) break;

          data.add(charPointer.toDartString());
          index++;
        }
        _data = data;

        return _data!.cast<T>();
      case TensorElementType.bool:
        final arrayPointerStruct = _tensor.getDataBoolPointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Int8>.fromAddress(arrayPointerStruct.ptr);
        _data = BoolList(arrayPointer.asTypedList(arrayPointerStruct.len));

        return _data!.cast<T>();
      case TensorElementType.float16:
        final arrayPointerStruct = _tensor.getDataF32Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Float>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
      case TensorElementType.float64:
        final arrayPointerStruct = _tensor.getDataF64Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Double>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
      case TensorElementType.uint32:
        final arrayPointerStruct = _tensor.getDataU32Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Uint32>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
      case TensorElementType.uint64:
        final arrayPointerStruct = _tensor.getDataU64Pointer();
        _arrayPointerWrapper.arrayPointer = arrayPointerStruct;

        final arrayPointer = ffi.Pointer<ffi.Uint64>.fromAddress(arrayPointerStruct.ptr);
        _data = arrayPointer.asTypedList(arrayPointerStruct.len);

        return _data!.cast<T>();
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

  List? _data;

  List<T> get data {
    if (_data != null) return _data!.cast<T>();

    return extractTensor();
  }

  // @override
  // set length(int newLength) {
  //   throw StateError('Tensor is not growable');
  // }
  //
  // @override
  // int get length => shape.fold(1, (previous, e) => previous * e);
  //
  // @override
  // T operator [](int index) => data[index];
  //
  // @override
  // void operator []=(int index, T value) {
  //   if (!isMutable) throw StateError('Tensor is not mutable');
  //
  //   data[index] = value;
  // }

  /// Creates a copy of this tensor and its data on the same device it resides on.
  Tensor<T> clone() => Tensor._(_tensor.clone());

  /// If this Tensor's underlying data is mutable
  bool get isMutable => _tensor.isMutable();

  MemoryInfo memoryInfo() => _tensor.memoryInfo();
}
