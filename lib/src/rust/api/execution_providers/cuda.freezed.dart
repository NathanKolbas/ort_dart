// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cuda.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CUDAExecutionProvider {

 int? get deviceId; int? get memoryLimit; ArenaExtendStrategy? get arenaExtendStrategy; CuDNNConvAlgorithmSearch? get convAlgorithmSearch; bool? get convMaxWorkspace; bool? get conv1DPadToNc1D; bool? get cudaGraph; bool? get skipLayerNormStrictMode; bool? get tf32; bool? get preferNhwc; CUDAAttentionBackend? get attentionBackend; bool? get fuseConvBias;
/// Create a copy of CUDAExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CUDAExecutionProviderCopyWith<CUDAExecutionProvider> get copyWith => _$CUDAExecutionProviderCopyWithImpl<CUDAExecutionProvider>(this as CUDAExecutionProvider, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CUDAExecutionProvider&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.memoryLimit, memoryLimit) || other.memoryLimit == memoryLimit)&&(identical(other.arenaExtendStrategy, arenaExtendStrategy) || other.arenaExtendStrategy == arenaExtendStrategy)&&(identical(other.convAlgorithmSearch, convAlgorithmSearch) || other.convAlgorithmSearch == convAlgorithmSearch)&&(identical(other.convMaxWorkspace, convMaxWorkspace) || other.convMaxWorkspace == convMaxWorkspace)&&(identical(other.conv1DPadToNc1D, conv1DPadToNc1D) || other.conv1DPadToNc1D == conv1DPadToNc1D)&&(identical(other.cudaGraph, cudaGraph) || other.cudaGraph == cudaGraph)&&(identical(other.skipLayerNormStrictMode, skipLayerNormStrictMode) || other.skipLayerNormStrictMode == skipLayerNormStrictMode)&&(identical(other.tf32, tf32) || other.tf32 == tf32)&&(identical(other.preferNhwc, preferNhwc) || other.preferNhwc == preferNhwc)&&(identical(other.attentionBackend, attentionBackend) || other.attentionBackend == attentionBackend)&&(identical(other.fuseConvBias, fuseConvBias) || other.fuseConvBias == fuseConvBias));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,memoryLimit,arenaExtendStrategy,convAlgorithmSearch,convMaxWorkspace,conv1DPadToNc1D,cudaGraph,skipLayerNormStrictMode,tf32,preferNhwc,attentionBackend,fuseConvBias);

@override
String toString() {
  return 'CUDAExecutionProvider(deviceId: $deviceId, memoryLimit: $memoryLimit, arenaExtendStrategy: $arenaExtendStrategy, convAlgorithmSearch: $convAlgorithmSearch, convMaxWorkspace: $convMaxWorkspace, conv1DPadToNc1D: $conv1DPadToNc1D, cudaGraph: $cudaGraph, skipLayerNormStrictMode: $skipLayerNormStrictMode, tf32: $tf32, preferNhwc: $preferNhwc, attentionBackend: $attentionBackend, fuseConvBias: $fuseConvBias)';
}


}

