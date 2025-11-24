use flutter_rust_bridge::frb;
use ort::Result;
use ort::execution_providers::{ArenaExtendStrategy, CUDAExecutionProvider as OrtCUDAExecutionProvider};
use ort::execution_providers::{ExecutionProvider, ExecutionProviderDispatch};
use crate::api::execution_providers::ExecutionProviderBase;
use ort::execution_providers::cuda::CUDAAttentionBackend as OrtCUDAAttentionBackend;
pub use ort::execution_providers::cuda::CuDNNConvAlgorithmSearch;

#[derive(Debug, Clone, Copy)]
pub enum CUDAAttentionBackend {
  FlashAttention,
  EfficientAttention,
  TrtFusedAttention,
  CudnnFlashAttention,
  Math,

  TrtFlashAttention,
  TrtCrossAttention,
  TrtCausalAttention,

  LeanAttention,

  None,
  All,
}

/// [CUDA execution provider](https://onnxruntime.ai/docs/execution-providers/CUDA-ExecutionProvider.html) for NVIDIA
/// CUDA-enabled GPUs.
#[derive(Debug, Default, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct CUDAExecutionProvider {
  pub device_id: Option<i32>,
  pub memory_limit: Option<usize>,
  pub arena_extend_strategy: Option<ArenaExtendStrategy>,
  pub conv_algorithm_search: Option<CuDNNConvAlgorithmSearch>,
  pub conv_max_workspace: Option<bool>,
  pub conv1d_pad_to_nc1d: Option<bool>,
  pub cuda_graph: Option<bool>,
  pub skip_layer_norm_strict_mode: Option<bool>,
  pub tf32: Option<bool>,
  pub prefer_nhwc: Option<bool>,
  pub attention_backend: Option<CUDAAttentionBackend>,
  pub fuse_conv_bias: Option<bool>,
}

impl CUDAExecutionProvider {
  #[frb(sync)]
  pub fn new() -> Self { CUDAExecutionProvider::default() }
}

impl ExecutionProviderBase for CUDAExecutionProvider {
  #[frb(sync)]
  fn name(&self) -> String {
    OrtCUDAExecutionProvider::default().name().to_string()
  }

  #[frb(sync)]
  fn supported_by_platform(&self) -> bool {
    OrtCUDAExecutionProvider::default().supported_by_platform()
  }

  #[frb(sync)]
  fn is_available(&self) -> Result<bool> {
    OrtCUDAExecutionProvider::default().is_available()
  }

