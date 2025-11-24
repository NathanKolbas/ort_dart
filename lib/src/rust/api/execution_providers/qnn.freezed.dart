// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qnn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QNNExecutionProvider {

 String? get backendPath; QNNProfilingLevel? get profiling; String? get profilingPath; int? get rpcControlLatency; int? get vtcmMb; QNNPerformanceMode? get performanceMode; String? get saverPath; QNNContextPriority? get contextPriority; int? get htpGraphFinalizationOptimizationMode; String? get socModel; int? get htpArch; int? get deviceId; bool? get htpFp16Precision; bool? get offloadGraphIoQuantization;
/// Create a copy of QNNExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QNNExecutionProviderCopyWith<QNNExecutionProvider> get copyWith => _$QNNExecutionProviderCopyWithImpl<QNNExecutionProvider>(this as QNNExecutionProvider, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QNNExecutionProvider&&(identical(other.backendPath, backendPath) || other.backendPath == backendPath)&&(identical(other.profiling, profiling) || other.profiling == profiling)&&(identical(other.profilingPath, profilingPath) || other.profilingPath == profilingPath)&&(identical(other.rpcControlLatency, rpcControlLatency) || other.rpcControlLatency == rpcControlLatency)&&(identical(other.vtcmMb, vtcmMb) || other.vtcmMb == vtcmMb)&&(identical(other.performanceMode, performanceMode) || other.performanceMode == performanceMode)&&(identical(other.saverPath, saverPath) || other.saverPath == saverPath)&&(identical(other.contextPriority, contextPriority) || other.contextPriority == contextPriority)&&(identical(other.htpGraphFinalizationOptimizationMode, htpGraphFinalizationOptimizationMode) || other.htpGraphFinalizationOptimizationMode == htpGraphFinalizationOptimizationMode)&&(identical(other.socModel, socModel) || other.socModel == socModel)&&(identical(other.htpArch, htpArch) || other.htpArch == htpArch)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.htpFp16Precision, htpFp16Precision) || other.htpFp16Precision == htpFp16Precision)&&(identical(other.offloadGraphIoQuantization, offloadGraphIoQuantization) || other.offloadGraphIoQuantization == offloadGraphIoQuantization));
}


@override
int get hashCode => Object.hash(runtimeType,backendPath,profiling,profilingPath,rpcControlLatency,vtcmMb,performanceMode,saverPath,contextPriority,htpGraphFinalizationOptimizationMode,socModel,htpArch,deviceId,htpFp16Precision,offloadGraphIoQuantization);

@override
String toString() {
  return 'QNNExecutionProvider(backendPath: $backendPath, profiling: $profiling, profilingPath: $profilingPath, rpcControlLatency: $rpcControlLatency, vtcmMb: $vtcmMb, performanceMode: $performanceMode, saverPath: $saverPath, contextPriority: $contextPriority, htpGraphFinalizationOptimizationMode: $htpGraphFinalizationOptimizationMode, socModel: $socModel, htpArch: $htpArch, deviceId: $deviceId, htpFp16Precision: $htpFp16Precision, offloadGraphIoQuantization: $offloadGraphIoQuantization)';
}


}