/// @nodoc
abstract mixin class $CUDAExecutionProviderCopyWith<$Res>  {
  factory $CUDAExecutionProviderCopyWith(CUDAExecutionProvider value, $Res Function(CUDAExecutionProvider) _then) = _$CUDAExecutionProviderCopyWithImpl;
@useResult
$Res call({
 int? deviceId, int? memoryLimit, ArenaExtendStrategy? arenaExtendStrategy, CuDNNConvAlgorithmSearch? convAlgorithmSearch, bool? convMaxWorkspace, bool? conv1DPadToNc1D, bool? cudaGraph, bool? skipLayerNormStrictMode, bool? tf32, bool? preferNhwc, CUDAAttentionBackend? attentionBackend, bool? fuseConvBias
});




}
/// @nodoc
class _$CUDAExecutionProviderCopyWithImpl<$Res>
    implements $CUDAExecutionProviderCopyWith<$Res> {
  _$CUDAExecutionProviderCopyWithImpl(this._self, this._then);

  final CUDAExecutionProvider _self;
  final $Res Function(CUDAExecutionProvider) _then;

/// Create a copy of CUDAExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = freezed,Object? memoryLimit = freezed,Object? arenaExtendStrategy = freezed,Object? convAlgorithmSearch = freezed,Object? convMaxWorkspace = freezed,Object? conv1DPadToNc1D = freezed,Object? cudaGraph = freezed,Object? skipLayerNormStrictMode = freezed,Object? tf32 = freezed,Object? preferNhwc = freezed,Object? attentionBackend = freezed,Object? fuseConvBias = freezed,}) {
  return _then(_self.copyWith(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,memoryLimit: freezed == memoryLimit ? _self.memoryLimit : memoryLimit // ignore: cast_nullable_to_non_nullable
as int?,arenaExtendStrategy: freezed == arenaExtendStrategy ? _self.arenaExtendStrategy : arenaExtendStrategy // ignore: cast_nullable_to_non_nullable
as ArenaExtendStrategy?,convAlgorithmSearch: freezed == convAlgorithmSearch ? _self.convAlgorithmSearch : convAlgorithmSearch // ignore: cast_nullable_to_non_nullable
as CuDNNConvAlgorithmSearch?,convMaxWorkspace: freezed == convMaxWorkspace ? _self.convMaxWorkspace : convMaxWorkspace // ignore: cast_nullable_to_non_nullable
as bool?,conv1DPadToNc1D: freezed == conv1DPadToNc1D ? _self.conv1DPadToNc1D : conv1DPadToNc1D // ignore: cast_nullable_to_non_nullable
as bool?,cudaGraph: freezed == cudaGraph ? _self.cudaGraph : cudaGraph // ignore: cast_nullable_to_non_nullable
as bool?,skipLayerNormStrictMode: freezed == skipLayerNormStrictMode ? _self.skipLayerNormStrictMode : skipLayerNormStrictMode // ignore: cast_nullable_to_non_nullable
as bool?,tf32: freezed == tf32 ? _self.tf32 : tf32 // ignore: cast_nullable_to_non_nullable
as bool?,preferNhwc: freezed == preferNhwc ? _self.preferNhwc : preferNhwc // ignore: cast_nullable_to_non_nullable
as bool?,attentionBackend: freezed == attentionBackend ? _self.attentionBackend : attentionBackend // ignore: cast_nullable_to_non_nullable
as CUDAAttentionBackend?,fuseConvBias: freezed == fuseConvBias ? _self.fuseConvBias : fuseConvBias // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [CUDAExecutionProvider].
extension CUDAExecutionProviderPatterns on CUDAExecutionProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CUDAExecutionProvider value)?  raw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CUDAExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CUDAExecutionProvider value)  raw,}){
final _that = this;
switch (_that) {
case _CUDAExecutionProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CUDAExecutionProvider value)?  raw,}){
final _that = this;
switch (_that) {
case _CUDAExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? deviceId,  int? memoryLimit,  ArenaExtendStrategy? arenaExtendStrategy,  CuDNNConvAlgorithmSearch? convAlgorithmSearch,  bool? convMaxWorkspace,  bool? conv1DPadToNc1D,  bool? cudaGraph,  bool? skipLayerNormStrictMode,  bool? tf32,  bool? preferNhwc,  CUDAAttentionBackend? attentionBackend,  bool? fuseConvBias)?  raw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CUDAExecutionProvider() when raw != null:
return raw(_that.deviceId,_that.memoryLimit,_that.arenaExtendStrategy,_that.convAlgorithmSearch,_that.convMaxWorkspace,_that.conv1DPadToNc1D,_that.cudaGraph,_that.skipLayerNormStrictMode,_that.tf32,_that.preferNhwc,_that.attentionBackend,_that.fuseConvBias);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? deviceId,  int? memoryLimit,  ArenaExtendStrategy? arenaExtendStrategy,  CuDNNConvAlgorithmSearch? convAlgorithmSearch,  bool? convMaxWorkspace,  bool? conv1DPadToNc1D,  bool? cudaGraph,  bool? skipLayerNormStrictMode,  bool? tf32,  bool? preferNhwc,  CUDAAttentionBackend? attentionBackend,  bool? fuseConvBias)  raw,}) {final _that = this;
switch (_that) {
case _CUDAExecutionProvider():
return raw(_that.deviceId,_that.memoryLimit,_that.arenaExtendStrategy,_that.convAlgorithmSearch,_that.convMaxWorkspace,_that.conv1DPadToNc1D,_that.cudaGraph,_that.skipLayerNormStrictMode,_that.tf32,_that.preferNhwc,_that.attentionBackend,_that.fuseConvBias);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? deviceId,  int? memoryLimit,  ArenaExtendStrategy? arenaExtendStrategy,  CuDNNConvAlgorithmSearch? convAlgorithmSearch,  bool? convMaxWorkspace,  bool? conv1DPadToNc1D,  bool? cudaGraph,  bool? skipLayerNormStrictMode,  bool? tf32,  bool? preferNhwc,  CUDAAttentionBackend? attentionBackend,  bool? fuseConvBias)?  raw,}) {final _that = this;
switch (_that) {
case _CUDAExecutionProvider() when raw != null:
return raw(_that.deviceId,_that.memoryLimit,_that.arenaExtendStrategy,_that.convAlgorithmSearch,_that.convMaxWorkspace,_that.conv1DPadToNc1D,_that.cudaGraph,_that.skipLayerNormStrictMode,_that.tf32,_that.preferNhwc,_that.attentionBackend,_that.fuseConvBias);case _:
  return null;

}
}

}

