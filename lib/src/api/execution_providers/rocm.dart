import 'package:ort/src/api/execution_providers/execution_providers.dart';
import 'package:ort/src/rust/api/execution_providers/rocm.dart' as rocm;
import 'package:ort/src/rust/api/execution_providers.dart' as ort_ep;

/// [CUDA execution provider](https://onnxruntime.ai/docs/execution-providers/CUDA-ExecutionProvider.html) for NVIDIA
/// CUDA-enabled GPUs.
class ROCmExecutionProvider implements ExecutionProvider {
  rocm.ROCmExecutionProvider _inner = rocm.ROCmExecutionProvider();

  ROCmExecutionProvider();

  @override
  bool isAvailable() => _inner.isAvailable();

  @override
  String name() => _inner.name();

  @override
  bool supportedByPlatform() => _inner.supportedByPlatform();

  @override
  ort_ep.ExecutionProvider toImpl() => ort_ep.ExecutionProvider.roCm(_inner);

  ROCmExecutionProvider withDeviceId(int deviceId) => this.._inner = _inner.copyWith(
    deviceId: deviceId,
  );

  ROCmExecutionProvider withExhaustiveConvSearch(bool exhaustiveConvSearch) => this.._inner = _inner.copyWith(
    exhaustiveConvSearch: exhaustiveConvSearch,
  );

  ROCmExecutionProvider withConvUseMaxWorkspace(bool convUseMaxWorkspace) => this.._inner = _inner.copyWith(
    convUseMaxWorkspace: convUseMaxWorkspace,
  );

  ROCmExecutionProvider withMemLimit(int memLimit) => this.._inner = _inner.copyWith(
    memLimit: memLimit,
  );

  ROCmExecutionProvider withArenaExtendStrategy(ort_ep.ArenaExtendStrategy arenaExtendStrategy) => this.._inner = _inner.copyWith(
    arenaExtendStrategy: arenaExtendStrategy,
  );

  ROCmExecutionProvider withCopyInDefaultStream(bool copyInDefaultStream) => this.._inner = _inner.copyWith(
    copyInDefaultStream: copyInDefaultStream,
  );

  ROCmExecutionProvider withHipGraph(bool hipGraph) => this.._inner = _inner.copyWith(
    hipGraph: hipGraph,
  );

  ROCmExecutionProvider withTunableOp(bool tunableOp) => this.._inner = _inner.copyWith(
    tunableOp: tunableOp,
  );

  ROCmExecutionProvider withTuning(bool tuning) => this.._inner = _inner.copyWith(
    tuning: tuning,
  );

  ROCmExecutionProvider withMaxTuningDuration(int maxTuningDuration) => this.._inner = _inner.copyWith(
    maxTuningDuration: maxTuningDuration,
  );
}