/// @nodoc
abstract mixin class $QNNExecutionProviderCopyWith<$Res>  {
  factory $QNNExecutionProviderCopyWith(QNNExecutionProvider value, $Res Function(QNNExecutionProvider) _then) = _$QNNExecutionProviderCopyWithImpl;
@useResult
$Res call({
 String? backendPath, QNNProfilingLevel? profiling, String? profilingPath, int? rpcControlLatency, int? vtcmMb, QNNPerformanceMode? performanceMode, String? saverPath, QNNContextPriority? contextPriority, int? htpGraphFinalizationOptimizationMode, String? socModel, int? htpArch, int? deviceId, bool? htpFp16Precision, bool? offloadGraphIoQuantization
});




}
/// @nodoc
class _$QNNExecutionProviderCopyWithImpl<$Res>
    implements $QNNExecutionProviderCopyWith<$Res> {
  _$QNNExecutionProviderCopyWithImpl(this._self, this._then);

  final QNNExecutionProvider _self;
  final $Res Function(QNNExecutionProvider) _then;

/// Create a copy of QNNExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backendPath = freezed,Object? profiling = freezed,Object? profilingPath = freezed,Object? rpcControlLatency = freezed,Object? vtcmMb = freezed,Object? performanceMode = freezed,Object? saverPath = freezed,Object? contextPriority = freezed,Object? htpGraphFinalizationOptimizationMode = freezed,Object? socModel = freezed,Object? htpArch = freezed,Object? deviceId = freezed,Object? htpFp16Precision = freezed,Object? offloadGraphIoQuantization = freezed,}) {
  return _then(_self.copyWith(
backendPath: freezed == backendPath ? _self.backendPath : backendPath // ignore: cast_nullable_to_non_nullable
as String?,profiling: freezed == profiling ? _self.profiling : profiling // ignore: cast_nullable_to_non_nullable
as QNNProfilingLevel?,profilingPath: freezed == profilingPath ? _self.profilingPath : profilingPath // ignore: cast_nullable_to_non_nullable
as String?,rpcControlLatency: freezed == rpcControlLatency ? _self.rpcControlLatency : rpcControlLatency // ignore: cast_nullable_to_non_nullable
as int?,vtcmMb: freezed == vtcmMb ? _self.vtcmMb : vtcmMb // ignore: cast_nullable_to_non_nullable
as int?,performanceMode: freezed == performanceMode ? _self.performanceMode : performanceMode // ignore: cast_nullable_to_non_nullable
as QNNPerformanceMode?,saverPath: freezed == saverPath ? _self.saverPath : saverPath // ignore: cast_nullable_to_non_nullable
as String?,contextPriority: freezed == contextPriority ? _self.contextPriority : contextPriority // ignore: cast_nullable_to_non_nullable
as QNNContextPriority?,htpGraphFinalizationOptimizationMode: freezed == htpGraphFinalizationOptimizationMode ? _self.htpGraphFinalizationOptimizationMode : htpGraphFinalizationOptimizationMode // ignore: cast_nullable_to_non_nullable
as int?,socModel: freezed == socModel ? _self.socModel : socModel // ignore: cast_nullable_to_non_nullable
as String?,htpArch: freezed == htpArch ? _self.htpArch : htpArch // ignore: cast_nullable_to_non_nullable
as int?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,htpFp16Precision: freezed == htpFp16Precision ? _self.htpFp16Precision : htpFp16Precision // ignore: cast_nullable_to_non_nullable
as bool?,offloadGraphIoQuantization: freezed == offloadGraphIoQuantization ? _self.offloadGraphIoQuantization : offloadGraphIoQuantization // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [QNNExecutionProvider].
extension QNNExecutionProviderPatterns on QNNExecutionProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _QNNExecutionProvider value)?  raw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QNNExecutionProvider() when raw != null:
return raw(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _QNNExecutionProvider value)  raw,}){
final _that = this;
switch (_that) {
case _QNNExecutionProvider():
return raw(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _QNNExecutionProvider value)?  raw,}){
final _that = this;
switch (_that) {
case _QNNExecutionProvider() when raw != null:
return raw(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? backendPath,  QNNProfilingLevel? profiling,  String? profilingPath,  int? rpcControlLatency,  int? vtcmMb,  QNNPerformanceMode? performanceMode,  String? saverPath,  QNNContextPriority? contextPriority,  int? htpGraphFinalizationOptimizationMode,  String? socModel,  int? htpArch,  int? deviceId,  bool? htpFp16Precision,  bool? offloadGraphIoQuantization)?  raw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QNNExecutionProvider() when raw != null:
return raw(_that.backendPath,_that.profiling,_that.profilingPath,_that.rpcControlLatency,_that.vtcmMb,_that.performanceMode,_that.saverPath,_that.contextPriority,_that.htpGraphFinalizationOptimizationMode,_that.socModel,_that.htpArch,_that.deviceId,_that.htpFp16Precision,_that.offloadGraphIoQuantization);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? backendPath,  QNNProfilingLevel? profiling,  String? profilingPath,  int? rpcControlLatency,  int? vtcmMb,  QNNPerformanceMode? performanceMode,  String? saverPath,  QNNContextPriority? contextPriority,  int? htpGraphFinalizationOptimizationMode,  String? socModel,  int? htpArch,  int? deviceId,  bool? htpFp16Precision,  bool? offloadGraphIoQuantization)  raw,}) {final _that = this;
switch (_that) {
case _QNNExecutionProvider():
return raw(_that.backendPath,_that.profiling,_that.profilingPath,_that.rpcControlLatency,_that.vtcmMb,_that.performanceMode,_that.saverPath,_that.contextPriority,_that.htpGraphFinalizationOptimizationMode,_that.socModel,_that.htpArch,_that.deviceId,_that.htpFp16Precision,_that.offloadGraphIoQuantization);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? backendPath,  QNNProfilingLevel? profiling,  String? profilingPath,  int? rpcControlLatency,  int? vtcmMb,  QNNPerformanceMode? performanceMode,  String? saverPath,  QNNContextPriority? contextPriority,  int? htpGraphFinalizationOptimizationMode,  String? socModel,  int? htpArch,  int? deviceId,  bool? htpFp16Precision,  bool? offloadGraphIoQuantization)?  raw,}) {final _that = this;
switch (_that) {
case _QNNExecutionProvider() when raw != null:
return raw(_that.backendPath,_that.profiling,_that.profilingPath,_that.rpcControlLatency,_that.vtcmMb,_that.performanceMode,_that.saverPath,_that.contextPriority,_that.htpGraphFinalizationOptimizationMode,_that.socModel,_that.htpArch,_that.deviceId,_that.htpFp16Precision,_that.offloadGraphIoQuantization);case _:
  return null;

}
}

}