  #[frb(ignore)]
  fn build(&self) -> ExecutionProviderDispatch {
    let mut epd = OrtCUDAExecutionProvider::default();

    if let Some(device_id) = self.device_id {
      epd = epd.with_device_id(device_id);
    }
    if let Some(memory_limit) = self.memory_limit {
      epd = epd.with_memory_limit(memory_limit);
    }
    if let Some(arena_extend_strategy) = &self.arena_extend_strategy {
      epd = epd.with_arena_extend_strategy(arena_extend_strategy.clone());
    }
    if let Some(conv_algorithm_search) = &self.conv_algorithm_search {
      epd = epd.with_conv_algorithm_search(conv_algorithm_search.clone());
    }
    if let Some(conv_max_workspace) = self.conv_max_workspace {
      epd = epd.with_conv_max_workspace(conv_max_workspace);
    }
    if let Some(conv1d_pad_to_nc1d) = self.conv1d_pad_to_nc1d {
      epd = epd.with_conv1d_pad_to_nc1d(conv1d_pad_to_nc1d);
    }
    if let Some(cuda_graph) = self.cuda_graph {
      epd = epd.with_cuda_graph(cuda_graph);
    }
    if let Some(skip_layer_norm_strict_mode) = self.skip_layer_norm_strict_mode {
      epd = epd.with_skip_layer_norm_strict_mode(skip_layer_norm_strict_mode);
    }
    if let Some(tf32) = self.tf32 {
      epd = epd.with_tf32(tf32);
    }
    if let Some(prefer_nhwc) = self.prefer_nhwc {
      epd = epd.with_prefer_nhwc(prefer_nhwc);
    }
    if let Some(attention_backend) = self.attention_backend {
      epd = epd.with_attention_backend(match attention_backend {
        CUDAAttentionBackend::FlashAttention => { OrtCUDAAttentionBackend::FLASH_ATTENTION }
        CUDAAttentionBackend::EfficientAttention => { OrtCUDAAttentionBackend::EFFICIENT_ATTENTION }
        CUDAAttentionBackend::TrtFusedAttention => { OrtCUDAAttentionBackend::TRT_FUSED_ATTENTION }
        CUDAAttentionBackend::CudnnFlashAttention => { OrtCUDAAttentionBackend::CUDNN_FLASH_ATTENTION }
        CUDAAttentionBackend::Math => { OrtCUDAAttentionBackend::MATH }
        CUDAAttentionBackend::TrtFlashAttention => { OrtCUDAAttentionBackend::TRT_FLASH_ATTENTION }
        CUDAAttentionBackend::TrtCrossAttention => { OrtCUDAAttentionBackend::TRT_CROSS_ATTENTION }
        CUDAAttentionBackend::TrtCausalAttention => { OrtCUDAAttentionBackend::TRT_CAUSAL_ATTENTION }
        CUDAAttentionBackend::LeanAttention => { OrtCUDAAttentionBackend::LEAN_ATTENTION }
        CUDAAttentionBackend::None => { OrtCUDAAttentionBackend::none() }
        CUDAAttentionBackend::All => { OrtCUDAAttentionBackend::all() }
      });
    }
    if let Some(fuse_conv_bias) = self.fuse_conv_bias {
      epd = epd.with_fuse_conv_bias(fuse_conv_bias);
    }

    epd.build()
  }
}

/// The type of search done for cuDNN convolution algorithms.
#[derive(Debug, Clone, Default)]
#[frb(mirror(CuDNNConvAlgorithmSearch))]
pub enum _CuDNNConvAlgorithmSearch {
  /// Expensive exhaustive benchmarking using [`cudnnFindConvolutionForwardAlgorithmEx`][exhaustive].
  /// This function will attempt all possible algorithms for `cudnnConvolutionForward` to find the fastest algorithm.
  /// Exhaustive search trades off between memory usage and speed. The first execution of a graph will be slow while
  /// possible convolution algorithms are tested.
  ///
  /// [exhaustive]: https://docs.nvidia.com/deeplearning/cudnn/api/index.html#cudnnFindConvolutionForwardAlgorithmEx
  #[default]
  Exhaustive,
  /// Lightweight heuristic-based search using [`cudnnGetConvolutionForwardAlgorithm_v7`][heuristic].
  /// Heuristic search sorts available convolution algorithms by expected (based on internal heuristic) relative
  /// performance.
  ///
  /// [heuristic]: https://docs.nvidia.com/deeplearning/cudnn/api/index.html#cudnnGetConvolutionForwardAlgorithm_v7
  Heuristic,
  /// Uses the default convolution algorithm, [`CUDNN_CONVOLUTION_FWD_ALGO_IMPLICIT_PRECOMP_GEMM`][fwdalgo].
  /// The default algorithm may not have the best performance depending on specific hardware used. It's recommended to
  /// use [`Exhaustive`] or [`Heuristic`] to search for a faster algorithm instead. However, `Default` does have its
  /// uses, such as when available memory is tight.
  ///
  /// > **NOTE**: This name may be confusing as this is not the default search algorithm for the CUDA EP. The default
  /// > search algorithm is actually [`Exhaustive`].
  ///
  /// [fwdalgo]: https://docs.nvidia.com/deeplearning/cudnn/api/index.html#cudnnConvolutionFwdAlgo_t
  /// [`Exhaustive`]: CuDNNConvAlgorithmSearch::Exhaustive
  /// [`Heuristic`]: CuDNNConvAlgorithmSearch::Heuristic
  Default
}
