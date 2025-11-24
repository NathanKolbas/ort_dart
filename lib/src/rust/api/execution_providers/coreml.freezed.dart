// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coreml.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoreMLExecutionProvider {

 bool? get subgraphs; bool? get staticInputShapes; CoreMLModelFormat? get modelFormat; CoreMLSpecializationStrategy? get specializationStrategy; CoreMLComputeUnits? get computeUnits; bool? get profileComputePlan; bool? get lowPrecisionAccumulationOnGpu; String? get modelCacheDir;
/// Create a copy of CoreMLExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoreMLExecutionProviderCopyWith<CoreMLExecutionProvider> get copyWith => _$CoreMLExecutionProviderCopyWithImpl<CoreMLExecutionProvider>(this as CoreMLExecutionProvider, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoreMLExecutionProvider&&(identical(other.subgraphs, subgraphs) || other.subgraphs == subgraphs)&&(identical(other.staticInputShapes, staticInputShapes) || other.staticInputShapes == staticInputShapes)&&(identical(other.modelFormat, modelFormat) || other.modelFormat == modelFormat)&&(identical(other.specializationStrategy, specializationStrategy) || other.specializationStrategy == specializationStrategy)&&(identical(other.computeUnits, computeUnits) || other.computeUnits == computeUnits)&&(identical(other.profileComputePlan, profileComputePlan) || other.profileComputePlan == profileComputePlan)&&(identical(other.lowPrecisionAccumulationOnGpu, lowPrecisionAccumulationOnGpu) || other.lowPrecisionAccumulationOnGpu == lowPrecisionAccumulationOnGpu)&&(identical(other.modelCacheDir, modelCacheDir) || other.modelCacheDir == modelCacheDir));
}


@override
int get hashCode => Object.hash(runtimeType,subgraphs,staticInputShapes,modelFormat,specializationStrategy,computeUnits,profileComputePlan,lowPrecisionAccumulationOnGpu,modelCacheDir);

@override
String toString() {
  return 'CoreMLExecutionProvider(subgraphs: $subgraphs, staticInputShapes: $staticInputShapes, modelFormat: $modelFormat, specializationStrategy: $specializationStrategy, computeUnits: $computeUnits, profileComputePlan: $profileComputePlan, lowPrecisionAccumulationOnGpu: $lowPrecisionAccumulationOnGpu, modelCacheDir: $modelCacheDir)';
}


}