/// @nodoc


class _CUDAExecutionProvider extends CUDAExecutionProvider {
  const _CUDAExecutionProvider({this.deviceId, this.memoryLimit, this.arenaExtendStrategy, this.convAlgorithmSearch, this.convMaxWorkspace, this.conv1DPadToNc1D, this.cudaGraph, this.skipLayerNormStrictMode, this.tf32, this.preferNhwc, this.attentionBackend, this.fuseConvBias}): super._();
  

@override final  int? deviceId;
@override final  int? memoryLimit;
@override final  ArenaExtendStrategy? arenaExtendStrategy;
@override final  CuDNNConvAlgorithmSearch? convAlgorithmSearch;
@override final  bool? convMaxWorkspace;
@override final  bool? conv1DPadToNc1D;
@override final  bool? cudaGraph;
@override final  bool? skipLayerNormStrictMode;
@override final  bool? tf32;
@override final  bool? preferNhwc;
@override final  CUDAAttentionBackend? attentionBackend;
@override final  bool? fuseConvBias;

/// Create a copy of CUDAExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CUDAExecutionProviderCopyWith<_CUDAExecutionProvider> get copyWith => __$CUDAExecutionProviderCopyWithImpl<_CUDAExecutionProvider>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CUDAExecutionProvider&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.memoryLimit, memoryLimit) || other.memoryLimit == memoryLimit)&&(identical(other.arenaExtendStrategy, arenaExtendStrategy) || other.arenaExtendStrategy == arenaExtendStrategy)&&(identical(other.convAlgorithmSearch, convAlgorithmSearch) || other.convAlgorithmSearch == convAlgorithmSearch)&&(identical(other.convMaxWorkspace, convMaxWorkspace) || other.convMaxWorkspace == convMaxWorkspace)&&(identical(other.conv1DPadToNc1D, conv1DPadToNc1D) || other.conv1DPadToNc1D == conv1DPadToNc1D)&&(identical(other.cudaGraph, cudaGraph) || other.cudaGraph == cudaGraph)&&(identical(other.skipLayerNormStrictMode, skipLayerNormStrictMode) || other.skipLayerNormStrictMode == skipLayerNormStrictMode)&&(identical(other.tf32, tf32) || other.tf32 == tf32)&&(identical(other.preferNhwc, preferNhwc) || other.preferNhwc == preferNhwc)&&(identical(other.attentionBackend, attentionBackend) || other.attentionBackend == attentionBackend)&&(identical(other.fuseConvBias, fuseConvBias) || other.fuseConvBias == fuseConvBias));
}


@override
int get hashCode => Object.hash(runtimeType,deviceId,memoryLimit,arenaExtendStrategy,convAlgorithmSearch,convMaxWorkspace,conv1DPadToNc1D,cudaGraph,skipLayerNormStrictMode,tf32,preferNhwc,attentionBackend,fuseConvBias);

