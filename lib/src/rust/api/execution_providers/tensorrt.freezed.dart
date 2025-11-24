// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tensorrt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TensorRTExecutionProvider {

 int? get deviceId; int? get maxWorkspaceSize; int? get minSubgraphSize; int? get maxPartitionIterations; bool? get fp16; bool? get int8; bool? get dla; int? get dlaCore; String? get int8CalibrationTableName; bool? get int8UseNativeCalibrationTable; bool? get engineCache; String? get engineCachePath; bool? get dumpSubgraphs; String? get engineCachePrefix; bool? get weightStrippedEngine; String? get onnxModelFolderPath; bool? get engineDecryption; String? get engineDecryptionLibPath; bool? get forceSequentialEngineBuild; bool? get contextMemorySharing; bool? get layerNormFp32Fallback; bool? get timingCache; String? get timingCachePath; bool? get forceTimingCache; bool? get detailedBuildLog; bool? get buildHeuristics; bool? get sparsity; int? get builderOptimizationLevel; int? get auxiliaryStreams; String? get tacticSources; String? get extraPluginLibPaths; String? get profileMinShapes; String? get profileMaxShapes; String? get profileOptShapes; bool? get cudaGraph; bool? get dumpEpContextModel; String? get epContextFilePath; int? get epContextEmbedMode; bool? get engineHwCompatible;
/// Create a copy of TensorRTExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TensorRTExecutionProviderCopyWith<TensorRTExecutionProvider> get copyWith => _$TensorRTExecutionProviderCopyWithImpl<TensorRTExecutionProvider>(this as TensorRTExecutionProvider, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TensorRTExecutionProvider&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.maxWorkspaceSize, maxWorkspaceSize) || other.maxWorkspaceSize == maxWorkspaceSize)&&(identical(other.minSubgraphSize, minSubgraphSize) || other.minSubgraphSize == minSubgraphSize)&&(identical(other.maxPartitionIterations, maxPartitionIterations) || other.maxPartitionIterations == maxPartitionIterations)&&(identical(other.fp16, fp16) || other.fp16 == fp16)&&(identical(other.int8, int8) || other.int8 == int8)&&(identical(other.dla, dla) || other.dla == dla)&&(identical(other.dlaCore, dlaCore) || other.dlaCore == dlaCore)&&(identical(other.int8CalibrationTableName, int8CalibrationTableName) || other.int8CalibrationTableName == int8CalibrationTableName)&&(identical(other.int8UseNativeCalibrationTable, int8UseNativeCalibrationTable) || other.int8UseNativeCalibrationTable == int8UseNativeCalibrationTable)&&(identical(other.engineCache, engineCache) || other.engineCache == engineCache)&&(identical(other.engineCachePath, engineCachePath) || other.engineCachePath == engineCachePath)&&(identical(other.dumpSubgraphs, dumpSubgraphs) || other.dumpSubgraphs == dumpSubgraphs)&&(identical(other.engineCachePrefix, engineCachePrefix) || other.engineCachePrefix == engineCachePrefix)&&(identical(other.weightStrippedEngine, weightStrippedEngine) || other.weightStrippedEngine == weightStrippedEngine)&&(identical(other.onnxModelFolderPath, onnxModelFolderPath) || other.onnxModelFolderPath == onnxModelFolderPath)&&(identical(other.engineDecryption, engineDecryption) || other.engineDecryption == engineDecryption)&&(identical(other.engineDecryptionLibPath, engineDecryptionLibPath) || other.engineDecryptionLibPath == engineDecryptionLibPath)&&(identical(other.forceSequentialEngineBuild, forceSequentialEngineBuild) || other.forceSequentialEngineBuild == forceSequentialEngineBuild)&&(identical(other.contextMemorySharing, contextMemorySharing) || other.contextMemorySharing == contextMemorySharing)&&(identical(other.layerNormFp32Fallback, layerNormFp32Fallback) || other.layerNormFp32Fallback == layerNormFp32Fallback)&&(identical(other.timingCache, timingCache) || other.timingCache == timingCache)&&(identical(other.timingCachePath, timingCachePath) || other.timingCachePath == timingCachePath)&&(identical(other.forceTimingCache, forceTimingCache) || other.forceTimingCache == forceTimingCache)&&(identical(other.detailedBuildLog, detailedBuildLog) || other.detailedBuildLog == detailedBuildLog)&&(identical(other.buildHeuristics, buildHeuristics) || other.buildHeuristics == buildHeuristics)&&(identical(other.sparsity, sparsity) || other.sparsity == sparsity)&&(identical(other.builderOptimizationLevel, builderOptimizationLevel) || other.builderOptimizationLevel == builderOptimizationLevel)&&(identical(other.auxiliaryStreams, auxiliaryStreams) || other.auxiliaryStreams == auxiliaryStreams)&&(identical(other.tacticSources, tacticSources) || other.tacticSources == tacticSources)&&(identical(other.extraPluginLibPaths, extraPluginLibPaths) || other.extraPluginLibPaths == extraPluginLibPaths)&&(identical(other.profileMinShapes, profileMinShapes) || other.profileMinShapes == profileMinShapes)&&(identical(other.profileMaxShapes, profileMaxShapes) || other.profileMaxShapes == profileMaxShapes)&&(identical(other.profileOptShapes, profileOptShapes) || other.profileOptShapes == profileOptShapes)&&(identical(other.cudaGraph, cudaGraph) || other.cudaGraph == cudaGraph)&&(identical(other.dumpEpContextModel, dumpEpContextModel) || other.dumpEpContextModel == dumpEpContextModel)&&(identical(other.epContextFilePath, epContextFilePath) || other.epContextFilePath == epContextFilePath)&&(identical(other.epContextEmbedMode, epContextEmbedMode) || other.epContextEmbedMode == epContextEmbedMode)&&(identical(other.engineHwCompatible, engineHwCompatible) || other.engineHwCompatible == engineHwCompatible));
}


