import 'package:ort/src/api/execution_providers/execution_providers.dart';
import 'package:ort/src/rust/api/execution_providers/tensorrt.dart' as tensorrt;
import 'package:ort/src/rust/api/execution_providers.dart' as ort_ep;

/// [TensorRT execution provider](https://onnxruntime.ai/docs/execution-providers/TensorRT-ExecutionProvider.html) for NVIDIA GPUs.
class TensorRTExecutionProvider implements ExecutionProvider {
  tensorrt.TensorRTExecutionProvider _inner = tensorrt.TensorRTExecutionProvider.raw();

  TensorRTExecutionProvider();

  @override
  bool isAvailable() => _inner.isAvailable();

  @override
  String name() => _inner.name();

  @override
  bool supportedByPlatform() => _inner.supportedByPlatform();

  @override
  ort_ep.ExecutionProvider toImpl() => ort_ep.ExecutionProvider.tensorRt(_inner);

  TensorRTExecutionProvider withDeviceId(int deviceId) => this.._inner = _inner.copyWith(
    deviceId: deviceId,
  );

  TensorRTExecutionProvider withMaxWorkspaceSize(int maxWorkspaceSize) => this.._inner = _inner.copyWith(
    maxWorkspaceSize: maxWorkspaceSize,
  );

  TensorRTExecutionProvider withMinSubgraphSize(int minSubgraphSize) => this.._inner = _inner.copyWith(
    minSubgraphSize: minSubgraphSize,
  );

  TensorRTExecutionProvider withMaxPartitionIterations(int maxPartitionIterations) => this.._inner = _inner.copyWith(
    maxPartitionIterations: maxPartitionIterations,
  );

  TensorRTExecutionProvider withFp16(bool fp16) => this.._inner = _inner.copyWith(
    fp16: fp16,
  );

  TensorRTExecutionProvider withInt8(bool int8) => this.._inner = _inner.copyWith(
    int8: int8,
  );

  TensorRTExecutionProvider withDla(bool dla) => this.._inner = _inner.copyWith(
    dla: dla,
  );

  TensorRTExecutionProvider withDlaCore(int dlaCore) => this.._inner = _inner.copyWith(
    dlaCore: dlaCore,
  );

  TensorRTExecutionProvider withInt8CalibrationTableName(String int8CalibrationTableName) => this.._inner = _inner.copyWith(
    int8CalibrationTableName: int8CalibrationTableName,
  );

  TensorRTExecutionProvider withInt8UseNativeCalibrationTable(bool int8UseNativeCalibrationTable) => this.._inner = _inner.copyWith(
    int8UseNativeCalibrationTable: int8UseNativeCalibrationTable,
  );

  TensorRTExecutionProvider withEngineCache(bool engineCache) => this.._inner = _inner.copyWith(
    engineCache: engineCache,
  );

  TensorRTExecutionProvider withEngineCachePath(String engineCachePath) => this.._inner = _inner.copyWith(
    engineCachePath: engineCachePath,
  );

  TensorRTExecutionProvider withDumpSubgraphs(bool dumpSubgraphs) => this.._inner = _inner.copyWith(
    dumpSubgraphs: dumpSubgraphs,
  );

  TensorRTExecutionProvider withEngineCachePrefix(String engineCachePrefix) => this.._inner = _inner.copyWith(
    engineCachePrefix: engineCachePrefix,
  );

  TensorRTExecutionProvider withWeightStrippedEngine(bool weightStrippedEngine) => this.._inner = _inner.copyWith(
    weightStrippedEngine: weightStrippedEngine,
  );

  TensorRTExecutionProvider withOnnxModelFolderPath(String onnxModelFolderPath) => this.._inner = _inner.copyWith(
    onnxModelFolderPath: onnxModelFolderPath,
  );

  TensorRTExecutionProvider withEngineDecryption(bool engineDecryption) => this.._inner = _inner.copyWith(
    engineDecryption: engineDecryption,
  );

