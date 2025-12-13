import 'package:ort/src/api/tensor.dart';
import 'package:ort/src/api/execution_providers/execution_providers.dart';
import 'package:ort/src/rust/api/session.dart';
import 'package:ort/src/rust/api/session/builder/impl_options.dart';

class Session {
  final SessionImpl _session;

  Session._(this._session);

  void dispose() {
    _session.dispose();
  }

  bool get isDisposed => _session.isDisposed;

  /// Creates a new [`SessionBuilder`].
  static SessionBuilder builder() => SessionBuilder._(SessionImpl.builder());

  /// Information about the graph's inputs.
  List<Input> get inputs => _session.inputs();

  /// Utility method to get just the graph's input names.
  Iterable<String> get inputNames sync* {
    for (final input in _session.inputs()) {
      yield input.name;
    }
  }

  /// Information about the graph's outputs.
  List<Output> get outputs => _session.outputs();

  /// Utility method to get just the graph's output names.
  Iterable<String> get outputNames sync* {
    for (final output in _session.outputs()) {
      yield output.name;
    }
  }

  /// Run input data through the ONNX graph, performing inference.
  ///
  /// See [`crate::inputs!`] for a convenient macro which will help you create your session inputs from `ndarray`s or
  /// other data. You can also provide a `Vec`, array, or `HashMap` of [`Value`]s if you create your inputs
  /// dynamically.
  ///
  /// ```
  /// # use std::sync::Arc;
  /// # use ort::{session::{run_options::RunOptions, Session}, tensor::TensorElementType, value::{Value, ValueType, TensorRef}};
  /// # fn main() -> ort::Result<()> {
  /// let mut session = Session::builder()?.commit_from_file("tests/data/upsample.onnx")?;
  /// let input = ndarray::Array4::<f32>::zeros((1, 64, 64, 3));
  /// let outputs = session.run(ort::inputs![TensorRef::from_array_view(&input)?])?;
  /// # 	Ok(())
  /// # }
  /// ```
  ///
  /// [doNotClone] - By default, the [Tensor] is cloned before being being
  /// passed to the session. Disable this by setting [doNotClone] to true. If
  /// you do this then rust will drop it from memory and the passed in [Tensor]s
  /// are no longer valid. I don't have a work around for this at the moment...
  Future<Map<String, Tensor>> run({
    required Map<String, Tensor> inputValues,
    bool doNotClone = false,
  }) async {
    final output = await _session.run(
      // If we pass the rawTensor directly then rust will drop it from memory.
      // To get around this we use clone, however, this causes the data to be
      // copied (bad). I don't have a work around for this at the moment...
      inputValues: inputValues.map((k, v) => MapEntry(k, v.rawTensor.clone())),
    );
    return output.map((k, v) => MapEntry(k, tensorFromImpl(v)));
  }
}

class SessionBuilder {
  final SessionBuilderOptions _options;

  SessionBuilder._(this._options);

  /// Registers a list of execution providers for this session. Execution providers are registered in the order they
  /// are provided.
  ///
  /// Execution providers will only work if the corresponding Cargo feature is enabled and ONNX Runtime was built
  /// with support for the corresponding execution provider. Execution providers that do not have their corresponding
  /// feature enabled will emit a warning.
  ///
  /// ## Notes
  ///
  /// - **Indiscriminate use of [`SessionBuilder::with_execution_providers`] in a library** (e.g. always enabling
  ///   `CUDAExecutionProvider`) **is discouraged** unless you allow the user to configure the execution providers by
  ///   providing a `Vec` of [`ExecutionProviderDispatch`]es.
  SessionBuilder withExecutionProviders(List<ExecutionProvider> executionProviders) => SessionBuilder._(_options.copyWith(
    executionProviders: executionProviders.map((ep) => ep.toImpl()).toList(),
  ));

  /// Configure the session to use a number of threads to parallelize the execution within nodes. If ONNX Runtime was
  /// built with OpenMP (as is the case with Microsoft's prebuilt binaries), this will have no effect on the number of
  /// threads used. Instead, you can configure the number of threads OpenMP uses via the `OMP_NUM_THREADS` environment
  /// variable.
  ///
  /// For configuring the number of threads used when the session execution mode is set to `Parallel`, see
  /// [`SessionBuilder::with_inter_threads()`].
  SessionBuilder withIntraThreads(int numThreads) => SessionBuilder._(_options.copyWith(
    intraThreads: numThreads,
  ));

  /// Configure the session to use a number of threads to parallelize the execution of the graph. If nodes can be run
  /// in parallel, this sets the maximum number of threads to use to run them in parallel.
  ///
  /// This has no effect when the session execution mode is set to `Sequential`.
  ///
  /// For configuring the number of threads used to parallelize the execution within nodes, see
  /// [`SessionBuilder::with_intra_threads()`].
  SessionBuilder withInterThreads(int numThreads) => SessionBuilder._(_options.copyWith(
    interThreads: numThreads,
  ));

  /// Enable/disable the parallel execution mode for this session. By default, this is disabled.
  ///
  /// Parallel execution can improve performance for models with many branches, at the cost of higher memory usage.
  /// You can configure the amount of threads used to parallelize the execution of the graph via
  /// [`SessionBuilder::with_inter_threads()`].
  SessionBuilder withParallelExecution(bool parallelExecution) => SessionBuilder._(_options.copyWith(
    parallelExecution: parallelExecution,
  ));

  /// Set the session's optimization level. See [`GraphOptimizationLevel`] for more information on the different
  /// optimization levels.
  SessionBuilder withOptimizationLevel(GraphOptimizationLevel optLevel) => SessionBuilder._(_options.copyWith(
    optimizationLevel: optLevel,
  ));

  /// Enables/disables memory pattern optimization. Disable it if the input size varies, i.e., dynamic batch
  SessionBuilder withMemoryPattern(bool enable) => SessionBuilder._(_options.copyWith(
    memoryPattern: enable,
  ));

  /// Load an ONNX graph from memory and commit the session.
  Future<Session> commitFromMemory(List<int> modelBytes) async {
    return Session._(await _options.commitFromMemory(modelBytes: modelBytes));
  }

  /// Loads an ONNX model from a file and builds the session.
  Future<Session> commitFromFile(String modelFilepath) async {
    return Session._(await _options.commitFromFile(modelFilepath: modelFilepath));
  }
}
