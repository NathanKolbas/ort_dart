use std::num::NonZeroUsize;
use flutter_rust_bridge::frb;
use ort::Result;
use ort::execution_providers::{XNNPACKExecutionProvider as OrtXNNPACKExecutionProvider};
use ort::execution_providers::{ExecutionProvider, ExecutionProviderDispatch};
use crate::api::execution_providers::ExecutionProviderBase;

/// [XNNPACK execution provider](https://onnxruntime.ai/docs/execution-providers/Xnnpack-ExecutionProvider.html) for
/// ARM, x86, and WASM platforms.
///
/// # Threading
/// XNNPACK uses its own threadpool separate from the [`Session`](crate::session::Session)'s intra-op threadpool. If
/// most of your model's compute lies in nodes supported by XNNPACK (i.e. `Conv`, `Gemm`, `MatMul`), it's best to
/// disable the session intra-op threadpool to reduce contention:
/// ```no_run
/// # use core::num::NonZeroUsize;
/// # use ort::{execution_providers::xnnpack::XNNPACKExecutionProvider, session::Session};
/// # fn main() -> ort::Result<()> {
/// let session = Session::builder()?
/// 	.with_intra_op_spinning(false)?
/// 	.with_intra_threads(1)?
/// 	.with_execution_providers([XNNPACKExecutionProvider::default()
/// 		.with_intra_op_num_threads(NonZeroUsize::new(4).unwrap())
/// 		.build()])?
/// 	.commit_from_file("model.onnx")?;
/// # Ok(())
/// # }
/// ```
#[derive(Debug, Default, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct XNNPACKExecutionProvider {
  pub intra_op_num_threads: Option<usize>,
}

impl XNNPACKExecutionProvider {
  #[frb(sync)]
  pub fn new() -> Self { XNNPACKExecutionProvider::default() }
}

impl ExecutionProviderBase for XNNPACKExecutionProvider {
  #[frb(sync)]
  fn name(&self) -> String {
    OrtXNNPACKExecutionProvider::default().name().to_string()
  }

  #[frb(sync)]
  fn supported_by_platform(&self) -> bool {
    OrtXNNPACKExecutionProvider::default().supported_by_platform()
  }

  #[frb(sync)]
  fn is_available(&self) -> Result<bool> {
    OrtXNNPACKExecutionProvider::default().is_available()
  }

  #[frb(ignore)]
  fn build(&self) -> ExecutionProviderDispatch {
    let mut epd = OrtXNNPACKExecutionProvider::default();

    if let Some(intra_op_num_threads) = self.intra_op_num_threads {
      epd = epd.with_intra_op_num_threads(unsafe {
        NonZeroUsize::new_unchecked(intra_op_num_threads)
      });
    }

    epd.build()
  }
}
