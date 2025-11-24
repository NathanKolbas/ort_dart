use flutter_rust_bridge::frb;
use ort::Result;
use ort::execution_providers::{ArenaExtendStrategy, ROCmExecutionProvider as OrtROCmExecutionProvider};
use ort::execution_providers::{ExecutionProvider, ExecutionProviderDispatch};
use crate::api::execution_providers::ExecutionProviderBase;
pub use ort::execution_providers::cuda::CuDNNConvAlgorithmSearch;

#[derive(Debug, Default, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct ROCmExecutionProvider {
  pub device_id: Option<i32>,
  pub exhaustive_conv_search: Option<bool>,
  pub conv_use_max_workspace: Option<bool>,
  pub mem_limit: Option<usize>,
  pub arena_extend_strategy: Option<ArenaExtendStrategy>,
  pub copy_in_default_stream: Option<bool>,
  pub hip_graph: Option<bool>,
  pub tunable_op: Option<bool>,
  pub tuning: Option<bool>,
  pub max_tuning_duration: Option<i32>,
}

impl ROCmExecutionProvider {
  #[frb(sync)]
  pub fn new() -> Self { ROCmExecutionProvider::default() }
}

impl ExecutionProviderBase for ROCmExecutionProvider {
  #[frb(sync)]
  fn name(&self) -> String {
    OrtROCmExecutionProvider::default().name().to_string()
  }

  #[frb(sync)]
  fn supported_by_platform(&self) -> bool {
    OrtROCmExecutionProvider::default().supported_by_platform()
  }

  #[frb(sync)]
  fn is_available(&self) -> Result<bool> {
    OrtROCmExecutionProvider::default().is_available()
  }

  #[frb(ignore)]
  fn build(&self) -> ExecutionProviderDispatch {
    let mut epd = OrtROCmExecutionProvider::default();

    if let Some(device_id) = self.device_id {
      epd = epd.with_device_id(device_id);
    }
    if let Some(exhaustive_conv_search) = self.exhaustive_conv_search {
      epd = epd.with_exhaustive_conv_search(exhaustive_conv_search);
    }
    if let Some(conv_use_max_workspace) = self.conv_use_max_workspace {
      epd = epd.with_conv_use_max_workspace(conv_use_max_workspace);
    }
    if let Some(mem_limit) = self.mem_limit {
      epd = epd.with_mem_limit(mem_limit);
    }
    if let Some(arena_extend_strategy) = &self.arena_extend_strategy {
      epd = epd.with_arena_extend_strategy(arena_extend_strategy.clone());
    }
    if let Some(copy_in_default_stream) = self.copy_in_default_stream {
      epd = epd.with_copy_in_default_stream(copy_in_default_stream);
    }
    if let Some(hip_graph) = self.hip_graph {
      epd = epd.with_hip_graph(hip_graph);
    }
    if let Some(tunable_op) = self.tunable_op {
      epd = epd.with_tunable_op(tunable_op);
    }
    if let Some(tuning) = self.tuning {
      epd = epd.with_tuning(tuning);
    }
    if let Some(max_tuning_duration) = self.max_tuning_duration {
      epd = epd.with_max_tuning_duration(max_tuning_duration);
    }

    epd.build()
  }
}
