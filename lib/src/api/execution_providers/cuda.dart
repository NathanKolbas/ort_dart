import 'package:ort/src/api/execution_providers/execution_providers.dart';
import 'package:ort/src/rust/api/execution_providers/cuda.dart' as cuda;
import 'package:ort/src/rust/api/execution_providers.dart' as ort_ep;

export 'package:ort/src/rust/api/execution_providers/cuda.dart' show CuDNNConvAlgorithmSearch, CUDAAttentionBackend;

/// [CUDA execution provider](https://onnxruntime.ai/docs/execution-providers/CUDA-ExecutionProvider.html) for NVIDIA
/// CUDA-enabled GPUs.
class CUDAExecutionProvider implements ExecutionProvider {
  cuda.CUDAExecutionProvider _inner = cuda.CUDAExecutionProvider();

  CUDAExecutionProvider();

  @override
  bool isAvailable() => _inner.isAvailable();

  @override
  String name() => _inner.name();

  @override
  bool supportedByPlatform() => _inner.supportedByPlatform();

  @override
  ort_ep.ExecutionProvider toImpl() => ort_ep.ExecutionProvider.cuda(_inner);

  /// Configures which device the EP should use.
  ///
  /// ```
  /// # use ort::{execution_providers::cuda::CUDAExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CUDAExecutionProvider::default().with_device_id(0).build();
  /// # Ok(())
  /// # }
  /// ```
  CUDAExecutionProvider withDeviceId(int deviceId) => this.._inner = _inner.copyWith(
    deviceId: deviceId,
  );

  /// Configure the size limit of the device memory arena in bytes.
  ///
  /// This only controls how much memory can be allocated to the *arena* - actual memory usage may be higher due to
  /// internal CUDA allocations, like those required for different [`CuDNNConvAlgorithmSearch`] options.
  ///
  /// ```
  /// # use ort::{execution_providers::cuda::CUDAExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CUDAExecutionProvider::default().with_memory_limit(2 * 1024 * 1024 * 1024).build();
  /// # Ok(())
  /// # }
  /// ```
  CUDAExecutionProvider withMemoryLimit(int memoryLimit) => this.._inner = _inner.copyWith(
    memoryLimit: memoryLimit,
  );

  /// Configure the strategy for extending the device's memory arena.
  ///
  /// ```
  /// # use ort::{execution_providers::{cuda::CUDAExecutionProvider, ArenaExtendStrategy}, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CUDAExecutionProvider::default()
  /// 	.with_arena_extend_strategy(ArenaExtendStrategy::SameAsRequested)
  /// 	.build();
  /// # Ok(())
  /// # }
  /// ```
  CUDAExecutionProvider withArenaExtendStrategy(ort_ep.ArenaExtendStrategy arenaExtendStrategy) => this.._inner = _inner.copyWith(
    arenaExtendStrategy: arenaExtendStrategy,
  );

  /// Controls the search mode used to select a kernel for `Conv` nodes.
  ///
  /// cuDNN, the library used by ONNX Runtime's CUDA EP for many operations, provides many different implementations
  /// of the `Conv` node. Each of these implementations has different performance characteristics depending on the
  /// exact hardware and model/input size used. This option controls how cuDNN should determine which implementation
  /// to use.
  ///
  /// The default search algorithm, [`Exhaustive`][exh], will benchmark all available implementations and use the most
  /// performant one. This option is very resource intensive (both computationally on first run and peak-memory-wise),
  /// but ensures best performance. It is roughly equivalent to setting `torch.backends.cudnn.benchmark = True` with
  /// PyTorch. See also [`CUDAExecutionProvider::with_conv_max_workspace`] to configure how much memory the exhaustive
  /// search can use (the default is unlimited).
  ///
  /// A less resource-intensive option is [`Heuristic`][heu]. Rather than benchmarking every implementation,
  /// an optimal implementation is chosen based on a set of heuristics, thus saving compute. [`Heuristic`][heu] should
  /// generally choose an optimal convolution algorithm, except in some corner cases.
  ///
  /// [`Default`][def] can also be passed to instruct cuDNN to always use the default implementation (which is rarely
  /// the most optimal). Note that the "Default" here refers to the **default convolution algorithm** being used, it
  /// is not the *default behavior* (that would be [`Exhaustive`][exh]).
  ///
  /// ```
  /// # use ort::{execution_providers::cuda::{CUDAExecutionProvider, CuDNNConvAlgorithmSearch}, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CUDAExecutionProvider::default()
  /// 	.with_conv_algorithm_search(CuDNNConvAlgorithmSearch::Heuristic)
  /// 	.build();
  /// # Ok(())
  /// # }
  /// ```
  ///
  /// [exh]: CuDNNConvAlgorithmSearch::Exhaustive
  /// [heu]: CuDNNConvAlgorithmSearch::Heuristic
  /// [def]: CuDNNConvAlgorithmSearch::Default
  CUDAExecutionProvider withConvAlgorithmSearch(cuda.CuDNNConvAlgorithmSearch convAlgorithmSearch) => this.._inner = _inner.copyWith(
    convAlgorithmSearch: convAlgorithmSearch,
  );

