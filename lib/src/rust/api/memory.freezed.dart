// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AllocationDevice {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice()';
}


}

/// @nodoc
class $AllocationDeviceCopyWith<$Res>  {
$AllocationDeviceCopyWith(AllocationDevice _, $Res Function(AllocationDevice) __);
}


/// Adds pattern-matching-related methods to [AllocationDevice].
extension AllocationDevicePatterns on AllocationDevice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AllocationDevice_Cpu value)?  cpu,TResult Function( AllocationDevice_Cuda value)?  cuda,TResult Function( AllocationDevice_CudaPinned value)?  cudaPinned,TResult Function( AllocationDevice_Cann value)?  cann,TResult Function( AllocationDevice_CannPinned value)?  cannPinned,TResult Function( AllocationDevice_DirectML value)?  directMl,TResult Function( AllocationDevice_Hip value)?  hip,TResult Function( AllocationDevice_HipPinned value)?  hipPinned,TResult Function( AllocationDevice_OpenVinoCpu value)?  openVinoCpu,TResult Function( AllocationDevice_OpenVinoGpu value)?  openVinoGpu,TResult Function( AllocationDevice_QnnHtpShared value)?  qnnHtpShared,TResult Function( AllocationDevice_WebGpuBuffer value)?  webGpuBuffer,TResult Function( AllocationDevice_Other value)?  other,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AllocationDevice_Cpu() when cpu != null:
return cpu(_that);case AllocationDevice_Cuda() when cuda != null:
return cuda(_that);case AllocationDevice_CudaPinned() when cudaPinned != null:
return cudaPinned(_that);case AllocationDevice_Cann() when cann != null:
return cann(_that);case AllocationDevice_CannPinned() when cannPinned != null:
return cannPinned(_that);case AllocationDevice_DirectML() when directMl != null:
return directMl(_that);case AllocationDevice_Hip() when hip != null:
return hip(_that);case AllocationDevice_HipPinned() when hipPinned != null:
return hipPinned(_that);case AllocationDevice_OpenVinoCpu() when openVinoCpu != null:
return openVinoCpu(_that);case AllocationDevice_OpenVinoGpu() when openVinoGpu != null:
return openVinoGpu(_that);case AllocationDevice_QnnHtpShared() when qnnHtpShared != null:
return qnnHtpShared(_that);case AllocationDevice_WebGpuBuffer() when webGpuBuffer != null:
return webGpuBuffer(_that);case AllocationDevice_Other() when other != null:
return other(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AllocationDevice_Cpu value)  cpu,required TResult Function( AllocationDevice_Cuda value)  cuda,required TResult Function( AllocationDevice_CudaPinned value)  cudaPinned,required TResult Function( AllocationDevice_Cann value)  cann,required TResult Function( AllocationDevice_CannPinned value)  cannPinned,required TResult Function( AllocationDevice_DirectML value)  directMl,required TResult Function( AllocationDevice_Hip value)  hip,required TResult Function( AllocationDevice_HipPinned value)  hipPinned,required TResult Function( AllocationDevice_OpenVinoCpu value)  openVinoCpu,required TResult Function( AllocationDevice_OpenVinoGpu value)  openVinoGpu,required TResult Function( AllocationDevice_QnnHtpShared value)  qnnHtpShared,required TResult Function( AllocationDevice_WebGpuBuffer value)  webGpuBuffer,required TResult Function( AllocationDevice_Other value)  other,}){
final _that = this;
switch (_that) {
case AllocationDevice_Cpu():
return cpu(_that);case AllocationDevice_Cuda():
return cuda(_that);case AllocationDevice_CudaPinned():
return cudaPinned(_that);case AllocationDevice_Cann():
return cann(_that);case AllocationDevice_CannPinned():
return cannPinned(_that);case AllocationDevice_DirectML():
return directMl(_that);case AllocationDevice_Hip():
return hip(_that);case AllocationDevice_HipPinned():
return hipPinned(_that);case AllocationDevice_OpenVinoCpu():
return openVinoCpu(_that);case AllocationDevice_OpenVinoGpu():
return openVinoGpu(_that);case AllocationDevice_QnnHtpShared():
return qnnHtpShared(_that);case AllocationDevice_WebGpuBuffer():
return webGpuBuffer(_that);case AllocationDevice_Other():
return other(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AllocationDevice_Cpu value)?  cpu,TResult? Function( AllocationDevice_Cuda value)?  cuda,TResult? Function( AllocationDevice_CudaPinned value)?  cudaPinned,TResult? Function( AllocationDevice_Cann value)?  cann,TResult? Function( AllocationDevice_CannPinned value)?  cannPinned,TResult? Function( AllocationDevice_DirectML value)?  directMl,TResult? Function( AllocationDevice_Hip value)?  hip,TResult? Function( AllocationDevice_HipPinned value)?  hipPinned,TResult? Function( AllocationDevice_OpenVinoCpu value)?  openVinoCpu,TResult? Function( AllocationDevice_OpenVinoGpu value)?  openVinoGpu,TResult? Function( AllocationDevice_QnnHtpShared value)?  qnnHtpShared,TResult? Function( AllocationDevice_WebGpuBuffer value)?  webGpuBuffer,TResult? Function( AllocationDevice_Other value)?  other,}){
final _that = this;
switch (_that) {
case AllocationDevice_Cpu() when cpu != null:
return cpu(_that);case AllocationDevice_Cuda() when cuda != null:
return cuda(_that);case AllocationDevice_CudaPinned() when cudaPinned != null:
return cudaPinned(_that);case AllocationDevice_Cann() when cann != null:
return cann(_that);case AllocationDevice_CannPinned() when cannPinned != null:
return cannPinned(_that);case AllocationDevice_DirectML() when directMl != null:
return directMl(_that);case AllocationDevice_Hip() when hip != null:
return hip(_that);case AllocationDevice_HipPinned() when hipPinned != null:
return hipPinned(_that);case AllocationDevice_OpenVinoCpu() when openVinoCpu != null:
return openVinoCpu(_that);case AllocationDevice_OpenVinoGpu() when openVinoGpu != null:
return openVinoGpu(_that);case AllocationDevice_QnnHtpShared() when qnnHtpShared != null:
return qnnHtpShared(_that);case AllocationDevice_WebGpuBuffer() when webGpuBuffer != null:
return webGpuBuffer(_that);case AllocationDevice_Other() when other != null:
return other(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  cpu,TResult Function()?  cuda,TResult Function()?  cudaPinned,TResult Function()?  cann,TResult Function()?  cannPinned,TResult Function()?  directMl,TResult Function()?  hip,TResult Function()?  hipPinned,TResult Function()?  openVinoCpu,TResult Function()?  openVinoGpu,TResult Function()?  qnnHtpShared,TResult Function()?  webGpuBuffer,TResult Function( String field0)?  other,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AllocationDevice_Cpu() when cpu != null:
return cpu();case AllocationDevice_Cuda() when cuda != null:
return cuda();case AllocationDevice_CudaPinned() when cudaPinned != null:
return cudaPinned();case AllocationDevice_Cann() when cann != null:
return cann();case AllocationDevice_CannPinned() when cannPinned != null:
return cannPinned();case AllocationDevice_DirectML() when directMl != null:
return directMl();case AllocationDevice_Hip() when hip != null:
return hip();case AllocationDevice_HipPinned() when hipPinned != null:
return hipPinned();case AllocationDevice_OpenVinoCpu() when openVinoCpu != null:
return openVinoCpu();case AllocationDevice_OpenVinoGpu() when openVinoGpu != null:
return openVinoGpu();case AllocationDevice_QnnHtpShared() when qnnHtpShared != null:
return qnnHtpShared();case AllocationDevice_WebGpuBuffer() when webGpuBuffer != null:
return webGpuBuffer();case AllocationDevice_Other() when other != null:
return other(_that.field0);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  cpu,required TResult Function()  cuda,required TResult Function()  cudaPinned,required TResult Function()  cann,required TResult Function()  cannPinned,required TResult Function()  directMl,required TResult Function()  hip,required TResult Function()  hipPinned,required TResult Function()  openVinoCpu,required TResult Function()  openVinoGpu,required TResult Function()  qnnHtpShared,required TResult Function()  webGpuBuffer,required TResult Function( String field0)  other,}) {final _that = this;
switch (_that) {
case AllocationDevice_Cpu():
return cpu();case AllocationDevice_Cuda():
return cuda();case AllocationDevice_CudaPinned():
return cudaPinned();case AllocationDevice_Cann():
return cann();case AllocationDevice_CannPinned():
return cannPinned();case AllocationDevice_DirectML():
return directMl();case AllocationDevice_Hip():
return hip();case AllocationDevice_HipPinned():
return hipPinned();case AllocationDevice_OpenVinoCpu():
return openVinoCpu();case AllocationDevice_OpenVinoGpu():
return openVinoGpu();case AllocationDevice_QnnHtpShared():
return qnnHtpShared();case AllocationDevice_WebGpuBuffer():
return webGpuBuffer();case AllocationDevice_Other():
return other(_that.field0);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  cpu,TResult? Function()?  cuda,TResult? Function()?  cudaPinned,TResult? Function()?  cann,TResult? Function()?  cannPinned,TResult? Function()?  directMl,TResult? Function()?  hip,TResult? Function()?  hipPinned,TResult? Function()?  openVinoCpu,TResult? Function()?  openVinoGpu,TResult? Function()?  qnnHtpShared,TResult? Function()?  webGpuBuffer,TResult? Function( String field0)?  other,}) {final _that = this;
switch (_that) {
case AllocationDevice_Cpu() when cpu != null:
return cpu();case AllocationDevice_Cuda() when cuda != null:
return cuda();case AllocationDevice_CudaPinned() when cudaPinned != null:
return cudaPinned();case AllocationDevice_Cann() when cann != null:
return cann();case AllocationDevice_CannPinned() when cannPinned != null:
return cannPinned();case AllocationDevice_DirectML() when directMl != null:
return directMl();case AllocationDevice_Hip() when hip != null:
return hip();case AllocationDevice_HipPinned() when hipPinned != null:
return hipPinned();case AllocationDevice_OpenVinoCpu() when openVinoCpu != null:
return openVinoCpu();case AllocationDevice_OpenVinoGpu() when openVinoGpu != null:
return openVinoGpu();case AllocationDevice_QnnHtpShared() when qnnHtpShared != null:
return qnnHtpShared();case AllocationDevice_WebGpuBuffer() when webGpuBuffer != null:
return webGpuBuffer();case AllocationDevice_Other() when other != null:
return other(_that.field0);case _:
  return null;

}
}

}

