use flutter_rust_bridge::frb;
use ort::Result;
use ort::execution_providers::{CoreMLExecutionProvider as OrtCoreMLExecutionProvider};
use ort::execution_providers::{ExecutionProvider, ExecutionProviderDispatch};
pub use ort::execution_providers::coreml::{CoreMLComputeUnits, CoreMLModelFormat, CoreMLSpecializationStrategy};
use crate::api::execution_providers::ExecutionProviderBase;
pub use ort::execution_providers::cuda::CuDNNConvAlgorithmSearch;

#[frb(mirror(CoreMLSpecializationStrategy))]
pub enum _CoreMLSpecializationStrategy {
  /// The strategy that should work well for most applications.
  Default,
  /// Prefer the prediction latency at the potential cost of specialization time, memory footprint, and the disk space
  /// usage of specialized artifacts.
  FastPrediction
}

#[frb(mirror(CoreMLComputeUnits))]
pub enum _CoreMLComputeUnits {
  /// Enable CoreML EP for all compatible Apple devices.
  All,
  /// Enable CoreML EP for Apple devices with a compatible Neural Engine (ANE).
  CPUAndNeuralEngine,
  /// Enable CoreML EP for Apple devices with a compatible GPU.
  CPUAndGPU,
  /// Limit CoreML to running on CPU only.
  CPUOnly
}

#[frb(mirror(CoreMLModelFormat))]
pub enum _CoreMLModelFormat {
  /// Requires Core ML 5 or later (iOS 15+ or macOS 12+).
  MLProgram,
  /// Default; requires Core ML 3 or later (iOS 13+ or macOS 10.15+).
  NeuralNetwork
}

/// [CoreML execution provider](https://onnxruntime.ai/docs/execution-providers/CoreML-ExecutionProvider.html) for hardware
/// acceleration on Apple devices.
#[derive(Debug, Default, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct CoreMLExecutionProvider {
  pub subgraphs: Option<bool>,
  pub static_input_shapes: Option<bool>,
  pub model_format: Option<CoreMLModelFormat>,
  pub specialization_strategy: Option<CoreMLSpecializationStrategy>,
  pub compute_units: Option<CoreMLComputeUnits>,
  pub profile_compute_plan: Option<bool>,
  pub low_precision_accumulation_on_gpu: Option<bool>,
  pub model_cache_dir: Option<String>,
}

impl CoreMLExecutionProvider {
  #[frb(sync)]
  pub fn new() -> Self { CoreMLExecutionProvider::default() }
}

impl ExecutionProviderBase for CoreMLExecutionProvider {
  #[frb(sync)]
  fn name(&self) -> String {
    OrtCoreMLExecutionProvider::default().name().to_string()
  }

  #[frb(sync)]
  fn supported_by_platform(&self) -> bool {
    OrtCoreMLExecutionProvider::default().supported_by_platform()
  }

  #[frb(sync)]
  fn is_available(&self) -> Result<bool> {
    OrtCoreMLExecutionProvider::default().is_available()
  }

  #[frb(ignore)]
  fn build(&self) -> ExecutionProviderDispatch {
    let mut epd = OrtCoreMLExecutionProvider::default();

    if let Some(subgraphs) = self.subgraphs {
      epd = epd.with_subgraphs(subgraphs);
    }
    if let Some(static_input_shapes) = self.static_input_shapes {
      epd = epd.with_static_input_shapes(static_input_shapes);
    }
    if let Some(model_format) = self.model_format {
      epd = epd.with_model_format(model_format);
    }
    if let Some(specialization_strategy) = self.specialization_strategy {
      epd = epd.with_specialization_strategy(specialization_strategy);
    }
    if let Some(compute_units) = self.compute_units {
      epd = epd.with_compute_units(compute_units);
    }
    if let Some(profile_compute_plan) = self.profile_compute_plan {
      epd = epd.with_profile_compute_plan(profile_compute_plan);
    }
    if let Some(low_precision_accumulation_on_gpu) = self.low_precision_accumulation_on_gpu {
      epd = epd.with_low_precision_accumulation_on_gpu(low_precision_accumulation_on_gpu);
    }
    if let Some(model_cache_dir) = self.model_cache_dir.clone() {
      epd = epd.with_model_cache_dir(model_cache_dir);
    }

    epd.build()
  }
}