/// @nodoc
abstract mixin class $CoreMLExecutionProviderCopyWith<$Res>  {
  factory $CoreMLExecutionProviderCopyWith(CoreMLExecutionProvider value, $Res Function(CoreMLExecutionProvider) _then) = _$CoreMLExecutionProviderCopyWithImpl;
@useResult
$Res call({
 bool? subgraphs, bool? staticInputShapes, CoreMLModelFormat? modelFormat, CoreMLSpecializationStrategy? specializationStrategy, CoreMLComputeUnits? computeUnits, bool? profileComputePlan, bool? lowPrecisionAccumulationOnGpu, String? modelCacheDir
});




}
/// @nodoc
class _$CoreMLExecutionProviderCopyWithImpl<$Res>
    implements $CoreMLExecutionProviderCopyWith<$Res> {
  _$CoreMLExecutionProviderCopyWithImpl(this._self, this._then);

  final CoreMLExecutionProvider _self;
  final $Res Function(CoreMLExecutionProvider) _then;

/// Create a copy of CoreMLExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subgraphs = freezed,Object? staticInputShapes = freezed,Object? modelFormat = freezed,Object? specializationStrategy = freezed,Object? computeUnits = freezed,Object? profileComputePlan = freezed,Object? lowPrecisionAccumulationOnGpu = freezed,Object? modelCacheDir = freezed,}) {
  return _then(_self.copyWith(
subgraphs: freezed == subgraphs ? _self.subgraphs : subgraphs // ignore: cast_nullable_to_non_nullable
as bool?,staticInputShapes: freezed == staticInputShapes ? _self.staticInputShapes : staticInputShapes // ignore: cast_nullable_to_non_nullable
as bool?,modelFormat: freezed == modelFormat ? _self.modelFormat : modelFormat // ignore: cast_nullable_to_non_nullable
as CoreMLModelFormat?,specializationStrategy: freezed == specializationStrategy ? _self.specializationStrategy : specializationStrategy // ignore: cast_nullable_to_non_nullable
as CoreMLSpecializationStrategy?,computeUnits: freezed == computeUnits ? _self.computeUnits : computeUnits // ignore: cast_nullable_to_non_nullable
as CoreMLComputeUnits?,profileComputePlan: freezed == profileComputePlan ? _self.profileComputePlan : profileComputePlan // ignore: cast_nullable_to_non_nullable
as bool?,lowPrecisionAccumulationOnGpu: freezed == lowPrecisionAccumulationOnGpu ? _self.lowPrecisionAccumulationOnGpu : lowPrecisionAccumulationOnGpu // ignore: cast_nullable_to_non_nullable
as bool?,modelCacheDir: freezed == modelCacheDir ? _self.modelCacheDir : modelCacheDir // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoreMLExecutionProvider].
extension CoreMLExecutionProviderPatterns on CoreMLExecutionProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CoreMLExecutionProvider value)?  raw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoreMLExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CoreMLExecutionProvider value)  raw,}){
final _that = this;
switch (_that) {
case _CoreMLExecutionProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CoreMLExecutionProvider value)?  raw,}){
final _that = this;
switch (_that) {
case _CoreMLExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool? subgraphs,  bool? staticInputShapes,  CoreMLModelFormat? modelFormat,  CoreMLSpecializationStrategy? specializationStrategy,  CoreMLComputeUnits? computeUnits,  bool? profileComputePlan,  bool? lowPrecisionAccumulationOnGpu,  String? modelCacheDir)?  raw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoreMLExecutionProvider() when raw != null:
return raw(_that.subgraphs,_that.staticInputShapes,_that.modelFormat,_that.specializationStrategy,_that.computeUnits,_that.profileComputePlan,_that.lowPrecisionAccumulationOnGpu,_that.modelCacheDir);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool? subgraphs,  bool? staticInputShapes,  CoreMLModelFormat? modelFormat,  CoreMLSpecializationStrategy? specializationStrategy,  CoreMLComputeUnits? computeUnits,  bool? profileComputePlan,  bool? lowPrecisionAccumulationOnGpu,  String? modelCacheDir)  raw,}) {final _that = this;
switch (_that) {
case _CoreMLExecutionProvider():
return raw(_that.subgraphs,_that.staticInputShapes,_that.modelFormat,_that.specializationStrategy,_that.computeUnits,_that.profileComputePlan,_that.lowPrecisionAccumulationOnGpu,_that.modelCacheDir);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool? subgraphs,  bool? staticInputShapes,  CoreMLModelFormat? modelFormat,  CoreMLSpecializationStrategy? specializationStrategy,  CoreMLComputeUnits? computeUnits,  bool? profileComputePlan,  bool? lowPrecisionAccumulationOnGpu,  String? modelCacheDir)?  raw,}) {final _that = this;
switch (_that) {
case _CoreMLExecutionProvider() when raw != null:
return raw(_that.subgraphs,_that.staticInputShapes,_that.modelFormat,_that.specializationStrategy,_that.computeUnits,_that.profileComputePlan,_that.lowPrecisionAccumulationOnGpu,_that.modelCacheDir);case _:
  return null;

}
}

}

/// @nodoc


class _CoreMLExecutionProvider extends CoreMLExecutionProvider {
  const _CoreMLExecutionProvider({this.subgraphs, this.staticInputShapes, this.modelFormat, this.specializationStrategy, this.computeUnits, this.profileComputePlan, this.lowPrecisionAccumulationOnGpu, this.modelCacheDir}): super._();
  

@override final  bool? subgraphs;
@override final  bool? staticInputShapes;
@override final  CoreMLModelFormat? modelFormat;
@override final  CoreMLSpecializationStrategy? specializationStrategy;
@override final  CoreMLComputeUnits? computeUnits;
@override final  bool? profileComputePlan;
@override final  bool? lowPrecisionAccumulationOnGpu;
@override final  String? modelCacheDir;

/// Create a copy of CoreMLExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoreMLExecutionProviderCopyWith<_CoreMLExecutionProvider> get copyWith => __$CoreMLExecutionProviderCopyWithImpl<_CoreMLExecutionProvider>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoreMLExecutionProvider&&(identical(other.subgraphs, subgraphs) || other.subgraphs == subgraphs)&&(identical(other.staticInputShapes, staticInputShapes) || other.staticInputShapes == staticInputShapes)&&(identical(other.modelFormat, modelFormat) || other.modelFormat == modelFormat)&&(identical(other.specializationStrategy, specializationStrategy) || other.specializationStrategy == specializationStrategy)&&(identical(other.computeUnits, computeUnits) || other.computeUnits == computeUnits)&&(identical(other.profileComputePlan, profileComputePlan) || other.profileComputePlan == profileComputePlan)&&(identical(other.lowPrecisionAccumulationOnGpu, lowPrecisionAccumulationOnGpu) || other.lowPrecisionAccumulationOnGpu == lowPrecisionAccumulationOnGpu)&&(identical(other.modelCacheDir, modelCacheDir) || other.modelCacheDir == modelCacheDir));
}