@override
int get hashCode => Object.hashAll([runtimeType,deviceId,maxWorkspaceSize,minSubgraphSize,maxPartitionIterations,fp16,int8,dla,dlaCore,int8CalibrationTableName,int8UseNativeCalibrationTable,engineCache,engineCachePath,dumpSubgraphs,engineCachePrefix,weightStrippedEngine,onnxModelFolderPath,engineDecryption,engineDecryptionLibPath,forceSequentialEngineBuild,contextMemorySharing,layerNormFp32Fallback,timingCache,timingCachePath,forceTimingCache,detailedBuildLog,buildHeuristics,sparsity,builderOptimizationLevel,auxiliaryStreams,tacticSources,extraPluginLibPaths,profileMinShapes,profileMaxShapes,profileOptShapes,cudaGraph,dumpEpContextModel,epContextFilePath,epContextEmbedMode,engineHwCompatible]);

@override
String toString() {
  return 'TensorRTExecutionProvider(deviceId: $deviceId, maxWorkspaceSize: $maxWorkspaceSize, minSubgraphSize: $minSubgraphSize, maxPartitionIterations: $maxPartitionIterations, fp16: $fp16, int8: $int8, dla: $dla, dlaCore: $dlaCore, int8CalibrationTableName: $int8CalibrationTableName, int8UseNativeCalibrationTable: $int8UseNativeCalibrationTable, engineCache: $engineCache, engineCachePath: $engineCachePath, dumpSubgraphs: $dumpSubgraphs, engineCachePrefix: $engineCachePrefix, weightStrippedEngine: $weightStrippedEngine, onnxModelFolderPath: $onnxModelFolderPath, engineDecryption: $engineDecryption, engineDecryptionLibPath: $engineDecryptionLibPath, forceSequentialEngineBuild: $forceSequentialEngineBuild, contextMemorySharing: $contextMemorySharing, layerNormFp32Fallback: $layerNormFp32Fallback, timingCache: $timingCache, timingCachePath: $timingCachePath, forceTimingCache: $forceTimingCache, detailedBuildLog: $detailedBuildLog, buildHeuristics: $buildHeuristics, sparsity: $sparsity, builderOptimizationLevel: $builderOptimizationLevel, auxiliaryStreams: $auxiliaryStreams, tacticSources: $tacticSources, extraPluginLibPaths: $extraPluginLibPaths, profileMinShapes: $profileMinShapes, profileMaxShapes: $profileMaxShapes, profileOptShapes: $profileOptShapes, cudaGraph: $cudaGraph, dumpEpContextModel: $dumpEpContextModel, epContextFilePath: $epContextFilePath, epContextEmbedMode: $epContextEmbedMode, engineHwCompatible: $engineHwCompatible)';
}


}