/// @nodoc


class AllocationDevice_Cpu extends AllocationDevice {
  const AllocationDevice_Cpu(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_Cpu);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.cpu()';
}


}




/// @nodoc


class AllocationDevice_Cuda extends AllocationDevice {
  const AllocationDevice_Cuda(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_Cuda);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.cuda()';
}


}




/// @nodoc


class AllocationDevice_CudaPinned extends AllocationDevice {
  const AllocationDevice_CudaPinned(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_CudaPinned);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.cudaPinned()';
}


}




/// @nodoc


class AllocationDevice_Cann extends AllocationDevice {
  const AllocationDevice_Cann(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_Cann);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.cann()';
}


}




/// @nodoc


class AllocationDevice_CannPinned extends AllocationDevice {
  const AllocationDevice_CannPinned(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_CannPinned);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.cannPinned()';
}


}




/// @nodoc


class AllocationDevice_DirectML extends AllocationDevice {
  const AllocationDevice_DirectML(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_DirectML);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.directMl()';
}


}




/// @nodoc


class AllocationDevice_Hip extends AllocationDevice {
  const AllocationDevice_Hip(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_Hip);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.hip()';
}


}




/// @nodoc


class AllocationDevice_HipPinned extends AllocationDevice {
  const AllocationDevice_HipPinned(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_HipPinned);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.hipPinned()';
}


}




