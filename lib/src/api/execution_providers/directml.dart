import 'package:ort/src/api/execution_providers/execution_providers.dart';
import 'package:ort/src/rust/api/execution_providers/directml.dart' as direct_ml;
import 'package:ort/src/rust/api/execution_providers.dart' as ort_ep;

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
class DirectMLExecutionProvider implements ExecutionProvider {
  direct_ml.DirectMLExecutionProvider _inner = direct_ml.DirectMLExecutionProvider();

  DirectMLExecutionProvider();

  @override
  bool isAvailable() => _inner.isAvailable();

  @override
  String name() => _inner.name();

  @override
  bool supportedByPlatform() => _inner.supportedByPlatform();

  @override
  ort_ep.ExecutionProvider toImpl() => ort_ep.ExecutionProvider.directMl(_inner);

  /// Configures which device the EP should use.
  ///
  /// ```
  /// # use ort::{execution_providers::directml::DirectMLExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = DirectMLExecutionProvider::default().with_device_id(1).build();
  /// # Ok(())
  /// # }
  /// ```
  DirectMLExecutionProvider withDeviceId(int deviceId) => this.._inner = _inner.copyWith(
    deviceId: deviceId,
  );
}