/// @nodoc
abstract mixin class $TensorRTExecutionProviderCopyWith<$Res>  {
  factory $TensorRTExecutionProviderCopyWith(TensorRTExecutionProvider value, $Res Function(TensorRTExecutionProvider) _then) = _$TensorRTExecutionProviderCopyWithImpl;
@useResult
$Res call({
 int? deviceId, int? maxWorkspaceSize, int? minSubgraphSize, int? maxPartitionIterations, bool? fp16, bool? int8, bool? dla, int? dlaCore, String? int8CalibrationTableName, bool? int8UseNativeCalibrationTable, bool? engineCache, String? engineCachePath, bool? dumpSubgraphs, String? engineCachePrefix, bool? weightStrippedEngine, String? onnxModelFolderPath, bool? engineDecryption, String? engineDecryptionLibPath, bool? forceSequentialEngineBuild, bool? contextMemorySharing, bool? layerNormFp32Fallback, bool? timingCache, String? timingCachePath, bool? forceTimingCache, bool? detailedBuildLog, bool? buildHeuristics, bool? sparsity, int? builderOptimizationLevel, int? auxiliaryStreams, String? tacticSources, String? extraPluginLibPaths, String? profileMinShapes, String? profileMaxShapes, String? profileOptShapes, bool? cudaGraph, bool? dumpEpContextModel, String? epContextFilePath, int? epContextEmbedMode, bool? engineHwCompatible
});




}
/// @nodoc
class _$TensorRTExecutionProviderCopyWithImpl<$Res>
    implements $TensorRTExecutionProviderCopyWith<$Res> {
  _$TensorRTExecutionProviderCopyWithImpl(this._self, this._then);

  final TensorRTExecutionProvider _self;
  final $Res Function(TensorRTExecutionProvider) _then;

/// Create a copy of TensorRTExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = freezed,Object? maxWorkspaceSize = freezed,Object? minSubgraphSize = freezed,Object? maxPartitionIterations = freezed,Object? fp16 = freezed,Object? int8 = freezed,Object? dla = freezed,Object? dlaCore = freezed,Object? int8CalibrationTableName = freezed,Object? int8UseNativeCalibrationTable = freezed,Object? engineCache = freezed,Object? engineCachePath = freezed,Object? dumpSubgraphs = freezed,Object? engineCachePrefix = freezed,Object? weightStrippedEngine = freezed,Object? onnxModelFolderPath = freezed,Object? engineDecryption = freezed,Object? engineDecryptionLibPath = freezed,Object? forceSequentialEngineBuild = freezed,Object? contextMemorySharing = freezed,Object? layerNormFp32Fallback = freezed,Object? timingCache = freezed,Object? timingCachePath = freezed,Object? forceTimingCache = freezed,Object? detailedBuildLog = freezed,Object? buildHeuristics = freezed,Object? sparsity = freezed,Object? builderOptimizationLevel = freezed,Object? auxiliaryStreams = freezed,Object? tacticSources = freezed,Object? extraPluginLibPaths = freezed,Object? profileMinShapes = freezed,Object? profileMaxShapes = freezed,Object? profileOptShapes = freezed,Object? cudaGraph = freezed,Object? dumpEpContextModel = freezed,Object? epContextFilePath = freezed,Object? epContextEmbedMode = freezed,Object? engineHwCompatible = freezed,}) {
  return _then(_self.copyWith(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,maxWorkspaceSize: freezed == maxWorkspaceSize ? _self.maxWorkspaceSize : maxWorkspaceSize // ignore: cast_nullable_to_non_nullable
as int?,minSubgraphSize: freezed == minSubgraphSize ? _self.minSubgraphSize : minSubgraphSize // ignore: cast_nullable_to_non_nullable
as int?,maxPartitionIterations: freezed == maxPartitionIterations ? _self.maxPartitionIterations : maxPartitionIterations // ignore: cast_nullable_to_non_nullable
as int?,fp16: freezed == fp16 ? _self.fp16 : fp16 // ignore: cast_nullable_to_non_nullable
as bool?,int8: freezed == int8 ? _self.int8 : int8 // ignore: cast_nullable_to_non_nullable
as bool?,dla: freezed == dla ? _self.dla : dla // ignore: cast_nullable_to_non_nullable
as bool?,dlaCore: freezed == dlaCore ? _self.dlaCore : dlaCore // ignore: cast_nullable_to_non_nullable
as int?,int8CalibrationTableName: freezed == int8CalibrationTableName ? _self.int8CalibrationTableName : int8CalibrationTableName // ignore: cast_nullable_to_non_nullable
as String?,int8UseNativeCalibrationTable: freezed == int8UseNativeCalibrationTable ? _self.int8UseNativeCalibrationTable : int8UseNativeCalibrationTable // ignore: cast_nullable_to_non_nullable
as bool?,engineCache: freezed == engineCache ? _self.engineCache : engineCache // ignore: cast_nullable_to_non_nullable
as bool?,engineCachePath: freezed == engineCachePath ? _self.engineCachePath : engineCachePath // ignore: cast_nullable_to_non_nullable
as String?,dumpSubgraphs: freezed == dumpSubgraphs ? _self.dumpSubgraphs : dumpSubgraphs // ignore: cast_nullable_to_non_nullable
as bool?,engineCachePrefix: freezed == engineCachePrefix ? _self.engineCachePrefix : engineCachePrefix // ignore: cast_nullable_to_non_nullable
as String?,weightStrippedEngine: freezed == weightStrippedEngine ? _self.weightStrippedEngine : weightStrippedEngine // ignore: cast_nullable_to_non_nullable
as bool?,onnxModelFolderPath: freezed == onnxModelFolderPath ? _self.onnxModelFolderPath : onnxModelFolderPath // ignore: cast_nullable_to_non_nullable
as String?,engineDecryption: freezed == engineDecryption ? _self.engineDecryption : engineDecryption // ignore: cast_nullable_to_non_nullable
as bool?,engineDecryptionLibPath: freezed == engineDecryptionLibPath ? _self.engineDecryptionLibPath : engineDecryptionLibPath // ignore: cast_nullable_to_non_nullable
as String?,forceSequentialEngineBuild: freezed == forceSequentialEngineBuild ? _self.forceSequentialEngineBuild : forceSequentialEngineBuild // ignore: cast_nullable_to_non_nullable
as bool?,contextMemorySharing: freezed == contextMemorySharing ? _self.contextMemorySharing : contextMemorySharing // ignore: cast_nullable_to_non_nullable
as bool?,layerNormFp32Fallback: freezed == layerNormFp32Fallback ? _self.layerNormFp32Fallback : layerNormFp32Fallback // ignore: cast_nullable_to_non_nullable
as bool?,timingCache: freezed == timingCache ? _self.timingCache : timingCache // ignore: cast_nullable_to_non_nullable
as bool?,timingCachePath: freezed == timingCachePath ? _self.timingCachePath : timingCachePath // ignore: cast_nullable_to_non_nullable
as String?,forceTimingCache: freezed == forceTimingCache ? _self.forceTimingCache : forceTimingCache // ignore: cast_nullable_to_non_nullable
as bool?,detailedBuildLog: freezed == detailedBuildLog ? _self.detailedBuildLog : detailedBuildLog // ignore: cast_nullable_to_non_nullable
as bool?,buildHeuristics: freezed == buildHeuristics ? _self.buildHeuristics : buildHeuristics // ignore: cast_nullable_to_non_nullable
as bool?,sparsity: freezed == sparsity ? _self.sparsity : sparsity // ignore: cast_nullable_to_non_nullable
as bool?,builderOptimizationLevel: freezed == builderOptimizationLevel ? _self.builderOptimizationLevel : builderOptimizationLevel // ignore: cast_nullable_to_non_nullable
as int?,auxiliaryStreams: freezed == auxiliaryStreams ? _self.auxiliaryStreams : auxiliaryStreams // ignore: cast_nullable_to_non_nullable
as int?,tacticSources: freezed == tacticSources ? _self.tacticSources : tacticSources // ignore: cast_nullable_to_non_nullable
as String?,extraPluginLibPaths: freezed == extraPluginLibPaths ? _self.extraPluginLibPaths : extraPluginLibPaths // ignore: cast_nullable_to_non_nullable
as String?,profileMinShapes: freezed == profileMinShapes ? _self.profileMinShapes : profileMinShapes // ignore: cast_nullable_to_non_nullable
as String?,profileMaxShapes: freezed == profileMaxShapes ? _self.profileMaxShapes : profileMaxShapes // ignore: cast_nullable_to_non_nullable
as String?,profileOptShapes: freezed == profileOptShapes ? _self.profileOptShapes : profileOptShapes // ignore: cast_nullable_to_non_nullable
as String?,cudaGraph: freezed == cudaGraph ? _self.cudaGraph : cudaGraph // ignore: cast_nullable_to_non_nullable
as bool?,dumpEpContextModel: freezed == dumpEpContextModel ? _self.dumpEpContextModel : dumpEpContextModel // ignore: cast_nullable_to_non_nullable
as bool?,epContextFilePath: freezed == epContextFilePath ? _self.epContextFilePath : epContextFilePath // ignore: cast_nullable_to_non_nullable
as String?,epContextEmbedMode: freezed == epContextEmbedMode ? _self.epContextEmbedMode : epContextEmbedMode // ignore: cast_nullable_to_non_nullable
as int?,engineHwCompatible: freezed == engineHwCompatible ? _self.engineHwCompatible : engineHwCompatible // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TensorRTExecutionProvider].
extension TensorRTExecutionProviderPatterns on TensorRTExecutionProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TensorRTExecutionProvider value)?  raw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TensorRTExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TensorRTExecutionProvider value)  raw,}){
final _that = this;
switch (_that) {
case _TensorRTExecutionProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TensorRTExecutionProvider value)?  raw,}){
final _that = this;
switch (_that) {
case _TensorRTExecutionProvider() when raw != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? deviceId,  int? maxWorkspaceSize,  int? minSubgraphSize,  int? maxPartitionIterations,  bool? fp16,  bool? int8,  bool? dla,  int? dlaCore,  String? int8CalibrationTableName,  bool? int8UseNativeCalibrationTable,  bool? engineCache,  String? engineCachePath,  bool? dumpSubgraphs,  String? engineCachePrefix,  bool? weightStrippedEngine,  String? onnxModelFolderPath,  bool? engineDecryption,  String? engineDecryptionLibPath,  bool? forceSequentialEngineBuild,  bool? contextMemorySharing,  bool? layerNormFp32Fallback,  bool? timingCache,  String? timingCachePath,  bool? forceTimingCache,  bool? detailedBuildLog,  bool? buildHeuristics,  bool? sparsity,  int? builderOptimizationLevel,  int? auxiliaryStreams,  String? tacticSources,  String? extraPluginLibPaths,  String? profileMinShapes,  String? profileMaxShapes,  String? profileOptShapes,  bool? cudaGraph,  bool? dumpEpContextModel,  String? epContextFilePath,  int? epContextEmbedMode,  bool? engineHwCompatible)?  raw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TensorRTExecutionProvider() when raw != null:
return raw(_that.deviceId,_that.maxWorkspaceSize,_that.minSubgraphSize,_that.maxPartitionIterations,_that.fp16,_that.int8,_that.dla,_that.dlaCore,_that.int8CalibrationTableName,_that.int8UseNativeCalibrationTable,_that.engineCache,_that.engineCachePath,_that.dumpSubgraphs,_that.engineCachePrefix,_that.weightStrippedEngine,_that.onnxModelFolderPath,_that.engineDecryption,_that.engineDecryptionLibPath,_that.forceSequentialEngineBuild,_that.contextMemorySharing,_that.layerNormFp32Fallback,_that.timingCache,_that.timingCachePath,_that.forceTimingCache,_that.detailedBuildLog,_that.buildHeuristics,_that.sparsity,_that.builderOptimizationLevel,_that.auxiliaryStreams,_that.tacticSources,_that.extraPluginLibPaths,_that.profileMinShapes,_that.profileMaxShapes,_that.profileOptShapes,_that.cudaGraph,_that.dumpEpContextModel,_that.epContextFilePath,_that.epContextEmbedMode,_that.engineHwCompatible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? deviceId,  int? maxWorkspaceSize,  int? minSubgraphSize,  int? maxPartitionIterations,  bool? fp16,  bool? int8,  bool? dla,  int? dlaCore,  String? int8CalibrationTableName,  bool? int8UseNativeCalibrationTable,  bool? engineCache,  String? engineCachePath,  bool? dumpSubgraphs,  String? engineCachePrefix,  bool? weightStrippedEngine,  String? onnxModelFolderPath,  bool? engineDecryption,  String? engineDecryptionLibPath,  bool? forceSequentialEngineBuild,  bool? contextMemorySharing,  bool? layerNormFp32Fallback,  bool? timingCache,  String? timingCachePath,  bool? forceTimingCache,  bool? detailedBuildLog,  bool? buildHeuristics,  bool? sparsity,  int? builderOptimizationLevel,  int? auxiliaryStreams,  String? tacticSources,  String? extraPluginLibPaths,  String? profileMinShapes,  String? profileMaxShapes,  String? profileOptShapes,  bool? cudaGraph,  bool? dumpEpContextModel,  String? epContextFilePath,  int? epContextEmbedMode,  bool? engineHwCompatible)  raw,}) {final _that = this;
switch (_that) {
case _TensorRTExecutionProvider():
return raw(_that.deviceId,_that.maxWorkspaceSize,_that.minSubgraphSize,_that.maxPartitionIterations,_that.fp16,_that.int8,_that.dla,_that.dlaCore,_that.int8CalibrationTableName,_that.int8UseNativeCalibrationTable,_that.engineCache,_that.engineCachePath,_that.dumpSubgraphs,_that.engineCachePrefix,_that.weightStrippedEngine,_that.onnxModelFolderPath,_that.engineDecryption,_that.engineDecryptionLibPath,_that.forceSequentialEngineBuild,_that.contextMemorySharing,_that.layerNormFp32Fallback,_that.timingCache,_that.timingCachePath,_that.forceTimingCache,_that.detailedBuildLog,_that.buildHeuristics,_that.sparsity,_that.builderOptimizationLevel,_that.auxiliaryStreams,_that.tacticSources,_that.extraPluginLibPaths,_that.profileMinShapes,_that.profileMaxShapes,_that.profileOptShapes,_that.cudaGraph,_that.dumpEpContextModel,_that.epContextFilePath,_that.epContextEmbedMode,_that.engineHwCompatible);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? deviceId,  int? maxWorkspaceSize,  int? minSubgraphSize,  int? maxPartitionIterations,  bool? fp16,  bool? int8,  bool? dla,  int? dlaCore,  String? int8CalibrationTableName,  bool? int8UseNativeCalibrationTable,  bool? engineCache,  String? engineCachePath,  bool? dumpSubgraphs,  String? engineCachePrefix,  bool? weightStrippedEngine,  String? onnxModelFolderPath,  bool? engineDecryption,  String? engineDecryptionLibPath,  bool? forceSequentialEngineBuild,  bool? contextMemorySharing,  bool? layerNormFp32Fallback,  bool? timingCache,  String? timingCachePath,  bool? forceTimingCache,  bool? detailedBuildLog,  bool? buildHeuristics,  bool? sparsity,  int? builderOptimizationLevel,  int? auxiliaryStreams,  String? tacticSources,  String? extraPluginLibPaths,  String? profileMinShapes,  String? profileMaxShapes,  String? profileOptShapes,  bool? cudaGraph,  bool? dumpEpContextModel,  String? epContextFilePath,  int? epContextEmbedMode,  bool? engineHwCompatible)?  raw,}) {final _that = this;
switch (_that) {
case _TensorRTExecutionProvider() when raw != null:
return raw(_that.deviceId,_that.maxWorkspaceSize,_that.minSubgraphSize,_that.maxPartitionIterations,_that.fp16,_that.int8,_that.dla,_that.dlaCore,_that.int8CalibrationTableName,_that.int8UseNativeCalibrationTable,_that.engineCache,_that.engineCachePath,_that.dumpSubgraphs,_that.engineCachePrefix,_that.weightStrippedEngine,_that.onnxModelFolderPath,_that.engineDecryption,_that.engineDecryptionLibPath,_that.forceSequentialEngineBuild,_that.contextMemorySharing,_that.layerNormFp32Fallback,_that.timingCache,_that.timingCachePath,_that.forceTimingCache,_that.detailedBuildLog,_that.buildHeuristics,_that.sparsity,_that.builderOptimizationLevel,_that.auxiliaryStreams,_that.tacticSources,_that.extraPluginLibPaths,_that.profileMinShapes,_that.profileMaxShapes,_that.profileOptShapes,_that.cudaGraph,_that.dumpEpContextModel,_that.epContextFilePath,_that.epContextEmbedMode,_that.engineHwCompatible);case _:
  return null;

}
}

}

