// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'execution_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExecutionProvider {

 Object get field0;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionProvider&&const DeepCollectionEquality().equals(other.field0, field0));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(field0));

@override
String toString() {
  return 'ExecutionProvider(field0: $field0)';
}


}

/// @nodoc
class $ExecutionProviderCopyWith<$Res>  {
$ExecutionProviderCopyWith(ExecutionProvider _, $Res Function(ExecutionProvider) __);
}


/// Adds pattern-matching-related methods to [ExecutionProvider].
extension ExecutionProviderPatterns on ExecutionProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExecutionProvider_CoreML value)?  coreMl,TResult Function( ExecutionProvider_CPU value)?  cpu,TResult Function( ExecutionProvider_CUDA value)?  cuda,TResult Function( ExecutionProvider_DirectML value)?  directMl,TResult Function( ExecutionProvider_NNApi value)?  nnApi,TResult Function( ExecutionProvider_QNN value)?  qnn,TResult Function( ExecutionProvider_ROCm value)?  roCm,TResult Function( ExecutionProvider_TensorRT value)?  tensorRt,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExecutionProvider_CoreML() when coreMl != null:
return coreMl(_that);case ExecutionProvider_CPU() when cpu != null:
return cpu(_that);case ExecutionProvider_CUDA() when cuda != null:
return cuda(_that);case ExecutionProvider_DirectML() when directMl != null:
return directMl(_that);case ExecutionProvider_NNApi() when nnApi != null:
return nnApi(_that);case ExecutionProvider_QNN() when qnn != null:
return qnn(_that);case ExecutionProvider_ROCm() when roCm != null:
return roCm(_that);case ExecutionProvider_TensorRT() when tensorRt != null:
return tensorRt(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExecutionProvider_CoreML value)  coreMl,required TResult Function( ExecutionProvider_CPU value)  cpu,required TResult Function( ExecutionProvider_CUDA value)  cuda,required TResult Function( ExecutionProvider_DirectML value)  directMl,required TResult Function( ExecutionProvider_NNApi value)  nnApi,required TResult Function( ExecutionProvider_QNN value)  qnn,required TResult Function( ExecutionProvider_ROCm value)  roCm,required TResult Function( ExecutionProvider_TensorRT value)  tensorRt,}){
final _that = this;
switch (_that) {
case ExecutionProvider_CoreML():
return coreMl(_that);case ExecutionProvider_CPU():
return cpu(_that);case ExecutionProvider_CUDA():
return cuda(_that);case ExecutionProvider_DirectML():
return directMl(_that);case ExecutionProvider_NNApi():
return nnApi(_that);case ExecutionProvider_QNN():
return qnn(_that);case ExecutionProvider_ROCm():
return roCm(_that);case ExecutionProvider_TensorRT():
return tensorRt(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExecutionProvider_CoreML value)?  coreMl,TResult? Function( ExecutionProvider_CPU value)?  cpu,TResult? Function( ExecutionProvider_CUDA value)?  cuda,TResult? Function( ExecutionProvider_DirectML value)?  directMl,TResult? Function( ExecutionProvider_NNApi value)?  nnApi,TResult? Function( ExecutionProvider_QNN value)?  qnn,TResult? Function( ExecutionProvider_ROCm value)?  roCm,TResult? Function( ExecutionProvider_TensorRT value)?  tensorRt,}){
final _that = this;
switch (_that) {
case ExecutionProvider_CoreML() when coreMl != null:
return coreMl(_that);case ExecutionProvider_CPU() when cpu != null:
return cpu(_that);case ExecutionProvider_CUDA() when cuda != null:
return cuda(_that);case ExecutionProvider_DirectML() when directMl != null:
return directMl(_that);case ExecutionProvider_NNApi() when nnApi != null:
return nnApi(_that);case ExecutionProvider_QNN() when qnn != null:
return qnn(_that);case ExecutionProvider_ROCm() when roCm != null:
return roCm(_that);case ExecutionProvider_TensorRT() when tensorRt != null:
return tensorRt(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CoreMLExecutionProvider field0)?  coreMl,TResult Function( CPUExecutionProvider field0)?  cpu,TResult Function( CUDAExecutionProvider field0)?  cuda,TResult Function( DirectMLExecutionProvider field0)?  directMl,TResult Function( NNAPIExecutionProvider field0)?  nnApi,TResult Function( QNNExecutionProvider field0)?  qnn,TResult Function( ROCmExecutionProvider field0)?  roCm,TResult Function( TensorRTExecutionProvider field0)?  tensorRt,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExecutionProvider_CoreML() when coreMl != null:
return coreMl(_that.field0);case ExecutionProvider_CPU() when cpu != null:
return cpu(_that.field0);case ExecutionProvider_CUDA() when cuda != null:
return cuda(_that.field0);case ExecutionProvider_DirectML() when directMl != null:
return directMl(_that.field0);case ExecutionProvider_NNApi() when nnApi != null:
return nnApi(_that.field0);case ExecutionProvider_QNN() when qnn != null:
return qnn(_that.field0);case ExecutionProvider_ROCm() when roCm != null:
return roCm(_that.field0);case ExecutionProvider_TensorRT() when tensorRt != null:
return tensorRt(_that.field0);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CoreMLExecutionProvider field0)  coreMl,required TResult Function( CPUExecutionProvider field0)  cpu,required TResult Function( CUDAExecutionProvider field0)  cuda,required TResult Function( DirectMLExecutionProvider field0)  directMl,required TResult Function( NNAPIExecutionProvider field0)  nnApi,required TResult Function( QNNExecutionProvider field0)  qnn,required TResult Function( ROCmExecutionProvider field0)  roCm,required TResult Function( TensorRTExecutionProvider field0)  tensorRt,}) {final _that = this;
switch (_that) {
case ExecutionProvider_CoreML():
return coreMl(_that.field0);case ExecutionProvider_CPU():
return cpu(_that.field0);case ExecutionProvider_CUDA():
return cuda(_that.field0);case ExecutionProvider_DirectML():
return directMl(_that.field0);case ExecutionProvider_NNApi():
return nnApi(_that.field0);case ExecutionProvider_QNN():
return qnn(_that.field0);case ExecutionProvider_ROCm():
return roCm(_that.field0);case ExecutionProvider_TensorRT():
return tensorRt(_that.field0);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CoreMLExecutionProvider field0)?  coreMl,TResult? Function( CPUExecutionProvider field0)?  cpu,TResult? Function( CUDAExecutionProvider field0)?  cuda,TResult? Function( DirectMLExecutionProvider field0)?  directMl,TResult? Function( NNAPIExecutionProvider field0)?  nnApi,TResult? Function( QNNExecutionProvider field0)?  qnn,TResult? Function( ROCmExecutionProvider field0)?  roCm,TResult? Function( TensorRTExecutionProvider field0)?  tensorRt,}) {final _that = this;
switch (_that) {
case ExecutionProvider_CoreML() when coreMl != null:
return coreMl(_that.field0);case ExecutionProvider_CPU() when cpu != null:
return cpu(_that.field0);case ExecutionProvider_CUDA() when cuda != null:
return cuda(_that.field0);case ExecutionProvider_DirectML() when directMl != null:
return directMl(_that.field0);case ExecutionProvider_NNApi() when nnApi != null:
return nnApi(_that.field0);case ExecutionProvider_QNN() when qnn != null:
return qnn(_that.field0);case ExecutionProvider_ROCm() when roCm != null:
return roCm(_that.field0);case ExecutionProvider_TensorRT() when tensorRt != null:
return tensorRt(_that.field0);case _:
  return null;

}
}

}

