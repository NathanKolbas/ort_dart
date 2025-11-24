// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nnapi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NNAPIExecutionProvider {

 bool? get fp16; bool? get nchw; bool? get disableCpu; bool? get cpuOnly;
/// Create a copy of NNAPIExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NNAPIExecutionProviderCopyWith<NNAPIExecutionProvider> get copyWith => _$NNAPIExecutionProviderCopyWithImpl<NNAPIExecutionProvider>(this as NNAPIExecutionProvider, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NNAPIExecutionProvider&&(identical(other.fp16, fp16) || other.fp16 == fp16)&&(identical(other.nchw, nchw) || other.nchw == nchw)&&(identical(other.disableCpu, disableCpu) || other.disableCpu == disableCpu)&&(identical(other.cpuOnly, cpuOnly) || other.cpuOnly == cpuOnly));
}


@override
int get hashCode => Object.hash(runtimeType,fp16,nchw,disableCpu,cpuOnly);

@override
String toString() {
  return 'NNAPIExecutionProvider(fp16: $fp16, nchw: $nchw, disableCpu: $disableCpu, cpuOnly: $cpuOnly)';
}


}

/// @nodoc
abstract mixin class $NNAPIExecutionProviderCopyWith<$Res>  {
  factory $NNAPIExecutionProviderCopyWith(NNAPIExecutionProvider value, $Res Function(NNAPIExecutionProvider) _then) = _$NNAPIExecutionProviderCopyWithImpl;
@useResult
$Res call({
 bool? fp16, bool? nchw, bool? disableCpu, bool? cpuOnly
});




}
/// @nodoc
class _$NNAPIExecutionProviderCopyWithImpl<$Res>
    implements $NNAPIExecutionProviderCopyWith<$Res> {
  _$NNAPIExecutionProviderCopyWithImpl(this._self, this._then);

  final NNAPIExecutionProvider _self;
  final $Res Function(NNAPIExecutionProvider) _then;

/// Create a copy of NNAPIExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fp16 = freezed,Object? nchw = freezed,Object? disableCpu = freezed,Object? cpuOnly = freezed,}) {
  return _then(_self.copyWith(
fp16: freezed == fp16 ? _self.fp16 : fp16 // ignore: cast_nullable_to_non_nullable
as bool?,nchw: freezed == nchw ? _self.nchw : nchw // ignore: cast_nullable_to_non_nullable
as bool?,disableCpu: freezed == disableCpu ? _self.disableCpu : disableCpu // ignore: cast_nullable_to_non_nullable
as bool?,cpuOnly: freezed == cpuOnly ? _self.cpuOnly : cpuOnly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [NNAPIExecutionProvider].
extension NNAPIExecutionProviderPatterns on NNAPIExecutionProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NNAPIExecutionProvider value)?  raw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NNAPIExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NNAPIExecutionProvider value)  raw,}){
final _that = this;
switch (_that) {
case _NNAPIExecutionProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NNAPIExecutionProvider value)?  raw,}){
final _that = this;
switch (_that) {
case _NNAPIExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool? fp16,  bool? nchw,  bool? disableCpu,  bool? cpuOnly)?  raw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NNAPIExecutionProvider() when raw != null:
return raw(_that.fp16,_that.nchw,_that.disableCpu,_that.cpuOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool? fp16,  bool? nchw,  bool? disableCpu,  bool? cpuOnly)  raw,}) {final _that = this;
switch (_that) {
case _NNAPIExecutionProvider():
return raw(_that.fp16,_that.nchw,_that.disableCpu,_that.cpuOnly);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool? fp16,  bool? nchw,  bool? disableCpu,  bool? cpuOnly)?  raw,}) {final _that = this;
switch (_that) {
case _NNAPIExecutionProvider() when raw != null:
return raw(_that.fp16,_that.nchw,_that.disableCpu,_that.cpuOnly);case _:
  return null;

}
}

}

/// @nodoc


class _NNAPIExecutionProvider extends NNAPIExecutionProvider {
  const _NNAPIExecutionProvider({this.fp16, this.nchw, this.disableCpu, this.cpuOnly}): super._();
  

@override final  bool? fp16;
@override final  bool? nchw;
@override final  bool? disableCpu;
@override final  bool? cpuOnly;

/// Create a copy of NNAPIExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NNAPIExecutionProviderCopyWith<_NNAPIExecutionProvider> get copyWith => __$NNAPIExecutionProviderCopyWithImpl<_NNAPIExecutionProvider>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NNAPIExecutionProvider&&(identical(other.fp16, fp16) || other.fp16 == fp16)&&(identical(other.nchw, nchw) || other.nchw == nchw)&&(identical(other.disableCpu, disableCpu) || other.disableCpu == disableCpu)&&(identical(other.cpuOnly, cpuOnly) || other.cpuOnly == cpuOnly));
}


@override
int get hashCode => Object.hash(runtimeType,fp16,nchw,disableCpu,cpuOnly);

@override
String toString() {
  return 'NNAPIExecutionProvider.raw(fp16: $fp16, nchw: $nchw, disableCpu: $disableCpu, cpuOnly: $cpuOnly)';
}


}

/// @nodoc
abstract mixin class _$NNAPIExecutionProviderCopyWith<$Res> implements $NNAPIExecutionProviderCopyWith<$Res> {
  factory _$NNAPIExecutionProviderCopyWith(_NNAPIExecutionProvider value, $Res Function(_NNAPIExecutionProvider) _then) = __$NNAPIExecutionProviderCopyWithImpl;
@override @useResult
$Res call({
 bool? fp16, bool? nchw, bool? disableCpu, bool? cpuOnly
});




}
/// @nodoc
class __$NNAPIExecutionProviderCopyWithImpl<$Res>
    implements _$NNAPIExecutionProviderCopyWith<$Res> {
  __$NNAPIExecutionProviderCopyWithImpl(this._self, this._then);

  final _NNAPIExecutionProvider _self;
  final $Res Function(_NNAPIExecutionProvider) _then;

/// Create a copy of NNAPIExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fp16 = freezed,Object? nchw = freezed,Object? disableCpu = freezed,Object? cpuOnly = freezed,}) {
  return _then(_NNAPIExecutionProvider(
fp16: freezed == fp16 ? _self.fp16 : fp16 // ignore: cast_nullable_to_non_nullable
as bool?,nchw: freezed == nchw ? _self.nchw : nchw // ignore: cast_nullable_to_non_nullable
as bool?,disableCpu: freezed == disableCpu ? _self.disableCpu : disableCpu // ignore: cast_nullable_to_non_nullable
as bool?,cpuOnly: freezed == cpuOnly ? _self.cpuOnly : cpuOnly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