/// @nodoc


class _TensorRTExecutionProvider extends TensorRTExecutionProvider {
  const _TensorRTExecutionProvider({this.deviceId, this.maxWorkspaceSize, this.minSubgraphSize, this.maxPartitionIterations, this.fp16, this.int8, this.dla, this.dlaCore, this.int8CalibrationTableName, this.int8UseNativeCalibrationTable, this.engineCache, this.engineCachePath, this.dumpSubgraphs, this.engineCachePrefix, this.weightStrippedEngine, this.onnxModelFolderPath, this.engineDecryption, this.engineDecryptionLibPath, this.forceSequentialEngineBuild, this.contextMemorySharing, this.layerNormFp32Fallback, this.timingCache, this.timingCachePath, this.forceTimingCache, this.detailedBuildLog, this.buildHeuristics, this.sparsity, this.builderOptimizationLevel, this.auxiliaryStreams, this.tacticSources, this.extraPluginLibPaths, this.profileMinShapes, this.profileMaxShapes, this.profileOptShapes, this.cudaGraph, this.dumpEpContextModel, this.epContextFilePath, this.epContextEmbedMode, this.engineHwCompatible}): super._();
  

@override final  int? deviceId;
@override final  int? maxWorkspaceSize;
@override final  int? minSubgraphSize;
@override final  int? maxPartitionIterations;
@override final  bool? fp16;
@override final  bool? int8;
@override final  bool? dla;
@override final  int? dlaCore;
@override final  String? int8CalibrationTableName;
@override final  bool? int8UseNativeCalibrationTable;
@override final  bool? engineCache;
@override final  String? engineCachePath;
@override final  bool? dumpSubgraphs;
@override final  String? engineCachePrefix;
@override final  bool? weightStrippedEngine;
@override final  String? onnxModelFolderPath;
@override final  bool? engineDecryption;
@override final  String? engineDecryptionLibPath;
@override final  bool? forceSequentialEngineBuild;
@override final  bool? contextMemorySharing;
@override final  bool? layerNormFp32Fallback;
@override final  bool? timingCache;
@override final  String? timingCachePath;
@override final  bool? forceTimingCache;
@override final  bool? detailedBuildLog;
@override final  bool? buildHeuristics;
@override final  bool? sparsity;
@override final  int? builderOptimizationLevel;
@override final  int? auxiliaryStreams;
@override final  String? tacticSources;
@override final  String? extraPluginLibPaths;
@override final  String? profileMinShapes;
@override final  String? profileMaxShapes;
@override final  String? profileOptShapes;
@override final  bool? cudaGraph;
@override final  bool? dumpEpContextModel;
@override final  String? epContextFilePath;
@override final  int? epContextEmbedMode;
@override final  bool? engineHwCompatible;

/// Create a copy of TensorRTExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TensorRTExecutionProviderCopyWith<_TensorRTExecutionProvider> get copyWith => __$TensorRTExecutionProviderCopyWithImpl<_TensorRTExecutionProvider>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TensorRTExecutionProvider&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.maxWorkspaceSize, maxWorkspaceSize) || other.maxWorkspaceSize == maxWorkspaceSize)&&(identical(other.minSubgraphSize, minSubgraphSize) || other.minSubgraphSize == minSubgraphSize)&&(identical(other.maxPartitionIterations, maxPartitionIterations) || other.maxPartitionIterations == maxPartitionIterations)&&(identical(other.fp16, fp16) || other.fp16 == fp16)&&(identical(other.int8, int8) || other.int8 == int8)&&(identical(other.dla, dla) || other.dla == dla)&&(identical(other.dlaCore, dlaCore) || other.dlaCore == dlaCore)&&(identical(other.int8CalibrationTableName, int8CalibrationTableName) || other.int8CalibrationTableName == int8CalibrationTableName)&&(identical(other.int8UseNativeCalibrationTable, int8UseNativeCalibrationTable) || other.int8UseNativeCalibrationTable == int8UseNativeCalibrationTable)&&(identical(other.engineCache, engineCache) || other.engineCache == engineCache)&&(identical(other.engineCachePath, engineCachePath) || other.engineCachePath == engineCachePath)&&(identical(other.dumpSubgraphs, dumpSubgraphs) || other.dumpSubgraphs == dumpSubgraphs)&&(identical(other.engineCachePrefix, engineCachePrefix) || other.engineCachePrefix == engineCachePrefix)&&(identical(other.weightStrippedEngine, weightStrippedEngine) || other.weightStrippedEngine == weightStrippedEngine)&&(identical(other.onnxModelFolderPath, onnxModelFolderPath) || other.onnxModelFolderPath == onnxModelFolderPath)&&(identical(other.engineDecryption, engineDecryption) || other.engineDecryption == engineDecryption)&&(identical(other.engineDecryptionLibPath, engineDecryptionLibPath) || other.engineDecryptionLibPath == engineDecryptionLibPath)&&(identical(other.forceSequentialEngineBuild, forceSequentialEngineBuild) || other.forceSequentialEngineBuild == forceSequentialEngineBuild)&&(identical(other.contextMemorySharing, contextMemorySharing) || other.contextMemorySharing == contextMemorySharing)&&(identical(other.layerNormFp32Fallback, layerNormFp32Fallback) || other.layerNormFp32Fallback == layerNormFp32Fallback)&&(identical(other.timingCache, timingCache) || other.timingCache == timingCache)&&(identical(other.timingCachePath, timingCachePath) || other.timingCachePath == timingCachePath)&&(identical(other.forceTimingCache, forceTimingCache) || other.forceTimingCache == forceTimingCache)&&(identical(other.detailedBuildLog, detailedBuildLog) || other.detailedBuildLog == detailedBuildLog)&&(identical(other.buildHeuristics, buildHeuristics) || other.buildHeuristics == buildHeuristics)&&(identical(other.sparsity, sparsity) || other.sparsity == sparsity)&&(identical(other.builderOptimizationLevel, builderOptimizationLevel) || other.builderOptimizationLevel == builderOptimizationLevel)&&(identical(other.auxiliaryStreams, auxiliaryStreams) || other.auxiliaryStreams == auxiliaryStreams)&&(identical(other.tacticSources, tacticSources) || other.tacticSources == tacticSources)&&(identical(other.extraPluginLibPaths, extraPluginLibPaths) || other.extraPluginLibPaths == extraPluginLibPaths)&&(identical(other.profileMinShapes, profileMinShapes) || other.profileMinShapes == profileMinShapes)&&(identical(other.profileMaxShapes, profileMaxShapes) || other.profileMaxShapes == profileMaxShapes)&&(identical(other.profileOptShapes, profileOptShapes) || other.profileOptShapes == profileOptShapes)&&(identical(other.cudaGraph, cudaGraph) || other.cudaGraph == cudaGraph)&&(identical(other.dumpEpContextModel, dumpEpContextModel) || other.dumpEpContextModel == dumpEpContextModel)&&(identical(other.epContextFilePath, epContextFilePath) || other.epContextFilePath == epContextFilePath)&&(identical(other.epContextEmbedMode, epContextEmbedMode) || other.epContextEmbedMode == epContextEmbedMode)&&(identical(other.engineHwCompatible, engineHwCompatible) || other.engineHwCompatible == engineHwCompatible));
}