/// @nodoc


class ExecutionProvider_CoreML extends ExecutionProvider {
  const ExecutionProvider_CoreML(this.field0): super._();
  

@override final  CoreMLExecutionProvider field0;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionProvider_CoreMLCopyWith<ExecutionProvider_CoreML> get copyWith => _$ExecutionProvider_CoreMLCopyWithImpl<ExecutionProvider_CoreML>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionProvider_CoreML&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ExecutionProvider.coreMl(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ExecutionProvider_CoreMLCopyWith<$Res> implements $ExecutionProviderCopyWith<$Res> {
  factory $ExecutionProvider_CoreMLCopyWith(ExecutionProvider_CoreML value, $Res Function(ExecutionProvider_CoreML) _then) = _$ExecutionProvider_CoreMLCopyWithImpl;
@useResult
$Res call({
 CoreMLExecutionProvider field0
});


$CoreMLExecutionProviderCopyWith<$Res> get field0;

}
/// @nodoc
class _$ExecutionProvider_CoreMLCopyWithImpl<$Res>
    implements $ExecutionProvider_CoreMLCopyWith<$Res> {
  _$ExecutionProvider_CoreMLCopyWithImpl(this._self, this._then);

  final ExecutionProvider_CoreML _self;
  final $Res Function(ExecutionProvider_CoreML) _then;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ExecutionProvider_CoreML(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as CoreMLExecutionProvider,
  ));
}

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoreMLExecutionProviderCopyWith<$Res> get field0 {
  
  return $CoreMLExecutionProviderCopyWith<$Res>(_self.field0, (value) {
    return _then(_self.copyWith(field0: value));
  });
}
}

