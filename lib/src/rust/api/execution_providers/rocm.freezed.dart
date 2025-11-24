// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rocm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ROCmExecutionProvider {

 int? get deviceId; bool? get exhaustiveConvSearch; bool? get convUseMaxWorkspace; int? get memLimit; ArenaExtendStrategy? get arenaExtendStrategy; bool? get copyInDefaultStream; bool? get hipGraph; bool? get tunableOp; bool? get tuning; int? get maxTuningDuration;
/// Create a copy of ROCmExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ROCmExecutionProviderCopyWith<ROCmExecutionProvider> get copyWith => _$ROCmExecutionProviderCopyWithImpl<ROCmExecutionProvider>(this as ROCmExecutionProvider, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ROCmExecutionProvider&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.exhaustiveConvSearch, exhaustiveConvSearch) || other.exhaustiveConvSearch == exhaustiveConvSearch)&&(identical(other.convUseMaxWorkspace, convUseMaxWorkspace) || other.convUseMaxWorkspace == convUseMaxWorkspace)&&(identical(other.memLimit, memLimit) || other.memLimit == memLimit)&&(identical(other.arenaExtendStrategy, arenaExtendStrategy) || other.arenaExtendStrategy == arenaExtendStrategy)&&(identical(other.copyInDefaultStream, copyInDefaultStream) || other.copyInDefaultStream == copyInDefaultStream)&&(identical(other.hipGraph, hipGraph) || other.hipGraph == hipGraph)&&(identical(other.tunableOp, tunableOp) || other.tunableOp == tunableOp)&&(identical(other.tuning, tuning) || other.tuning == tuning)&&(identical(other.maxTuningDuration, maxTuningDuration) || other.maxTuningDuration == maxTuningDuration));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,exhaustiveConvSearch,convUseMaxWorkspace,memLimit,arenaExtendStrategy,copyInDefaultStream,hipGraph,tunableOp,tuning,maxTuningDuration);

@override
String toString() {
  return 'ROCmExecutionProvider(deviceId: $deviceId, exhaustiveConvSearch: $exhaustiveConvSearch, convUseMaxWorkspace: $convUseMaxWorkspace, memLimit: $memLimit, arenaExtendStrategy: $arenaExtendStrategy, copyInDefaultStream: $copyInDefaultStream, hipGraph: $hipGraph, tunableOp: $tunableOp, tuning: $tuning, maxTuningDuration: $maxTuningDuration)';
}


}

