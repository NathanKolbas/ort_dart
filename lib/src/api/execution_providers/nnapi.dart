import 'package:ort/src/api/execution_providers/execution_providers.dart';
import 'package:ort/src/rust/api/execution_providers/nnapi.dart' as nnapi;
import 'package:ort/src/rust/api/execution_providers.dart' as ort_ep;

class NNAPIExecutionProvider implements ExecutionProvider {
  nnapi.NNAPIExecutionProvider _inner = nnapi.NNAPIExecutionProvider();

  NNAPIExecutionProvider();

  @override
  bool isAvailable() => _inner.isAvailable();

  @override
  String name() => _inner.name();

  @override
  bool supportedByPlatform() => _inner.supportedByPlatform();

  @override
  ort_ep.ExecutionProvider toImpl() => ort_ep.ExecutionProvider.nnApi(_inner);

  /// Use fp16 relaxation in NNAPI EP. This may improve performance but can also reduce accuracy due to the lower
  /// precision.
  NNAPIExecutionProvider withFp16(bool? fp16) => this.._inner = _inner.copyWith(
    fp16: fp16,
  );

  /// Use the NCHW layout in NNAPI EP. This is only available for Android API level 29 and higher. Please note that
  /// for now, NNAPI might have worse performance using NCHW compared to using NHWC.
  NNAPIExecutionProvider withNchw(bool? nchw) => this.._inner = _inner.copyWith(
    nchw: nchw,
  );

  /// Prevents NNAPI from using CPU devices. NNAPI is more efficient using GPU or NPU for execution, and NNAPI
  /// might fall back to its own CPU implementation for operations not supported by the GPU/NPU. However, the
  /// CPU implementation of NNAPI might be less efficient than the optimized versions of operators provided by
  /// ORT's default MLAS execution provider. It might be better to disable the NNAPI CPU fallback and instead
  /// use MLAS kernels. This option is only available after Android API level 29.
  NNAPIExecutionProvider withDisableCpu(bool? disableCpu) => this.._inner = _inner.copyWith(
    disableCpu: disableCpu,
  );

  /// Using CPU only in NNAPI EP, this may decrease the perf but will provide reference output value without precision
  /// loss, which is useful for validation. This option is only available for Android API level 29 and higher, and
  /// will be ignored for Android API level 28 and lower.
  NNAPIExecutionProvider withCpuOnly(bool? cpuOnly) => this.._inner = _inner.copyWith(
    cpuOnly: cpuOnly,
  );
}