/// @nodoc


class ExecutionProvider_CPU extends ExecutionProvider {
  const ExecutionProvider_CPU(this.field0): super._();
  

@override final  CPUExecutionProvider field0;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionProvider_CPUCopyWith<ExecutionProvider_CPU> get copyWith => _$ExecutionProvider_CPUCopyWithImpl<ExecutionProvider_CPU>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionProvider_CPU&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ExecutionProvider.cpu(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ExecutionProvider_CPUCopyWith<$Res> implements $ExecutionProviderCopyWith<$Res> {
  factory $ExecutionProvider_CPUCopyWith(ExecutionProvider_CPU value, $Res Function(ExecutionProvider_CPU) _then) = _$ExecutionProvider_CPUCopyWithImpl;
@useResult
$Res call({
 CPUExecutionProvider field0
});




}
/// @nodoc
class _$ExecutionProvider_CPUCopyWithImpl<$Res>
    implements $ExecutionProvider_CPUCopyWith<$Res> {
  _$ExecutionProvider_CPUCopyWithImpl(this._self, this._then);

  final ExecutionProvider_CPU _self;
  final $Res Function(ExecutionProvider_CPU) _then;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ExecutionProvider_CPU(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as CPUExecutionProvider,
  ));
}


}

/// @nodoc


class ExecutionProvider_CUDA extends ExecutionProvider {
  const ExecutionProvider_CUDA(this.field0): super._();
  

@override final  CUDAExecutionProvider field0;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionProvider_CUDACopyWith<ExecutionProvider_CUDA> get copyWith => _$ExecutionProvider_CUDACopyWithImpl<ExecutionProvider_CUDA>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionProvider_CUDA&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ExecutionProvider.cuda(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ExecutionProvider_CUDACopyWith<$Res> implements $ExecutionProviderCopyWith<$Res> {
  factory $ExecutionProvider_CUDACopyWith(ExecutionProvider_CUDA value, $Res Function(ExecutionProvider_CUDA) _then) = _$ExecutionProvider_CUDACopyWithImpl;
@useResult
$Res call({
 CUDAExecutionProvider field0
});


$CUDAExecutionProviderCopyWith<$Res> get field0;

}
/// @nodoc
class _$ExecutionProvider_CUDACopyWithImpl<$Res>
    implements $ExecutionProvider_CUDACopyWith<$Res> {
  _$ExecutionProvider_CUDACopyWithImpl(this._self, this._then);

  final ExecutionProvider_CUDA _self;
  final $Res Function(ExecutionProvider_CUDA) _then;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ExecutionProvider_CUDA(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as CUDAExecutionProvider,
  ));
}

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CUDAExecutionProviderCopyWith<$Res> get field0 {
  
  return $CUDAExecutionProviderCopyWith<$Res>(_self.field0, (value) {
    return _then(_self.copyWith(field0: value));
  });
}
}

/// @nodoc


