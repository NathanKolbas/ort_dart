// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xnnpack.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$XNNPACKExecutionProvider {

 int? get intraOpNumThreads;
/// Create a copy of XNNPACKExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XNNPACKExecutionProviderCopyWith<XNNPACKExecutionProvider> get copyWith => _$XNNPACKExecutionProviderCopyWithImpl<XNNPACKExecutionProvider>(this as XNNPACKExecutionProvider, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XNNPACKExecutionProvider&&(identical(other.intraOpNumThreads, intraOpNumThreads) || other.intraOpNumThreads == intraOpNumThreads));
}


@override
int get hashCode => Object.hash(runtimeType,intraOpNumThreads);

@override
String toString() {
  return 'XNNPACKExecutionProvider(intraOpNumThreads: $intraOpNumThreads)';
}


}

/// @nodoc
abstract mixin class $XNNPACKExecutionProviderCopyWith<$Res>  {
  factory $XNNPACKExecutionProviderCopyWith(XNNPACKExecutionProvider value, $Res Function(XNNPACKExecutionProvider) _then) = _$XNNPACKExecutionProviderCopyWithImpl;
@useResult
$Res call({
 int? intraOpNumThreads
});




}
/// @nodoc
class _$XNNPACKExecutionProviderCopyWithImpl<$Res>
    implements $XNNPACKExecutionProviderCopyWith<$Res> {
  _$XNNPACKExecutionProviderCopyWithImpl(this._self, this._then);

  final XNNPACKExecutionProvider _self;
  final $Res Function(XNNPACKExecutionProvider) _then;

/// Create a copy of XNNPACKExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? intraOpNumThreads = freezed,}) {
  return _then(_self.copyWith(
intraOpNumThreads: freezed == intraOpNumThreads ? _self.intraOpNumThreads : intraOpNumThreads // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [XNNPACKExecutionProvider].
extension XNNPACKExecutionProviderPatterns on XNNPACKExecutionProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _XNNPACKExecutionProvider value)?  raw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _XNNPACKExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _XNNPACKExecutionProvider value)  raw,}){
final _that = this;
switch (_that) {
case _XNNPACKExecutionProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _XNNPACKExecutionProvider value)?  raw,}){
final _that = this;
switch (_that) {
case _XNNPACKExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? intraOpNumThreads)?  raw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _XNNPACKExecutionProvider() when raw != null:
return raw(_that.intraOpNumThreads);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? intraOpNumThreads)  raw,}) {final _that = this;
switch (_that) {
case _XNNPACKExecutionProvider():
return raw(_that.intraOpNumThreads);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? intraOpNumThreads)?  raw,}) {final _that = this;
switch (_that) {
case _XNNPACKExecutionProvider() when raw != null:
return raw(_that.intraOpNumThreads);case _:
  return null;

}
}

}

/// @nodoc


class _XNNPACKExecutionProvider extends XNNPACKExecutionProvider {
  const _XNNPACKExecutionProvider({this.intraOpNumThreads}): super._();
  

@override final  int? intraOpNumThreads;

/// Create a copy of XNNPACKExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$XNNPACKExecutionProviderCopyWith<_XNNPACKExecutionProvider> get copyWith => __$XNNPACKExecutionProviderCopyWithImpl<_XNNPACKExecutionProvider>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _XNNPACKExecutionProvider&&(identical(other.intraOpNumThreads, intraOpNumThreads) || other.intraOpNumThreads == intraOpNumThreads));
}


@override
int get hashCode => Object.hash(runtimeType,intraOpNumThreads);

@override
String toString() {
  return 'XNNPACKExecutionProvider.raw(intraOpNumThreads: $intraOpNumThreads)';
}


}

/// @nodoc
abstract mixin class _$XNNPACKExecutionProviderCopyWith<$Res> implements $XNNPACKExecutionProviderCopyWith<$Res> {
  factory _$XNNPACKExecutionProviderCopyWith(_XNNPACKExecutionProvider value, $Res Function(_XNNPACKExecutionProvider) _then) = __$XNNPACKExecutionProviderCopyWithImpl;
@override @useResult
$Res call({
 int? intraOpNumThreads
});




}
/// @nodoc
class __$XNNPACKExecutionProviderCopyWithImpl<$Res>
    implements _$XNNPACKExecutionProviderCopyWith<$Res> {
  __$XNNPACKExecutionProviderCopyWithImpl(this._self, this._then);

  final _XNNPACKExecutionProvider _self;
  final $Res Function(_XNNPACKExecutionProvider) _then;

/// Create a copy of XNNPACKExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? intraOpNumThreads = freezed,}) {
  return _then(_XNNPACKExecutionProvider(
intraOpNumThreads: freezed == intraOpNumThreads ? _self.intraOpNumThreads : intraOpNumThreads // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