@override
int get hashCode => Object.hashAll([runtimeType,deviceId,maxWorkspaceSize,minSubgraphSize,maxPartitionIterations,fp16,int8,dla,dlaCore,int8CalibrationTableName,int8UseNativeCalibrationTable,engineCache,engineCachePath,dumpSubgraphs,engineCachePrefix,weightStrippedEngine,onnxModelFolderPath,engineDecryption,engineDecryptionLibPath,forceSequentialEngineBuild,contextMemorySharing,layerNormFp32Fallback,timingCache,timingCachePath,forceTimingCache,detailedBuildLog,buildHeuristics,sparsity,builderOptimizationLevel,auxiliaryStreams,tacticSources,extraPluginLibPaths,profileMinShapes,profileMaxShapes,profileOptShapes,cudaGraph,dumpEpContextModel,epContextFilePath,epContextEmbedMode,engineHwCompatible]);

@override
String toString() {
  return 'TensorRTExecutionProvider.raw(deviceId: $deviceId, maxWorkspaceSize: $maxWorkspaceSize, minSubgraphSize: $minSubgraphSize, maxPartitionIterations: $maxPartitionIterations, fp16: $fp16, int8: $int8, dla: $dla, dlaCore: $dlaCore, int8CalibrationTableName: $int8CalibrationTableName, int8UseNativeCalibrationTable: $int8UseNativeCalibrationTable, engineCache: $engineCache, engineCachePath: $engineCachePath, dumpSubgraphs: $dumpSubgraphs, engineCachePrefix: $engineCachePrefix, weightStrippedEngine: $weightStrippedEngine, onnxModelFolderPath: $onnxModelFolderPath, engineDecryption: $engineDecryption, engineDecryptionLibPath: $engineDecryptionLibPath, forceSequentialEngineBuild: $forceSequentialEngineBuild, contextMemorySharing: $contextMemorySharing, layerNormFp32Fallback: $layerNormFp32Fallback, timingCache: $timingCache, timingCachePath: $timingCachePath, forceTimingCache: $forceTimingCache, detailedBuildLog: $detailedBuildLog, buildHeuristics: $buildHeuristics, sparsity: $sparsity, builderOptimizationLevel: $builderOptimizationLevel, auxiliaryStreams: $auxiliaryStreams, tacticSources: $tacticSources, extraPluginLibPaths: $extraPluginLibPaths, profileMinShapes: $profileMinShapes, profileMaxShapes: $profileMaxShapes, profileOptShapes: $profileOptShapes, cudaGraph: $cudaGraph, dumpEpContextModel: $dumpEpContextModel, epContextFilePath: $epContextFilePath, epContextEmbedMode: $epContextEmbedMode, engineHwCompatible: $engineHwCompatible)';
}


}