class ExecutionProvider_DirectML extends ExecutionProvider {
  const ExecutionProvider_DirectML(this.field0): super._();
  

@override final  DirectMLExecutionProvider field0;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionProvider_DirectMLCopyWith<ExecutionProvider_DirectML> get copyWith => _$ExecutionProvider_DirectMLCopyWithImpl<ExecutionProvider_DirectML>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionProvider_DirectML&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ExecutionProvider.directMl(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ExecutionProvider_DirectMLCopyWith<$Res> implements $ExecutionProviderCopyWith<$Res> {
  factory $ExecutionProvider_DirectMLCopyWith(ExecutionProvider_DirectML value, $Res Function(ExecutionProvider_DirectML) _then) = _$ExecutionProvider_DirectMLCopyWithImpl;
@useResult
$Res call({
 DirectMLExecutionProvider field0
});


$DirectMLExecutionProviderCopyWith<$Res> get field0;

}
/// @nodoc
class _$ExecutionProvider_DirectMLCopyWithImpl<$Res>
    implements $ExecutionProvider_DirectMLCopyWith<$Res> {
  _$ExecutionProvider_DirectMLCopyWithImpl(this._self, this._then);

  final ExecutionProvider_DirectML _self;
  final $Res Function(ExecutionProvider_DirectML) _then;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ExecutionProvider_DirectML(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as DirectMLExecutionProvider,
  ));
}

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DirectMLExecutionProviderCopyWith<$Res> get field0 {
  
  return $DirectMLExecutionProviderCopyWith<$Res>(_self.field0, (value) {
    return _then(_self.copyWith(field0: value));
  });
}
}

/// @nodoc


class ExecutionProvider_NNApi extends ExecutionProvider {
  const ExecutionProvider_NNApi(this.field0): super._();
  

@override final  NNAPIExecutionProvider field0;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionProvider_NNApiCopyWith<ExecutionProvider_NNApi> get copyWith => _$ExecutionProvider_NNApiCopyWithImpl<ExecutionProvider_NNApi>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionProvider_NNApi&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ExecutionProvider.nnApi(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ExecutionProvider_NNApiCopyWith<$Res> implements $ExecutionProviderCopyWith<$Res> {
  factory $ExecutionProvider_NNApiCopyWith(ExecutionProvider_NNApi value, $Res Function(ExecutionProvider_NNApi) _then) = _$ExecutionProvider_NNApiCopyWithImpl;
@useResult
$Res call({
 NNAPIExecutionProvider field0
});


$NNAPIExecutionProviderCopyWith<$Res> get field0;

}
/// @nodoc
class _$ExecutionProvider_NNApiCopyWithImpl<$Res>
    implements $ExecutionProvider_NNApiCopyWith<$Res> {
  _$ExecutionProvider_NNApiCopyWithImpl(this._self, this._then);

  final ExecutionProvider_NNApi _self;
  final $Res Function(ExecutionProvider_NNApi) _then;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ExecutionProvider_NNApi(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as NNAPIExecutionProvider,
  ));
}

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NNAPIExecutionProviderCopyWith<$Res> get field0 {
  
  return $NNAPIExecutionProviderCopyWith<$Res>(_self.field0, (value) {
    return _then(_self.copyWith(field0: value));
  });
}
}

/// @nodoc


class ExecutionProvider_QNN extends ExecutionProvider {
  const ExecutionProvider_QNN(this.field0): super._();
  

@override final  QNNExecutionProvider field0;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionProvider_QNNCopyWith<ExecutionProvider_QNN> get copyWith => _$ExecutionProvider_QNNCopyWithImpl<ExecutionProvider_QNN>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionProvider_QNN&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ExecutionProvider.qnn(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ExecutionProvider_QNNCopyWith<$Res> implements $ExecutionProviderCopyWith<$Res> {
  factory $ExecutionProvider_QNNCopyWith(ExecutionProvider_QNN value, $Res Function(ExecutionProvider_QNN) _then) = _$ExecutionProvider_QNNCopyWithImpl;
@useResult
$Res call({
 QNNExecutionProvider field0
});


$QNNExecutionProviderCopyWith<$Res> get field0;

}
/// @nodoc
class _$ExecutionProvider_QNNCopyWithImpl<$Res>
    implements $ExecutionProvider_QNNCopyWith<$Res> {
  _$ExecutionProvider_QNNCopyWithImpl(this._self, this._then);

  final ExecutionProvider_QNN _self;
  final $Res Function(ExecutionProvider_QNN) _then;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ExecutionProvider_QNN(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as QNNExecutionProvider,
  ));
}

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QNNExecutionProviderCopyWith<$Res> get field0 {
  
  return $QNNExecutionProviderCopyWith<$Res>(_self.field0, (value) {
    return _then(_self.copyWith(field0: value));
  });
}
}