/// @nodoc


class _QNNExecutionProvider extends QNNExecutionProvider {
  const _QNNExecutionProvider({this.backendPath, this.profiling, this.profilingPath, this.rpcControlLatency, this.vtcmMb, this.performanceMode, this.saverPath, this.contextPriority, this.htpGraphFinalizationOptimizationMode, this.socModel, this.htpArch, this.deviceId, this.htpFp16Precision, this.offloadGraphIoQuantization}): super._();
  

@override final  String? backendPath;
@override final  QNNProfilingLevel? profiling;
@override final  String? profilingPath;
@override final  int? rpcControlLatency;
@override final  int? vtcmMb;
@override final  QNNPerformanceMode? performanceMode;
@override final  String? saverPath;
@override final  QNNContextPriority? contextPriority;
@override final  int? htpGraphFinalizationOptimizationMode;
@override final  String? socModel;
@override final  int? htpArch;
@override final  int? deviceId;
@override final  bool? htpFp16Precision;
@override final  bool? offloadGraphIoQuantization;

/// Create a copy of QNNExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QNNExecutionProviderCopyWith<_QNNExecutionProvider> get copyWith => __$QNNExecutionProviderCopyWithImpl<_QNNExecutionProvider>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QNNExecutionProvider&&(identical(other.backendPath, backendPath) || other.backendPath == backendPath)&&(identical(other.profiling, profiling) || other.profiling == profiling)&&(identical(other.profilingPath, profilingPath) || other.profilingPath == profilingPath)&&(identical(other.rpcControlLatency, rpcControlLatency) || other.rpcControlLatency == rpcControlLatency)&&(identical(other.vtcmMb, vtcmMb) || other.vtcmMb == vtcmMb)&&(identical(other.performanceMode, performanceMode) || other.performanceMode == performanceMode)&&(identical(other.saverPath, saverPath) || other.saverPath == saverPath)&&(identical(other.contextPriority, contextPriority) || other.contextPriority == contextPriority)&&(identical(other.htpGraphFinalizationOptimizationMode, htpGraphFinalizationOptimizationMode) || other.htpGraphFinalizationOptimizationMode == htpGraphFinalizationOptimizationMode)&&(identical(other.socModel, socModel) || other.socModel == socModel)&&(identical(other.htpArch, htpArch) || other.htpArch == htpArch)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.htpFp16Precision, htpFp16Precision) || other.htpFp16Precision == htpFp16Precision)&&(identical(other.offloadGraphIoQuantization, offloadGraphIoQuantization) || other.offloadGraphIoQuantization == offloadGraphIoQuantization));
}


@override
int get hashCode => Object.hash(runtimeType,backendPath,profiling,profilingPath,rpcControlLatency,vtcmMb,performanceMode,saverPath,contextPriority,htpGraphFinalizationOptimizationMode,socModel,htpArch,deviceId,htpFp16Precision,offloadGraphIoQuantization);

