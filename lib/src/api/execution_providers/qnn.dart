import 'package:ort/src/api/execution_providers/execution_providers.dart';
import 'package:ort/src/rust/api/execution_providers/qnn.dart' as qnn;
import 'package:ort/src/rust/api/execution_providers.dart' as ort_ep;

export 'package:ort/src/rust/api/execution_providers/qnn.dart'
    show QNNContextPriority, QNNPerformanceMode, QNNProfilingLevel;

/// [QNN execution provider](https://onnxruntime.ai/docs/execution-providers/QNN-ExecutionProvider.html) for Qualcomm AI Engine.
class QNNExecutionProvider implements ExecutionProvider {
  qnn.QNNExecutionProvider _inner = qnn.QNNExecutionProvider.raw();

  QNNExecutionProvider();

  @override
  bool isAvailable() => _inner.isAvailable();

  @override
  String name() => _inner.name();

  @override
  bool supportedByPlatform() => _inner.supportedByPlatform();

  @override
  ort_ep.ExecutionProvider toImpl() => ort_ep.ExecutionProvider.qnn(_inner);

  /// The file path to QNN backend library. On Linux/Android, this is `libQnnCpu.so` to use the CPU backend,
  /// or `libQnnHtp.so` to use the accelerated backend.
  QNNExecutionProvider withBackendPath(String backendPath) =>
      this.._inner = _inner.copyWith(backendPath: backendPath);

  QNNExecutionProvider withProfiling(qnn.QNNProfilingLevel profiling) =>
      this.._inner = _inner.copyWith(profiling: profiling);

  QNNExecutionProvider withProfilingPath(String profilingPath) =>
      this.._inner = _inner.copyWith(profilingPath: profilingPath);

  /// Allows client to set up RPC control latency in microseconds.
  QNNExecutionProvider withRpcControlLatency(int rpcControlLatency) =>
      this.._inner = _inner.copyWith(rpcControlLatency: rpcControlLatency);

  QNNExecutionProvider withVtcmMb(int vtcmMb) =>
      this.._inner = _inner.copyWith(vtcmMb: vtcmMb);

  QNNExecutionProvider withPerformanceMode(qnn.QNNPerformanceMode performanceMode) =>
      this.._inner = _inner.copyWith(performanceMode: performanceMode);

  QNNExecutionProvider withSaverPath(String saverPath) =>
      this.._inner = _inner.copyWith(saverPath: saverPath);

  QNNExecutionProvider withContextPriority(qnn.QNNContextPriority contextPriority) =>
      this.._inner = _inner.copyWith(contextPriority: contextPriority);

  QNNExecutionProvider withHtpGraphFinalizationOptimizationMode(
          int htpGraphFinalizationOptimizationMode) =>
      this
        .._inner = _inner.copyWith(
            htpGraphFinalizationOptimizationMode:
                htpGraphFinalizationOptimizationMode);

  QNNExecutionProvider withSocModel(String socModel) =>
      this.._inner = _inner.copyWith(socModel: socModel);

  QNNExecutionProvider withHtpArch(int htpArch) =>
      this.._inner = _inner.copyWith(htpArch: htpArch);

  QNNExecutionProvider withDeviceId(int deviceId) =>
      this.._inner = _inner.copyWith(deviceId: deviceId);

  QNNExecutionProvider withHtpFp16Precision(bool htpFp16Precision) =>
      this.._inner = _inner.copyWith(htpFp16Precision: htpFp16Precision);

  QNNExecutionProvider withOffloadGraphIoQuantization(
          bool offloadGraphIoQuantization) =>
      this
        .._inner = _inner.copyWith(
            offloadGraphIoQuantization: offloadGraphIoQuantization);
}