/// @nodoc


class AllocationDevice_OpenVinoCpu extends AllocationDevice {
  const AllocationDevice_OpenVinoCpu(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_OpenVinoCpu);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.openVinoCpu()';
}


}




/// @nodoc


class AllocationDevice_OpenVinoGpu extends AllocationDevice {
  const AllocationDevice_OpenVinoGpu(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_OpenVinoGpu);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.openVinoGpu()';
}


}




/// @nodoc


class AllocationDevice_QnnHtpShared extends AllocationDevice {
  const AllocationDevice_QnnHtpShared(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_QnnHtpShared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.qnnHtpShared()';
}


}




/// @nodoc


class AllocationDevice_WebGpuBuffer extends AllocationDevice {
  const AllocationDevice_WebGpuBuffer(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_WebGpuBuffer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AllocationDevice.webGpuBuffer()';
}


}




/// @nodoc


class AllocationDevice_Other extends AllocationDevice {
  const AllocationDevice_Other(this.field0): super._();
  

 final  String field0;

/// Create a copy of AllocationDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllocationDevice_OtherCopyWith<AllocationDevice_Other> get copyWith => _$AllocationDevice_OtherCopyWithImpl<AllocationDevice_Other>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationDevice_Other&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'AllocationDevice.other(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $AllocationDevice_OtherCopyWith<$Res> implements $AllocationDeviceCopyWith<$Res> {
  factory $AllocationDevice_OtherCopyWith(AllocationDevice_Other value, $Res Function(AllocationDevice_Other) _then) = _$AllocationDevice_OtherCopyWithImpl;
@useResult
$Res call({
 String field0
});




}
/// @nodoc
class _$AllocationDevice_OtherCopyWithImpl<$Res>
    implements $AllocationDevice_OtherCopyWith<$Res> {
  _$AllocationDevice_OtherCopyWithImpl(this._self, this._then);

  final AllocationDevice_Other _self;
  final $Res Function(AllocationDevice_Other) _then;

/// Create a copy of AllocationDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(AllocationDevice_Other(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