@override
String toString() {
  return 'QNNExecutionProvider.raw(backendPath: $backendPath, profiling: $profiling, profilingPath: $profilingPath, rpcControlLatency: $rpcControlLatency, vtcmMb: $vtcmMb, performanceMode: $performanceMode, saverPath: $saverPath, contextPriority: $contextPriority, htpGraphFinalizationOptimizationMode: $htpGraphFinalizationOptimizationMode, socModel: $socModel, htpArch: $htpArch, deviceId: $deviceId, htpFp16Precision: $htpFp16Precision, offloadGraphIoQuantization: $offloadGraphIoQuantization)';
}


}

/// @nodoc
abstract mixin class _$QNNExecutionProviderCopyWith<$Res> implements $QNNExecutionProviderCopyWith<$Res> {
  factory _$QNNExecutionProviderCopyWith(_QNNExecutionProvider value, $Res Function(_QNNExecutionProvider) _then) = __$QNNExecutionProviderCopyWithImpl;
@override @useResult
$Res call({
 String? backendPath, QNNProfilingLevel? profiling, String? profilingPath, int? rpcControlLatency, int? vtcmMb, QNNPerformanceMode? performanceMode, String? saverPath, QNNContextPriority? contextPriority, int? htpGraphFinalizationOptimizationMode, String? socModel, int? htpArch, int? deviceId, bool? htpFp16Precision, bool? offloadGraphIoQuantization
});




}
/// @nodoc
class __$QNNExecutionProviderCopyWithImpl<$Res>
    implements _$QNNExecutionProviderCopyWith<$Res> {
  __$QNNExecutionProviderCopyWithImpl(this._self, this._then);

  final _QNNExecutionProvider _self;
  final $Res Function(_QNNExecutionProvider) _then;

/// Create a copy of QNNExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backendPath = freezed,Object? profiling = freezed,Object? profilingPath = freezed,Object? rpcControlLatency = freezed,Object? vtcmMb = freezed,Object? performanceMode = freezed,Object? saverPath = freezed,Object? contextPriority = freezed,Object? htpGraphFinalizationOptimizationMode = freezed,Object? socModel = freezed,Object? htpArch = freezed,Object? deviceId = freezed,Object? htpFp16Precision = freezed,Object? offloadGraphIoQuantization = freezed,}) {
  return _then(_QNNExecutionProvider(
backendPath: freezed == backendPath ? _self.backendPath : backendPath // ignore: cast_nullable_to_non_nullable
as String?,profiling: freezed == profiling ? _self.profiling : profiling // ignore: cast_nullable_to_non_nullable
as QNNProfilingLevel?,profilingPath: freezed == profilingPath ? _self.profilingPath : profilingPath // ignore: cast_nullable_to_non_nullable
as String?,rpcControlLatency: freezed == rpcControlLatency ? _self.rpcControlLatency : rpcControlLatency // ignore: cast_nullable_to_non_nullable
as int?,vtcmMb: freezed == vtcmMb ? _self.vtcmMb : vtcmMb // ignore: cast_nullable_to_non_nullable
as int?,performanceMode: freezed == performanceMode ? _self.performanceMode : performanceMode // ignore: cast_nullable_to_non_nullable
as QNNPerformanceMode?,saverPath: freezed == saverPath ? _self.saverPath : saverPath // ignore: cast_nullable_to_non_nullable
as String?,contextPriority: freezed == contextPriority ? _self.contextPriority : contextPriority // ignore: cast_nullable_to_non_nullable
as QNNContextPriority?,htpGraphFinalizationOptimizationMode: freezed == htpGraphFinalizationOptimizationMode ? _self.htpGraphFinalizationOptimizationMode : htpGraphFinalizationOptimizationMode // ignore: cast_nullable_to_non_nullable
as int?,socModel: freezed == socModel ? _self.socModel : socModel // ignore: cast_nullable_to_non_nullable
as String?,htpArch: freezed == htpArch ? _self.htpArch : htpArch // ignore: cast_nullable_to_non_nullable
as int?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,htpFp16Precision: freezed == htpFp16Precision ? _self.htpFp16Precision : htpFp16Precision // ignore: cast_nullable_to_non_nullable
as bool?,offloadGraphIoQuantization: freezed == offloadGraphIoQuantization ? _self.offloadGraphIoQuantization : offloadGraphIoQuantization // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