/// @nodoc
abstract mixin class $ROCmExecutionProviderCopyWith<$Res>  {
  factory $ROCmExecutionProviderCopyWith(ROCmExecutionProvider value, $Res Function(ROCmExecutionProvider) _then) = _$ROCmExecutionProviderCopyWithImpl;
@useResult
$Res call({
 int? deviceId, bool? exhaustiveConvSearch, bool? convUseMaxWorkspace, int? memLimit, ArenaExtendStrategy? arenaExtendStrategy, bool? copyInDefaultStream, bool? hipGraph, bool? tunableOp, bool? tuning, int? maxTuningDuration
});




}
/// @nodoc
class _$ROCmExecutionProviderCopyWithImpl<$Res>
    implements $ROCmExecutionProviderCopyWith<$Res> {
  _$ROCmExecutionProviderCopyWithImpl(this._self, this._then);

  final ROCmExecutionProvider _self;
  final $Res Function(ROCmExecutionProvider) _then;

/// Create a copy of ROCmExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = freezed,Object? exhaustiveConvSearch = freezed,Object? convUseMaxWorkspace = freezed,Object? memLimit = freezed,Object? arenaExtendStrategy = freezed,Object? copyInDefaultStream = freezed,Object? hipGraph = freezed,Object? tunableOp = freezed,Object? tuning = freezed,Object? maxTuningDuration = freezed,}) {
  return _then(_self.copyWith(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,exhaustiveConvSearch: freezed == exhaustiveConvSearch ? _self.exhaustiveConvSearch : exhaustiveConvSearch // ignore: cast_nullable_to_non_nullable
as bool?,convUseMaxWorkspace: freezed == convUseMaxWorkspace ? _self.convUseMaxWorkspace : convUseMaxWorkspace // ignore: cast_nullable_to_non_nullable
as bool?,memLimit: freezed == memLimit ? _self.memLimit : memLimit // ignore: cast_nullable_to_non_nullable
as int?,arenaExtendStrategy: freezed == arenaExtendStrategy ? _self.arenaExtendStrategy : arenaExtendStrategy // ignore: cast_nullable_to_non_nullable
as ArenaExtendStrategy?,copyInDefaultStream: freezed == copyInDefaultStream ? _self.copyInDefaultStream : copyInDefaultStream // ignore: cast_nullable_to_non_nullable
as bool?,hipGraph: freezed == hipGraph ? _self.hipGraph : hipGraph // ignore: cast_nullable_to_non_nullable
as bool?,tunableOp: freezed == tunableOp ? _self.tunableOp : tunableOp // ignore: cast_nullable_to_non_nullable
as bool?,tuning: freezed == tuning ? _self.tuning : tuning // ignore: cast_nullable_to_non_nullable
as bool?,maxTuningDuration: freezed == maxTuningDuration ? _self.maxTuningDuration : maxTuningDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ROCmExecutionProvider].
extension ROCmExecutionProviderPatterns on ROCmExecutionProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ROCmExecutionProvider value)?  raw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ROCmExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ROCmExecutionProvider value)  raw,}){
final _that = this;
switch (_that) {
case _ROCmExecutionProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ROCmExecutionProvider value)?  raw,}){
final _that = this;
switch (_that) {
case _ROCmExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? deviceId,  bool? exhaustiveConvSearch,  bool? convUseMaxWorkspace,  int? memLimit,  ArenaExtendStrategy? arenaExtendStrategy,  bool? copyInDefaultStream,  bool? hipGraph,  bool? tunableOp,  bool? tuning,  int? maxTuningDuration)?  raw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ROCmExecutionProvider() when raw != null:
return raw(_that.deviceId,_that.exhaustiveConvSearch,_that.convUseMaxWorkspace,_that.memLimit,_that.arenaExtendStrategy,_that.copyInDefaultStream,_that.hipGraph,_that.tunableOp,_that.tuning,_that.maxTuningDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? deviceId,  bool? exhaustiveConvSearch,  bool? convUseMaxWorkspace,  int? memLimit,  ArenaExtendStrategy? arenaExtendStrategy,  bool? copyInDefaultStream,  bool? hipGraph,  bool? tunableOp,  bool? tuning,  int? maxTuningDuration)  raw,}) {final _that = this;
switch (_that) {
case _ROCmExecutionProvider():
return raw(_that.deviceId,_that.exhaustiveConvSearch,_that.convUseMaxWorkspace,_that.memLimit,_that.arenaExtendStrategy,_that.copyInDefaultStream,_that.hipGraph,_that.tunableOp,_that.tuning,_that.maxTuningDuration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? deviceId,  bool? exhaustiveConvSearch,  bool? convUseMaxWorkspace,  int? memLimit,  ArenaExtendStrategy? arenaExtendStrategy,  bool? copyInDefaultStream,  bool? hipGraph,  bool? tunableOp,  bool? tuning,  int? maxTuningDuration)?  raw,}) {final _that = this;
switch (_that) {
case _ROCmExecutionProvider() when raw != null:
return raw(_that.deviceId,_that.exhaustiveConvSearch,_that.convUseMaxWorkspace,_that.memLimit,_that.arenaExtendStrategy,_that.copyInDefaultStream,_that.hipGraph,_that.tunableOp,_that.tuning,_that.maxTuningDuration);case _:
  return null;

}
}

}

/// @nodoc


