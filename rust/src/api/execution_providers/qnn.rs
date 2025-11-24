use flutter_rust_bridge::frb;
use ort::Result;
use ort::execution_providers::{QNNExecutionProvider as OrtQNNExecutionProvider};
use ort::execution_providers::{ExecutionProvider, ExecutionProviderDispatch};
use crate::api::execution_providers::ExecutionProviderBase;
pub use ort::execution_providers::cuda::CuDNNConvAlgorithmSearch;
pub use ort::execution_providers::qnn::{QNNContextPriority, QNNPerformanceMode, QNNProfilingLevel};

#[frb(mirror(QNNPerformanceMode))]
pub enum _QNNPerformanceMode {
  Default,
  Burst,
  Balanced,
  HighPerformance,
  HighPowerSaver,
  LowPowerSaver,
  LowBalanced,
  PowerSaver,
  ExtremePowerSaver,
  SustainedHighPerformance
}

#[frb(mirror(QNNProfilingLevel))]
pub enum _QNNProfilingLevel {
  Off,
  Basic,
  Detailed
}

#[frb(mirror(QNNContextPriority))]
pub enum _QNNContextPriority {
  Low,
  Normal,
  NormalHigh,
  High
}

#[derive(Debug, Default, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct QNNExecutionProvider {
  pub backend_path: Option<String>,
  pub profiling: Option<QNNProfilingLevel>,
  pub profiling_path: Option<String>,
  pub rpc_control_latency: Option<u32>,
  pub vtcm_mb: Option<usize>,
  pub performance_mode: Option<QNNPerformanceMode>,
  pub saver_path: Option<String>,
  pub context_priority: Option<QNNContextPriority>,
  pub htp_graph_finalization_optimization_mode: Option<u8>,
  pub soc_model: Option<String>,
  pub htp_arch: Option<u32>,
  pub device_id: Option<i32>,
  pub htp_fp16_precision: Option<bool>,
  pub offload_graph_io_quantization: Option<bool>,
}

impl QNNExecutionProvider {
  #[frb(sync)]
  pub fn new() -> Self { QNNExecutionProvider::default() }
}

impl ExecutionProviderBase for QNNExecutionProvider {
  #[frb(sync)]
  fn name(&self) -> String {
    OrtQNNExecutionProvider::default().name().to_string()
  }

  #[frb(sync)]
  fn supported_by_platform(&self) -> bool {
    OrtQNNExecutionProvider::default().supported_by_platform()
  }

  #[frb(sync)]
  fn is_available(&self) -> Result<bool> {
    OrtQNNExecutionProvider::default().is_available()
  }

  #[frb(ignore)]
  fn build(&self) -> ExecutionProviderDispatch {
    let mut epd = OrtQNNExecutionProvider::default();

    if let Some(backend_path) = &self.backend_path {
      epd = epd.with_backend_path(backend_path.clone());
    }
    if let Some(profiling) = &self.profiling {
      epd = epd.with_profiling(profiling.to_owned());
    }
    if let Some(profiling_path) = &self.profiling_path {
      epd = epd.with_profiling_path(profiling_path.to_owned());
    }
    if let Some(rpc_control_latency) = &self.rpc_control_latency {
      epd = epd.with_rpc_control_latency(rpc_control_latency.to_owned());
    }
    if let Some(vtcm_mb) = &self.vtcm_mb {
      epd = epd.with_vtcm_mb(vtcm_mb.to_owned());
    }
    if let Some(performance_mode) = &self.performance_mode {
      epd = epd.with_performance_mode(performance_mode.to_owned());
    }
    if let Some(saver_path) = &self.saver_path {
      epd = epd.with_saver_path(saver_path.to_owned());
    }
    if let Some(context_priority) = &self.context_priority {
      epd = epd.with_context_priority(context_priority.to_owned());
    }
    if let Some(htp_graph_finalization_optimization_mode) = &self.htp_graph_finalization_optimization_mode {
      epd = epd.with_htp_graph_finalization_optimization_mode(htp_graph_finalization_optimization_mode.to_owned());
    }
    if let Some(soc_model) = &self.soc_model {
      epd = epd.with_soc_model(soc_model.to_owned());
    }
    if let Some(htp_arch) = &self.htp_arch {
      epd = epd.with_htp_arch(htp_arch.to_owned());
    }
    if let Some(device_id) = &self.device_id {
      epd = epd.with_device_id(device_id.to_owned());
    }
    if let Some(htp_fp16_precision) = &self.htp_fp16_precision {
      epd = epd.with_htp_fp16_precision(htp_fp16_precision.to_owned());
    }
    if let Some(offload_graph_io_quantization) = &self.offload_graph_io_quantization {
      epd = epd.with_offload_graph_io_quantization(offload_graph_io_quantization.to_owned());
    }

    epd.build()
  }
}