  TensorRTExecutionProvider withEngineDecryptionLibPath(String engineDecryptionLibPath) => this.._inner = _inner.copyWith(
    engineDecryptionLibPath: engineDecryptionLibPath,
  );

  TensorRTExecutionProvider withForceSequentialEngineBuild(bool forceSequentialEngineBuild) => this.._inner = _inner.copyWith(
    forceSequentialEngineBuild: forceSequentialEngineBuild,
  );

  TensorRTExecutionProvider withContextMemorySharing(bool contextMemorySharing) => this.._inner = _inner.copyWith(
    contextMemorySharing: contextMemorySharing,
  );

  TensorRTExecutionProvider withLayerNormFp32Fallback(bool layerNormFp32Fallback) => this.._inner = _inner.copyWith(
    layerNormFp32Fallback: layerNormFp32Fallback,
  );

  TensorRTExecutionProvider withTimingCache(bool timingCache) => this.._inner = _inner.copyWith(
    timingCache: timingCache,
  );

  TensorRTExecutionProvider withTimingCachePath(String timingCachePath) => this.._inner = _inner.copyWith(
    timingCachePath: timingCachePath,
  );

  TensorRTExecutionProvider withForceTimingCache(bool forceTimingCache) => this.._inner = _inner.copyWith(
    forceTimingCache: forceTimingCache,
  );

  TensorRTExecutionProvider withDetailedBuildLog(bool detailedBuildLog) => this.._inner = _inner.copyWith(
    detailedBuildLog: detailedBuildLog,
  );

  TensorRTExecutionProvider withBuildHeuristics(bool buildHeuristics) => this.._inner = _inner.copyWith(
    buildHeuristics: buildHeuristics,
  );

  TensorRTExecutionProvider withSparsity(bool sparsity) => this.._inner = _inner.copyWith(
    sparsity: sparsity,
  );

  TensorRTExecutionProvider withBuilderOptimizationLevel(int builderOptimizationLevel) => this.._inner = _inner.copyWith(
    builderOptimizationLevel: builderOptimizationLevel,
  );

  TensorRTExecutionProvider withAuxiliaryStreams(int auxiliaryStreams) => this.._inner = _inner.copyWith(
    auxiliaryStreams: auxiliaryStreams,
  );

  TensorRTExecutionProvider withTacticSources(String tacticSources) => this.._inner = _inner.copyWith(
    tacticSources: tacticSources,
  );

  TensorRTExecutionProvider withExtraPluginLibPaths(String extraPluginLibPaths) => this.._inner = _inner.copyWith(
    extraPluginLibPaths: extraPluginLibPaths,
  );

  TensorRTExecutionProvider withProfileMinShapes(String profileMinShapes) => this.._inner = _inner.copyWith(
    profileMinShapes: profileMinShapes,
  );

  TensorRTExecutionProvider withProfileMaxShapes(String profileMaxShapes) => this.._inner = _inner.copyWith(
    profileMaxShapes: profileMaxShapes,
  );

  TensorRTExecutionProvider withProfileOptShapes(String profileOptShapes) => this.._inner = _inner.copyWith(
    profileOptShapes: profileOptShapes,
  );

  TensorRTExecutionProvider withCudaGraph(bool cudaGraph) => this.._inner = _inner.copyWith(
    cudaGraph: cudaGraph,
  );

  TensorRTExecutionProvider withDumpEpContextModel(bool dumpEpContextModel) => this.._inner = _inner.copyWith(
    dumpEpContextModel: dumpEpContextModel,
  );

  TensorRTExecutionProvider withEpContextFilePath(String epContextFilePath) => this.._inner = _inner.copyWith(
    epContextFilePath: epContextFilePath,
  );

  TensorRTExecutionProvider withEpContextEmbedMode(int epContextEmbedMode) => this.._inner = _inner.copyWith(
    epContextEmbedMode: epContextEmbedMode,
  );

  TensorRTExecutionProvider withEngineHwCompatible(bool engineHwCompatible) => this.._inner = _inner.copyWith(
    engineHwCompatible: engineHwCompatible,
  );
}