class _ROCmExecutionProvider extends ROCmExecutionProvider {
  const _ROCmExecutionProvider({this.deviceId, this.exhaustiveConvSearch, this.convUseMaxWorkspace, this.memLimit, this.arenaExtendStrategy, this.copyInDefaultStream, this.hipGraph, this.tunableOp, this.tuning, this.maxTuningDuration}): super._();
  

@override final  int? deviceId;
@override final  bool? exhaustiveConvSearch;
@override final  bool? convUseMaxWorkspace;
@override final  int? memLimit;
@override final  ArenaExtendStrategy? arenaExtendStrategy;
@override final  bool? copyInDefaultStream;
@override final  bool? hipGraph;
@override final  bool? tunableOp;
@override final  bool? tuning;
@override final  int? maxTuningDuration;

/// Create a copy of ROCmExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ROCmExecutionProviderCopyWith<_ROCmExecutionProvider> get copyWith => __$ROCmExecutionProviderCopyWithImpl<_ROCmExecutionProvider>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ROCmExecutionProvider&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.exhaustiveConvSearch, exhaustiveConvSearch) || other.exhaustiveConvSearch == exhaustiveConvSearch)&&(identical(other.convUseMaxWorkspace, convUseMaxWorkspace) || other.convUseMaxWorkspace == convUseMaxWorkspace)&&(identical(other.memLimit, memLimit) || other.memLimit == memLimit)&&(identical(other.arenaExtendStrategy, arenaExtendStrategy) || other.arenaExtendStrategy == arenaExtendStrategy)&&(identical(other.copyInDefaultStream, copyInDefaultStream) || other.copyInDefaultStream == copyInDefaultStream)&&(identical(other.hipGraph, hipGraph) || other.hipGraph == hipGraph)&&(identical(other.tunableOp, tunableOp) || other.tunableOp == tunableOp)&&(identical(other.tuning, tuning) || other.tuning == tuning)&&(identical(other.maxTuningDuration, maxTuningDuration) || other.maxTuningDuration == maxTuningDuration));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,exhaustiveConvSearch,convUseMaxWorkspace,memLimit,arenaExtendStrategy,copyInDefaultStream,hipGraph,tunableOp,tuning,maxTuningDuration);

@override
String toString() {
  return 'ROCmExecutionProvider.raw(deviceId: $deviceId, exhaustiveConvSearch: $exhaustiveConvSearch, convUseMaxWorkspace: $convUseMaxWorkspace, memLimit: $memLimit, arenaExtendStrategy: $arenaExtendStrategy, copyInDefaultStream: $copyInDefaultStream, hipGraph: $hipGraph, tunableOp: $tunableOp, tuning: $tuning, maxTuningDuration: $maxTuningDuration)';
}


}

/// @nodoc
abstract mixin class _$ROCmExecutionProviderCopyWith<$Res> implements $ROCmExecutionProviderCopyWith<$Res> {
  factory _$ROCmExecutionProviderCopyWith(_ROCmExecutionProvider value, $Res Function(_ROCmExecutionProvider) _then) = __$ROCmExecutionProviderCopyWithImpl;
@override @useResult
$Res call({
 int? deviceId, bool? exhaustiveConvSearch, bool? convUseMaxWorkspace, int? memLimit, ArenaExtendStrategy? arenaExtendStrategy, bool? copyInDefaultStream, bool? hipGraph, bool? tunableOp, bool? tuning, int? maxTuningDuration
});




}
/// @nodoc
class __$ROCmExecutionProviderCopyWithImpl<$Res>
    implements _$ROCmExecutionProviderCopyWith<$Res> {
  __$ROCmExecutionProviderCopyWithImpl(this._self, this._then);

  final _ROCmExecutionProvider _self;
  final $Res Function(_ROCmExecutionProvider) _then;

/// Create a copy of ROCmExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = freezed,Object? exhaustiveConvSearch = freezed,Object? convUseMaxWorkspace = freezed,Object? memLimit = freezed,Object? arenaExtendStrategy = freezed,Object? copyInDefaultStream = freezed,Object? hipGraph = freezed,Object? tunableOp = freezed,Object? tuning = freezed,Object? maxTuningDuration = freezed,}) {
  return _then(_ROCmExecutionProvider(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,exhaustiveConvSearch: freezed == exhaustiveConvSearch ? _self.exhaustiveConvSearch : exhaustiveConvSearch // ignore: cast_nullable_to_non_nullable
as bool?,convUseMaxWorkspace: freezed == convUseMaxWorkspace ? _self.convUseMaxWorkspace : convUseMaxWorkspace // ignore: cast_nullable_to_non_nullable
as bool?,memLimit: freezed == memLimit ? _self.memLimit : memLimit // ignore: cast_nullable_to_non_nullable
as int?,arenaExtendStrategy: freezed == arenaExtendStrategy ? _self.arenaExtendStrategy : arenaExtendStrategy // ignore: cast_nullable_to_non_nullable
as ArenaExtendStrategy?,copyInDefaultStream: freezed == copyInDefaultStream ? _self.copyInDefaultStream : copyInDefaultStream // ignore: cast_nullable_to_non_nullable
as bool?,hipGraph: freezed == hipGraph ? _self.hipGraph : hipGraph // ignore: cast_nullable_to_non_nullable
as bool?,tunableOp: freezed == tunableOp ? _self.tunableOp : tunableOp // ignore: cast_nullable_to_non_nullable
as bool?,tuning: freezed == tuning ? _self.tuning : tuning // ignore: cast_nullable_to_non_nullable
as bool?,maxTuningDuration: freezed == maxTuningDuration ? _self.maxTuningDuration : maxTuningDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
