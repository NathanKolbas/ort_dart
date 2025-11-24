use flutter_rust_bridge::frb;
use ort::Result;
use ort::execution_providers::{DirectMLExecutionProvider as OrtDirectMLExecutionProvider};
use ort::execution_providers::{ExecutionProvider, ExecutionProviderDispatch};
use crate::api::execution_providers::ExecutionProviderBase;
pub use ort::execution_providers::cuda::CuDNNConvAlgorithmSearch;

/// [DirectML execution provider](https://onnxruntime.ai/docs/execution-providers/DirectML-ExecutionProvider.html) for
/// DirectX 12-enabled hardware on Windows.
///
/// # Performance considerations
/// The DirectML EP performs best when the size of inputs & outputs are known when the session is created. For graphs
/// with dynamically sized inputs, you can override individual dimensions by constructing the session with
/// [`SessionBuilder::with_dimension_override`]:
/// ```no_run
/// # use ort::{execution_providers::directml::DirectMLExecutionProvider, session::Session};
/// # fn main() -> ort::Result<()> {
/// let session = Session::builder()?
/// 	.with_execution_providers([DirectMLExecutionProvider::default().build()])?
/// 	.with_dimension_override("batch", 1)?
/// 	.with_dimension_override("seq_len", 512)?
/// 	.commit_from_file("gpt2.onnx")?;
/// # Ok(())
/// # }
/// ```
#[derive(Debug, Default, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct DirectMLExecutionProvider {
  pub device_id: Option<i32>,
}

impl DirectMLExecutionProvider {
  #[frb(sync)]
  pub fn new() -> Self { DirectMLExecutionProvider::default() }
}

impl ExecutionProviderBase for DirectMLExecutionProvider {
  #[frb(sync)]
  fn name(&self) -> String {
    OrtDirectMLExecutionProvider::default().name().to_string()
  }

  #[frb(sync)]
  fn supported_by_platform(&self) -> bool {
    OrtDirectMLExecutionProvider::default().supported_by_platform()
  }

  #[frb(sync)]
  fn is_available(&self) -> Result<bool> {
    OrtDirectMLExecutionProvider::default().is_available()
  }

  #[frb(ignore)]
  fn build(&self) -> ExecutionProviderDispatch {
    let mut epd = OrtDirectMLExecutionProvider::default();

    if let Some(device_id) = self.device_id {
      epd = epd.with_device_id(device_id);
    }

    epd.build()
  }
}
