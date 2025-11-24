use flutter_rust_bridge::frb;
use ort::Result;
use ort::execution_providers::NNAPIExecutionProvider as OrtNNAPIExecutionProvider;
use ort::execution_providers::{ExecutionProvider, ExecutionProviderDispatch};
use crate::api::execution_providers::ExecutionProviderBase;

#[derive(Debug, Default, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct NNAPIExecutionProvider {
  pub fp16: Option<bool>,
  pub nchw: Option<bool>,
  pub disable_cpu: Option<bool>,
  pub cpu_only: Option<bool>,
}

impl NNAPIExecutionProvider {
  #[frb(sync)]
  pub fn new() -> Self { NNAPIExecutionProvider::default() }
}

impl ExecutionProviderBase for NNAPIExecutionProvider {
  #[frb(sync)]
  fn name(&self) -> String {
    OrtNNAPIExecutionProvider::default().name().to_string()
  }

  #[frb(sync)]
  fn supported_by_platform(&self) -> bool {
    OrtNNAPIExecutionProvider::default().supported_by_platform()
  }

  #[frb(sync)]
  fn is_available(&self) -> Result<bool> {
    OrtNNAPIExecutionProvider::default().is_available()
  }

  #[frb(ignore)]
  fn build(&self) -> ExecutionProviderDispatch {
    let mut epd = OrtNNAPIExecutionProvider::default();

    if let Some(fp16) = self.fp16 {
      epd = epd.with_fp16(fp16);
    }
    if let Some(nchw) = self.nchw {
      epd = epd.with_nchw(nchw);
    }
    if let Some(disable_cpu) = self.disable_cpu {
      epd = epd.with_disable_cpu(disable_cpu);
    }
    if let Some(cpu_only) = self.cpu_only {
      epd = epd.with_cpu_only(cpu_only);
    }

    epd.build()
  }
}