@override
String toString() {
  return 'CUDAExecutionProvider.raw(deviceId: $deviceId, memoryLimit: $memoryLimit, arenaExtendStrategy: $arenaExtendStrategy, convAlgorithmSearch: $convAlgorithmSearch, convMaxWorkspace: $convMaxWorkspace, conv1DPadToNc1D: $conv1DPadToNc1D, cudaGraph: $cudaGraph, skipLayerNormStrictMode: $skipLayerNormStrictMode, tf32: $tf32, preferNhwc: $preferNhwc, attentionBackend: $attentionBackend, fuseConvBias: $fuseConvBias)';
}


}

/// @nodoc
abstract mixin class _$CUDAExecutionProviderCopyWith<$Res> implements $CUDAExecutionProviderCopyWith<$Res> {
  factory _$CUDAExecutionProviderCopyWith(_CUDAExecutionProvider value, $Res Function(_CUDAExecutionProvider) _then) = __$CUDAExecutionProviderCopyWithImpl;
@override @useResult
$Res call({
 int? deviceId, int? memoryLimit, ArenaExtendStrategy? arenaExtendStrategy, CuDNNConvAlgorithmSearch? convAlgorithmSearch, bool? convMaxWorkspace, bool? conv1DPadToNc1D, bool? cudaGraph, bool? skipLayerNormStrictMode, bool? tf32, bool? preferNhwc, CUDAAttentionBackend? attentionBackend, bool? fuseConvBias
});




}
/// @nodoc
class __$CUDAExecutionProviderCopyWithImpl<$Res>
    implements _$CUDAExecutionProviderCopyWith<$Res> {
  __$CUDAExecutionProviderCopyWithImpl(this._self, this._then);

  final _CUDAExecutionProvider _self;
  final $Res Function(_CUDAExecutionProvider) _then;

/// Create a copy of CUDAExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = freezed,Object? memoryLimit = freezed,Object? arenaExtendStrategy = freezed,Object? convAlgorithmSearch = freezed,Object? convMaxWorkspace = freezed,Object? conv1DPadToNc1D = freezed,Object? cudaGraph = freezed,Object? skipLayerNormStrictMode = freezed,Object? tf32 = freezed,Object? preferNhwc = freezed,Object? attentionBackend = freezed,Object? fuseConvBias = freezed,}) {
  return _then(_CUDAExecutionProvider(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,memoryLimit: freezed == memoryLimit ? _self.memoryLimit : memoryLimit // ignore: cast_nullable_to_non_nullable
as int?,arenaExtendStrategy: freezed == arenaExtendStrategy ? _self.arenaExtendStrategy : arenaExtendStrategy // ignore: cast_nullable_to_non_nullable
as ArenaExtendStrategy?,convAlgorithmSearch: freezed == convAlgorithmSearch ? _self.convAlgorithmSearch : convAlgorithmSearch // ignore: cast_nullable_to_non_nullable
as CuDNNConvAlgorithmSearch?,convMaxWorkspace: freezed == convMaxWorkspace ? _self.convMaxWorkspace : convMaxWorkspace // ignore: cast_nullable_to_non_nullable
as bool?,conv1DPadToNc1D: freezed == conv1DPadToNc1D ? _self.conv1DPadToNc1D : conv1DPadToNc1D // ignore: cast_nullable_to_non_nullable
as bool?,cudaGraph: freezed == cudaGraph ? _self.cudaGraph : cudaGraph // ignore: cast_nullable_to_non_nullable
as bool?,skipLayerNormStrictMode: freezed == skipLayerNormStrictMode ? _self.skipLayerNormStrictMode : skipLayerNormStrictMode // ignore: cast_nullable_to_non_nullable
as bool?,tf32: freezed == tf32 ? _self.tf32 : tf32 // ignore: cast_nullable_to_non_nullable
as bool?,preferNhwc: freezed == preferNhwc ? _self.preferNhwc : preferNhwc // ignore: cast_nullable_to_non_nullable
as bool?,attentionBackend: freezed == attentionBackend ? _self.attentionBackend : attentionBackend // ignore: cast_nullable_to_non_nullable
as CUDAAttentionBackend?,fuseConvBias: freezed == fuseConvBias ? _self.fuseConvBias : fuseConvBias // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
