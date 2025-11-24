use flutter_rust_bridge::frb;
use ort::Result;
use ort::execution_providers::CPUExecutionProvider as OrtCPUExecutionProvider;
use ort::execution_providers::{ExecutionProvider, ExecutionProviderDispatch};
use crate::api::execution_providers::ExecutionProviderBase;

/// The default CPU execution provider, powered by MLAS.
#[derive(Debug, Default, Clone)]
// #[frb(opaque)] adding this is what makes CPUExecutionProvider extend ExecutionProviderBase in dart but this breaks our enum implementation
pub struct CPUExecutionProvider {}

impl CPUExecutionProvider {
  #[frb(sync)]
  pub fn new() -> Self { CPUExecutionProvider::default() }
}

impl ExecutionProviderBase for CPUExecutionProvider {
  #[frb(sync)]
  fn name(&self) -> String {
    OrtCPUExecutionProvider::default().name().to_string()
  }

  #[frb(sync)]
  fn supported_by_platform(&self) -> bool {
    OrtCPUExecutionProvider::default().supported_by_platform()
  }

  #[frb(sync)]
  fn is_available(&self) -> Result<bool> {
    OrtCPUExecutionProvider::default().is_available()
  }

  #[frb(ignore)]
  fn build(&self) -> ExecutionProviderDispatch {
    OrtCPUExecutionProvider::default().build()
  }
}