/// @nodoc
abstract mixin class _$TensorRTExecutionProviderCopyWith<$Res> implements $TensorRTExecutionProviderCopyWith<$Res> {
  factory _$TensorRTExecutionProviderCopyWith(_TensorRTExecutionProvider value, $Res Function(_TensorRTExecutionProvider) _then) = __$TensorRTExecutionProviderCopyWithImpl;
@override @useResult
$Res call({
 int? deviceId, int? maxWorkspaceSize, int? minSubgraphSize, int? maxPartitionIterations, bool? fp16, bool? int8, bool? dla, int? dlaCore, String? int8CalibrationTableName, bool? int8UseNativeCalibrationTable, bool? engineCache, String? engineCachePath, bool? dumpSubgraphs, String? engineCachePrefix, bool? weightStrippedEngine, String? onnxModelFolderPath, bool? engineDecryption, String? engineDecryptionLibPath, bool? forceSequentialEngineBuild, bool? contextMemorySharing, bool? layerNormFp32Fallback, bool? timingCache, String? timingCachePath, bool? forceTimingCache, bool? detailedBuildLog, bool? buildHeuristics, bool? sparsity, int? builderOptimizationLevel, int? auxiliaryStreams, String? tacticSources, String? extraPluginLibPaths, String? profileMinShapes, String? profileMaxShapes, String? profileOptShapes, bool? cudaGraph, bool? dumpEpContextModel, String? epContextFilePath, int? epContextEmbedMode, bool? engineHwCompatible
});




}
/// @nodoc
class __$TensorRTExecutionProviderCopyWithImpl<$Res>
    implements _$TensorRTExecutionProviderCopyWith<$Res> {
  __$TensorRTExecutionProviderCopyWithImpl(this._self, this._then);

  final _TensorRTExecutionProvider _self;
  final $Res Function(_TensorRTExecutionProvider) _then;

/// Create a copy of TensorRTExecutionProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = freezed,Object? maxWorkspaceSize = freezed,Object? minSubgraphSize = freezed,Object? maxPartitionIterations = freezed,Object? fp16 = freezed,Object? int8 = freezed,Object? dla = freezed,Object? dlaCore = freezed,Object? int8CalibrationTableName = freezed,Object? int8UseNativeCalibrationTable = freezed,Object? engineCache = freezed,Object? engineCachePath = freezed,Object? dumpSubgraphs = freezed,Object? engineCachePrefix = freezed,Object? weightStrippedEngine = freezed,Object? onnxModelFolderPath = freezed,Object? engineDecryption = freezed,Object? engineDecryptionLibPath = freezed,Object? forceSequentialEngineBuild = freezed,Object? contextMemorySharing = freezed,Object? layerNormFp32Fallback = freezed,Object? timingCache = freezed,Object? timingCachePath = freezed,Object? forceTimingCache = freezed,Object? detailedBuildLog = freezed,Object? buildHeuristics = freezed,Object? sparsity = freezed,Object? builderOptimizationLevel = freezed,Object? auxiliaryStreams = freezed,Object? tacticSources = freezed,Object? extraPluginLibPaths = freezed,Object? profileMinShapes = freezed,Object? profileMaxShapes = freezed,Object? profileOptShapes = freezed,Object? cudaGraph = freezed,Object? dumpEpContextModel = freezed,Object? epContextFilePath = freezed,Object? epContextEmbedMode = freezed,Object? engineHwCompatible = freezed,}) {
  return _then(_TensorRTExecutionProvider(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as int?,maxWorkspaceSize: freezed == maxWorkspaceSize ? _self.maxWorkspaceSize : maxWorkspaceSize // ignore: cast_nullable_to_non_nullable
as int?,minSubgraphSize: freezed == minSubgraphSize ? _self.minSubgraphSize : minSubgraphSize // ignore: cast_nullable_to_non_nullable
as int?,maxPartitionIterations: freezed == maxPartitionIterations ? _self.maxPartitionIterations : maxPartitionIterations // ignore: cast_nullable_to_non_nullable
as int?,fp16: freezed == fp16 ? _self.fp16 : fp16 // ignore: cast_nullable_to_non_nullable
as bool?,int8: freezed == int8 ? _self.int8 : int8 // ignore: cast_nullable_to_non_nullable
as bool?,dla: freezed == dla ? _self.dla : dla // ignore: cast_nullable_to_non_nullable
as bool?,dlaCore: freezed == dlaCore ? _self.dlaCore : dlaCore // ignore: cast_nullable_to_non_nullable
as int?,int8CalibrationTableName: freezed == int8CalibrationTableName ? _self.int8CalibrationTableName : int8CalibrationTableName // ignore: cast_nullable_to_non_nullable
as String?,int8UseNativeCalibrationTable: freezed == int8UseNativeCalibrationTable ? _self.int8UseNativeCalibrationTable : int8UseNativeCalibrationTable // ignore: cast_nullable_to_non_nullable
as bool?,engineCache: freezed == engineCache ? _self.engineCache : engineCache // ignore: cast_nullable_to_non_nullable
as bool?,engineCachePath: freezed == engineCachePath ? _self.engineCachePath : engineCachePath // ignore: cast_nullable_to_non_nullable
as String?,dumpSubgraphs: freezed == dumpSubgraphs ? _self.dumpSubgraphs : dumpSubgraphs // ignore: cast_nullable_to_non_nullable
as bool?,engineCachePrefix: freezed == engineCachePrefix ? _self.engineCachePrefix : engineCachePrefix // ignore: cast_nullable_to_non_nullable
as String?,weightStrippedEngine: freezed == weightStrippedEngine ? _self.weightStrippedEngine : weightStrippedEngine // ignore: cast_nullable_to_non_nullable
as bool?,onnxModelFolderPath: freezed == onnxModelFolderPath ? _self.onnxModelFolderPath : onnxModelFolderPath // ignore: cast_nullable_to_non_nullable
as String?,engineDecryption: freezed == engineDecryption ? _self.engineDecryption : engineDecryption // ignore: cast_nullable_to_non_nullable
as bool?,engineDecryptionLibPath: freezed == engineDecryptionLibPath ? _self.engineDecryptionLibPath : engineDecryptionLibPath // ignore: cast_nullable_to_non_nullable
as String?,forceSequentialEngineBuild: freezed == forceSequentialEngineBuild ? _self.forceSequentialEngineBuild : forceSequentialEngineBuild // ignore: cast_nullable_to_non_nullable
as bool?,contextMemorySharing: freezed == contextMemorySharing ? _self.contextMemorySharing : contextMemorySharing // ignore: cast_nullable_to_non_nullable
as bool?,layerNormFp32Fallback: freezed == layerNormFp32Fallback ? _self.layerNormFp32Fallback : layerNormFp32Fallback // ignore: cast_nullable_to_non_nullable
as bool?,timingCache: freezed == timingCache ? _self.timingCache : timingCache // ignore: cast_nullable_to_non_nullable
as bool?,timingCachePath: freezed == timingCachePath ? _self.timingCachePath : timingCachePath // ignore: cast_nullable_to_non_nullable
as String?,forceTimingCache: freezed == forceTimingCache ? _self.forceTimingCache : forceTimingCache // ignore: cast_nullable_to_non_nullable
as bool?,detailedBuildLog: freezed == detailedBuildLog ? _self.detailedBuildLog : detailedBuildLog // ignore: cast_nullable_to_non_nullable
as bool?,buildHeuristics: freezed == buildHeuristics ? _self.buildHeuristics : buildHeuristics // ignore: cast_nullable_to_non_nullable
as bool?,sparsity: freezed == sparsity ? _self.sparsity : sparsity // ignore: cast_nullable_to_non_nullable
as bool?,builderOptimizationLevel: freezed == builderOptimizationLevel ? _self.builderOptimizationLevel : builderOptimizationLevel // ignore: cast_nullable_to_non_nullable
as int?,auxiliaryStreams: freezed == auxiliaryStreams ? _self.auxiliaryStreams : auxiliaryStreams // ignore: cast_nullable_to_non_nullable
as int?,tacticSources: freezed == tacticSources ? _self.tacticSources : tacticSources // ignore: cast_nullable_to_non_nullable
as String?,extraPluginLibPaths: freezed == extraPluginLibPaths ? _self.extraPluginLibPaths : extraPluginLibPaths // ignore: cast_nullable_to_non_nullable
as String?,profileMinShapes: freezed == profileMinShapes ? _self.profileMinShapes : profileMinShapes // ignore: cast_nullable_to_non_nullable
as String?,profileMaxShapes: freezed == profileMaxShapes ? _self.profileMaxShapes : profileMaxShapes // ignore: cast_nullable_to_non_nullable
as String?,profileOptShapes: freezed == profileOptShapes ? _self.profileOptShapes : profileOptShapes // ignore: cast_nullable_to_non_nullable
as String?,cudaGraph: freezed == cudaGraph ? _self.cudaGraph : cudaGraph // ignore: cast_nullable_to_non_nullable
as bool?,dumpEpContextModel: freezed == dumpEpContextModel ? _self.dumpEpContextModel : dumpEpContextModel // ignore: cast_nullable_to_non_nullable
as bool?,epContextFilePath: freezed == epContextFilePath ? _self.epContextFilePath : epContextFilePath // ignore: cast_nullable_to_non_nullable
as String?,epContextEmbedMode: freezed == epContextEmbedMode ? _self.epContextEmbedMode : epContextEmbedMode // ignore: cast_nullable_to_non_nullable
as int?,engineHwCompatible: freezed == engineHwCompatible ? _self.engineHwCompatible : engineHwCompatible // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
