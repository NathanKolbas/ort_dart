// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directml.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DirectMLExecutionProvider {

 int? get deviceId;
/// Create a copy of DirectMLExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DirectMLExecutionProviderCopyWith<DirectMLExecutionProvider> get copyWith => _$DirectMLExecutionProviderCopyWithImpl<DirectMLExecutionProvider>(this as DirectMLExecutionProvider, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DirectMLExecutionProvider&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString() {
  return 'DirectMLExecutionProvider(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $DirectMLExecutionProviderCopyWith<$Res>  {
  factory $DirectMLExecutionProviderCopyWith(DirectMLExecutionProvider value, $Res Function(DirectMLExecutionProvider) _then) = _$DirectMLExecutionProviderCopyWithImpl;
@useResult
$Res call({
 int? deviceId
});




}
/// @nodoc
class _$DirectMLExecutionProviderCopyWithImpl<$Res>
    implements $DirectMLExecutionProviderCopyWith<$Res> {
  _$DirectMLExecutionProviderCopyWithImpl(this._self, this._then);

  final DirectMLExecutionProvider _self;
  final $Res Function(DirectMLExecutionProvider) _then;

/// Create a copy of DirectMLExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = freezed,}) {
  return _then(_self.copyWith(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DirectMLExecutionProvider].
extension DirectMLExecutionProviderPatterns on DirectMLExecutionProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DirectMLExecutionProvider value)?  raw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DirectMLExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DirectMLExecutionProvider value)  raw,}){
final _that = this;
switch (_that) {
case _DirectMLExecutionProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DirectMLExecutionProvider value)?  raw,}){
final _that = this;
switch (_that) {
case _DirectMLExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? deviceId)?  raw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DirectMLExecutionProvider() when raw != null:
return raw(_that.deviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? deviceId)  raw,}) {final _that = this;
switch (_that) {
case _DirectMLExecutionProvider():
return raw(_that.deviceId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? deviceId)?  raw,}) {final _that = this;
switch (_that) {
case _DirectMLExecutionProvider() when raw != null:
return raw(_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc


class _DirectMLExecutionProvider extends DirectMLExecutionProvider {
  const _DirectMLExecutionProvider({this.deviceId}): super._();
  

@override final  int? deviceId;

/// Create a copy of DirectMLExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DirectMLExecutionProviderCopyWith<_DirectMLExecutionProvider> get copyWith => __$DirectMLExecutionProviderCopyWithImpl<_DirectMLExecutionProvider>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DirectMLExecutionProvider&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString() {
  return 'DirectMLExecutionProvider.raw(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$DirectMLExecutionProviderCopyWith<$Res> implements $DirectMLExecutionProviderCopyWith<$Res> {
  factory _$DirectMLExecutionProviderCopyWith(_DirectMLExecutionProvider value, $Res Function(_DirectMLExecutionProvider) _then) = __$DirectMLExecutionProviderCopyWithImpl;
@override @useResult
$Res call({
 int? deviceId
});




}
/// @nodoc
class __$DirectMLExecutionProviderCopyWithImpl<$Res>
    implements _$DirectMLExecutionProviderCopyWith<$Res> {
  __$DirectMLExecutionProviderCopyWithImpl(this._self, this._then);

  final _DirectMLExecutionProvider _self;
  final $Res Function(_DirectMLExecutionProvider) _then;

/// Create a copy of DirectMLExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = freezed,}) {
  return _then(_DirectMLExecutionProvider(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
