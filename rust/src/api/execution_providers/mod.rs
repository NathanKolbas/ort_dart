pub mod coreml;
pub mod cpu;
pub mod cuda;
pub mod directml;
pub mod nnapi;
pub mod qnn;
pub mod rocm;
pub mod tensorrt;

use flutter_rust_bridge::frb;
use ort::Result;
#[allow(unused_imports)]
use ort::execution_providers::ExecutionProviderDispatch;
pub use ort::execution_providers::ArenaExtendStrategy;
use crate::api::execution_providers::coreml::CoreMLExecutionProvider;
use crate::api::execution_providers::cpu::CPUExecutionProvider;
use crate::api::execution_providers::cuda::CUDAExecutionProvider;
use crate::api::execution_providers::directml::DirectMLExecutionProvider;
use crate::api::execution_providers::nnapi::NNAPIExecutionProvider;
use crate::api::execution_providers::qnn::QNNExecutionProvider;
use crate::api::execution_providers::rocm::ROCmExecutionProvider;
use crate::api::execution_providers::tensorrt::TensorRTExecutionProvider;

/// ONNX Runtime works with different hardware acceleration libraries through its extensible **Execution Providers**
/// (EP) framework to optimally execute the ONNX models on the hardware platform. This interface enables flexibility for
/// the AP application developer to deploy their ONNX models in different environments in the cloud and the edge and
/// optimize the execution by taking advantage of the compute capabilities of the platform.
///
/// ![](https://www.onnxruntime.ai/images/ONNX_Runtime_EP1.png)
pub trait ExecutionProviderBase: Send + Sync {
  /// Returns the identifier of this execution provider used internally by ONNX Runtime.
  ///
  /// This is the same as what's used in ONNX Runtime's Python API to register this execution provider, i.e.
  /// [`TVMExecutionProvider`]'s identifier is `TvmExecutionProvider`.
  #[frb(sync)]
  fn name(&self) -> String;

  /// Returns whether this execution provider is supported on this platform.
  ///
  /// For example, the CoreML execution provider implements this as:
  /// ```ignore
  /// impl ExecutionProvider for CoreMLExecutionProvider {
  /// 	fn supported_by_platform() -> bool {
  /// 		cfg!(target_vendor = "apple")
  /// 	}
  /// }
  /// ```
  #[frb(sync)]
  fn supported_by_platform(&self) -> bool {
    true
  }

  /// Returns `Ok(true)` if ONNX Runtime was *compiled with support* for this execution provider, and `Ok(false)`
  /// otherwise.
  ///
  /// An `Err` may be returned if a serious internal error occurs, in which case your application should probably
  /// just abort.
  ///
  /// **Note that this does not always mean the execution provider is *usable* for a specific session.** A model may
  /// use operators not supported by an execution provider, or the EP may encounter an error while attempting to load
  /// dependencies during session creation. In most cases (i.e. showing the user an error message if CUDA could not be
  /// enabled), you'll instead want to manually register this EP via [`ExecutionProvider::register`] and detect
  /// and handle any errors returned by that function.
  #[frb(sync)]
  fn is_available(&self) -> Result<bool>;

  #[frb(ignore)]
  fn build(&self) -> ExecutionProviderDispatch;
}

pub enum ExecutionProvider {
  CoreML(CoreMLExecutionProvider),
  CPU(CPUExecutionProvider),
  CUDA(CUDAExecutionProvider),
  DirectML(DirectMLExecutionProvider),
  NNApi(NNAPIExecutionProvider),
  QNN(QNNExecutionProvider),
  ROCm(ROCmExecutionProvider),
  TensorRT(TensorRTExecutionProvider),
}

/// The strategy for extending the device memory arena.
#[derive(Debug, Default, Clone)]
#[frb(mirror(ArenaExtendStrategy))]
pub enum _ArenaExtendStrategy {
  /// (Default) Subsequent extensions extend by larger amounts (multiplied by powers of two)
  #[default]
  NextPowerOfTwo,
  /// Memory extends by the requested amount.
  SameAsRequested
}