/// @nodoc


class ExecutionProvider_ROCm extends ExecutionProvider {
  const ExecutionProvider_ROCm(this.field0): super._();
  

@override final  ROCmExecutionProvider field0;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionProvider_ROCmCopyWith<ExecutionProvider_ROCm> get copyWith => _$ExecutionProvider_ROCmCopyWithImpl<ExecutionProvider_ROCm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionProvider_ROCm&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ExecutionProvider.roCm(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ExecutionProvider_ROCmCopyWith<$Res> implements $ExecutionProviderCopyWith<$Res> {
  factory $ExecutionProvider_ROCmCopyWith(ExecutionProvider_ROCm value, $Res Function(ExecutionProvider_ROCm) _then) = _$ExecutionProvider_ROCmCopyWithImpl;
@useResult
$Res call({
 ROCmExecutionProvider field0
});


$ROCmExecutionProviderCopyWith<$Res> get field0;

}
/// @nodoc
class _$ExecutionProvider_ROCmCopyWithImpl<$Res>
    implements $ExecutionProvider_ROCmCopyWith<$Res> {
  _$ExecutionProvider_ROCmCopyWithImpl(this._self, this._then);

  final ExecutionProvider_ROCm _self;
  final $Res Function(ExecutionProvider_ROCm) _then;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ExecutionProvider_ROCm(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as ROCmExecutionProvider,
  ));
}

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ROCmExecutionProviderCopyWith<$Res> get field0 {
  
  return $ROCmExecutionProviderCopyWith<$Res>(_self.field0, (value) {
    return _then(_self.copyWith(field0: value));
  });
}
}

/// @nodoc


class ExecutionProvider_TensorRT extends ExecutionProvider {
  const ExecutionProvider_TensorRT(this.field0): super._();
  

@override final  TensorRTExecutionProvider field0;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionProvider_TensorRTCopyWith<ExecutionProvider_TensorRT> get copyWith => _$ExecutionProvider_TensorRTCopyWithImpl<ExecutionProvider_TensorRT>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionProvider_TensorRT&&(identical(other.field0, field0) || other.field0 == field0));
}


@override
int get hashCode => Object.hash(runtimeType,field0);

@override
String toString() {
  return 'ExecutionProvider.tensorRt(field0: $field0)';
}


}

/// @nodoc
abstract mixin class $ExecutionProvider_TensorRTCopyWith<$Res> implements $ExecutionProviderCopyWith<$Res> {
  factory $ExecutionProvider_TensorRTCopyWith(ExecutionProvider_TensorRT value, $Res Function(ExecutionProvider_TensorRT) _then) = _$ExecutionProvider_TensorRTCopyWithImpl;
@useResult
$Res call({
 TensorRTExecutionProvider field0
});


$TensorRTExecutionProviderCopyWith<$Res> get field0;

}
/// @nodoc
class _$ExecutionProvider_TensorRTCopyWithImpl<$Res>
    implements $ExecutionProvider_TensorRTCopyWith<$Res> {
  _$ExecutionProvider_TensorRTCopyWithImpl(this._self, this._then);

  final ExecutionProvider_TensorRT _self;
  final $Res Function(ExecutionProvider_TensorRT) _then;

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field0 = null,}) {
  return _then(ExecutionProvider_TensorRT(
null == field0 ? _self.field0 : field0 // ignore: cast_nullable_to_non_nullable
as TensorRTExecutionProvider,
  ));
}

/// Create a copy of ExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TensorRTExecutionProviderCopyWith<$Res> get field0 {
  
  return $TensorRTExecutionProviderCopyWith<$Res>(_self.field0, (value) {
    return _then(_self.copyWith(field0: value));
  });
}
}

// dart format on
