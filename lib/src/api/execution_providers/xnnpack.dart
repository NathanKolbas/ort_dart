import 'package:ort/src/api/execution_providers/execution_providers.dart';
import 'package:ort/src/rust/api/execution_providers/xnnpack.dart' as xnnpack;
import 'package:ort/src/rust/api/execution_providers.dart' as ort_ep;

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
class XNNPACKExecutionProvider implements ExecutionProvider {
  xnnpack.XNNPACKExecutionProvider _inner = xnnpack.XNNPACKExecutionProvider.raw();

  XNNPACKExecutionProvider();

  @override
  bool isAvailable() => _inner.isAvailable();

  @override
  String name() => _inner.name();

  @override
  bool supportedByPlatform() => _inner.supportedByPlatform();

  @override
  ort_ep.ExecutionProvider toImpl() => ort_ep.ExecutionProvider.xnnpack(_inner);

  /// Configures the number of threads to use for XNNPACK's internal intra-op threadpool.
  ///
  /// ```
  /// # use core::num::NonZeroUsize;
  /// # use ort::{execution_providers::xnnpack::XNNPACKExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = XNNPACKExecutionProvider::default()
  /// 	.with_intra_op_num_threads(NonZeroUsize::new(4).unwrap())
  /// 	.build();
  /// # Ok(())
  /// # }
  /// ```
  XNNPACKExecutionProvider withIntraOpNumThreads(int numThreads) {
    if (numThreads <= 0) {
      throw ArgumentError("intraOpNumThreads must be greater than 0");
    }

    return this.._inner = _inner.copyWith(
      intraOpNumThreads: numThreads,
    );
  }
}