@override
int get hashCode => Object.hash(runtimeType,subgraphs,staticInputShapes,modelFormat,specializationStrategy,computeUnits,profileComputePlan,lowPrecisionAccumulationOnGpu,modelCacheDir);

@override
String toString() {
  return 'CoreMLExecutionProvider.raw(subgraphs: $subgraphs, staticInputShapes: $staticInputShapes, modelFormat: $modelFormat, specializationStrategy: $specializationStrategy, computeUnits: $computeUnits, profileComputePlan: $profileComputePlan, lowPrecisionAccumulationOnGpu: $lowPrecisionAccumulationOnGpu, modelCacheDir: $modelCacheDir)';
}


}

/// @nodoc
abstract mixin class _$CoreMLExecutionProviderCopyWith<$Res> implements $CoreMLExecutionProviderCopyWith<$Res> {
  factory _$CoreMLExecutionProviderCopyWith(_CoreMLExecutionProvider value, $Res Function(_CoreMLExecutionProvider) _then) = __$CoreMLExecutionProviderCopyWithImpl;
@override @useResult
$Res call({
 bool? subgraphs, bool? staticInputShapes, CoreMLModelFormat? modelFormat, CoreMLSpecializationStrategy? specializationStrategy, CoreMLComputeUnits? computeUnits, bool? profileComputePlan, bool? lowPrecisionAccumulationOnGpu, String? modelCacheDir
});




}
/// @nodoc
class __$CoreMLExecutionProviderCopyWithImpl<$Res>
    implements _$CoreMLExecutionProviderCopyWith<$Res> {
  __$CoreMLExecutionProviderCopyWithImpl(this._self, this._then);

  final _CoreMLExecutionProvider _self;
  final $Res Function(_CoreMLExecutionProvider) _then;

/// Create a copy of CoreMLExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subgraphs = freezed,Object? staticInputShapes = freezed,Object? modelFormat = freezed,Object? specializationStrategy = freezed,Object? computeUnits = freezed,Object? profileComputePlan = freezed,Object? lowPrecisionAccumulationOnGpu = freezed,Object? modelCacheDir = freezed,}) {
  return _then(_CoreMLExecutionProvider(
subgraphs: freezed == subgraphs ? _self.subgraphs : subgraphs // ignore: cast_nullable_to_non_nullable
as bool?,staticInputShapes: freezed == staticInputShapes ? _self.staticInputShapes : staticInputShapes // ignore: cast_nullable_to_non_nullable
as bool?,modelFormat: freezed == modelFormat ? _self.modelFormat : modelFormat // ignore: cast_nullable_to_non_nullable
as CoreMLModelFormat?,specializationStrategy: freezed == specializationStrategy ? _self.specializationStrategy : specializationStrategy // ignore: cast_nullable_to_non_nullable
as CoreMLSpecializationStrategy?,computeUnits: freezed == computeUnits ? _self.computeUnits : computeUnits // ignore: cast_nullable_to_non_nullable
as CoreMLComputeUnits?,profileComputePlan: freezed == profileComputePlan ? _self.profileComputePlan : profileComputePlan // ignore: cast_nullable_to_non_nullable
as bool?,lowPrecisionAccumulationOnGpu: freezed == lowPrecisionAccumulationOnGpu ? _self.lowPrecisionAccumulationOnGpu : lowPrecisionAccumulationOnGpu // ignore: cast_nullable_to_non_nullable
as bool?,modelCacheDir: freezed == modelCacheDir ? _self.modelCacheDir : modelCacheDir // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