  /// Configure whether the [`Exhaustive`][CuDNNConvAlgorithmSearch::Exhaustive] search can use as much memory as it
  /// needs.
  ///
  /// The default is `true`. When `false`, the memory used for the search is limited to 32 MB, which will impact its
  /// ability to find an optimal convolution algorithm.
  ///
  /// ```
  /// # use ort::{execution_providers::cuda::CUDAExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CUDAExecutionProvider::default().with_conv_max_workspace(false).build();
  /// # Ok(())
  /// # }
  /// ```
  CUDAExecutionProvider withConvMaxWorkspace(bool convMaxWorkspace) => this.._inner = _inner.copyWith(
    convMaxWorkspace: convMaxWorkspace,
  );

  /// Configure whether or not to pad 3-dimensional convolutions to `[N, C, 1, D]` (as opposed to the default `[N, C,
  /// D, 1]`).
  ///
  /// Enabling this option might significantly improve performance on devices like the A100. This does not affect
  /// convolution operations that do not use 3-dimensional input shapes, or the *result* of such operations.
  ///
  /// ```
  /// # use ort::{execution_providers::cuda::CUDAExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CUDAExecutionProvider::default().with_conv1d_pad_to_nc1d(true).build();
  /// # Ok(())
  /// # }
  /// ```
  CUDAExecutionProvider withConv1DPadToNc1D(bool conv1DPadToNc1D) => this.._inner = _inner.copyWith(
    conv1DPadToNc1D: conv1DPadToNc1D,
  );

  /// Configures whether to create a CUDA graph.
  ///
  /// CUDA graphs eliminate the overhead of launching kernels sequentially by capturing the launch sequence into a
  /// graph that is 'replayed' across runs, reducing CPU overhead and possibly improving performance.
  ///
  /// Using CUDA graphs comes with limitations, notably:
  /// - Models with control flow operators (like `If`, `Loop`, or `Scan`) are not supported.
  /// - Input/output shapes cannot change across inference calls.
  /// - The address of inputs/outputs cannot change across inference calls, so
  ///   [`IoBinding`](crate::io_binding::IoBinding) must be used.
  /// - `Session`s using CUDA graphs are technically not `Send` or `Sync`.
  ///
  /// Consult the [ONNX Runtime documentation on CUDA graphs](https://onnxruntime.ai/docs/execution-providers/CUDA-ExecutionProvider.html#using-cuda-graphs-preview) for more information.
  ///
  /// ```
  /// # use ort::{execution_providers::cuda::CUDAExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CUDAExecutionProvider::default().with_cuda_graph(true).build();
  /// # Ok(())
  /// # }
  /// ```
  CUDAExecutionProvider withCudaGraph(bool cudaGraph) => this.._inner = _inner.copyWith(
    cudaGraph: cudaGraph,
  );

  /// Enable 'strict' mode for `SkipLayerNorm` nodes (created via fusion of `Add` & `LayerNorm` nodes).
  ///
  /// `SkipLayerNorm`'s strict mode trades performance for accuracy. The default is `false` (strict mode disabled).
  ///
  /// ```
  /// # use ort::{execution_providers::cuda::CUDAExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CUDAExecutionProvider::default().with_skip_layer_norm_strict_mode(true).build();
  /// # Ok(())
  /// # }
  /// ```
  CUDAExecutionProvider withSkipLayerNormStrictMode(bool skipLayerNormStrictMode) => this.._inner = _inner.copyWith(
    skipLayerNormStrictMode: skipLayerNormStrictMode,
  );

  /// Enable the usage of the reduced-precision [TensorFloat-32](https://blogs.nvidia.com/blog/tensorfloat-32-precision-format/)
  /// format for matrix multiplications & convolutions.
  ///
  /// TensorFloat-32 is a reduced-precision floating point format available on NVIDIA GPUs since the Ampere
  /// microarchitecture. It allows `MatMul` & `Conv` to run much faster on Ampere's Tensor cores. This option is
  /// **disabled** by default.
  ///
  /// This option is roughly equivalent to `torch.backends.cudnn.allow_tf32 = True` &
  /// `torch.backends.cuda.matmul.allow_tf32 = True` or `torch.set_float32_matmul_precision("medium")` in PyTorch.
  ///
  /// ```
  /// # use ort::{execution_providers::cuda::CUDAExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CUDAExecutionProvider::default().with_tf32(true).build();
  /// # Ok(())
  /// # }
  /// ```
  CUDAExecutionProvider withTf32(bool tf32) => this.._inner = _inner.copyWith(
    tf32: tf32,
  );

  /// Configure whether to prefer `[N, H, W, C]` layout operations over the default `[N, C, H, W]` layout.
  ///
  /// Tensor cores usually operate more efficiently with the NHWC layout, so enabling this option for
  /// convolution-heavy models on Tensor core-enabled GPUs may provide a significant performance improvement.
  ///
  /// ```
  /// # use ort::{execution_providers::cuda::CUDAExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CUDAExecutionProvider::default().with_prefer_nhwc(true).build();
  /// # Ok(())
  /// # }
  /// ```
  CUDAExecutionProvider withPreferNhwc(bool preferNhwc) => this.._inner = _inner.copyWith(
    preferNhwc: preferNhwc,
  );

  /// Use a custom CUDA device stream rather than the default one.
  ///
  /// # Safety
  /// The provided `stream` must outlive the environment/session configured to use this execution provider.
  CUDAExecutionProvider withAttentionBackend(cuda.CUDAAttentionBackend attentionBackend) => this.._inner = _inner.copyWith(
    attentionBackend: attentionBackend,
  );

  CUDAExecutionProvider withFuseConvBias(bool fuseConvBias) => this.._inner = _inner.copyWith(
    fuseConvBias: fuseConvBias,
  );
}
