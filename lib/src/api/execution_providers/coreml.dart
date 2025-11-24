import 'package:ort/src/api/execution_providers/execution_providers.dart';
import 'package:ort/src/rust/api/execution_providers/coreml.dart' as coreml;
import 'package:ort/src/rust/api/execution_providers.dart' as ort_ep;

export 'package:ort/src/rust/api/execution_providers/coreml.dart'
    show
        CoreMLComputeUnits,
        CoreMLModelFormat,
        CoreMLSpecializationStrategy;

/// [CoreML execution provider](https://onnxruntime.ai/docs/execution-providers/CoreML-ExecutionProvider.html) for hardware
/// acceleration on Apple devices.
class CoreMLExecutionProvider implements ExecutionProvider {
  coreml.CoreMLExecutionProvider _inner = coreml.CoreMLExecutionProvider.raw();

  CoreMLExecutionProvider();

  @override
  bool isAvailable() => _inner.isAvailable();

  @override
  String name() => _inner.name();

  @override
  bool supportedByPlatform() => _inner.supportedByPlatform();

  @override
  ort_ep.ExecutionProvider toImpl() => ort_ep.ExecutionProvider.coreMl(_inner);

  /// Enable CoreML EP to run on a subgraph in the body of a control flow operator (i.e. a `Loop`, `Scan` or `If`
  /// operator).
  ///
  /// ```
  /// # use ort::{execution_providers::coreml::CoreMLExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CoreMLExecutionProvider::default().with_subgraphs(true).build();
  /// # Ok(())
  /// # }
  /// ```
  CoreMLExecutionProvider withSubgraphs(bool subgraphs) =>
      this.._inner = _inner.copyWith(subgraphs: subgraphs);

  /// Only allow the CoreML EP to take nodes with inputs that have static shapes. By default the CoreML EP will also
  /// allow inputs with dynamic shapes, however performance may be negatively impacted by inputs with dynamic shapes.
  ///
  /// ```
  /// # use ort::{execution_providers::coreml::CoreMLExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CoreMLExecutionProvider::default().with_static_input_shapes(true).build();
  /// # Ok(())
  /// # }
  /// ```
  CoreMLExecutionProvider withStaticInputShapes(bool staticInputShapes) =>
      this.._inner = _inner.copyWith(staticInputShapes: staticInputShapes);

  /// Configures the format of the CoreML model created by the EP.
  ///
  /// The default format, [NeuralNetwork](`CoreMLModelFormat::NeuralNetwork`), has better compatibility with older
  /// versions of macOS/iOS. The newer [MLProgram](`CoreMLModelFormat::MLProgram`) format supports more operators,
  /// and may be more performant.
  ///
  /// ```
  /// # use ort::{execution_providers::coreml::{CoreMLExecutionProvider, CoreMLModelFormat}, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CoreMLExecutionProvider::default().with_model_format(CoreMLModelFormat::MLProgram).build();
  /// # Ok(())
  /// # }
  /// ```
  CoreMLExecutionProvider withModelFormat(coreml.CoreMLModelFormat modelFormat) =>
      this.._inner = _inner.copyWith(modelFormat: modelFormat);

  /// Configures the specialization strategy.
  ///
  /// CoreML segments the model's compute graph and specializes each segment for the target compute device. This
  /// process can affect the model loading time and the prediction latency. You can use this option to specialize a
  /// model for faster prediction, at the potential cost of session load time and memory footprint.
  ///
  /// ```
  /// # use ort::{execution_providers::coreml::{CoreMLExecutionProvider, CoreMLSpecializationStrategy}, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CoreMLExecutionProvider::default().with_specialization_strategy(CoreMLSpecializationStrategy::FastPrediction).build();
  /// # Ok(())
  /// # }
  /// ```
  CoreMLExecutionProvider withSpecializationStrategy(
          coreml.CoreMLSpecializationStrategy specializationStrategy) =>
      this
        .._inner =
            _inner.copyWith(specializationStrategy: specializationStrategy);

  /// Configures what hardware can be used by CoreML for acceleration.
  ///
  /// ```
  /// # use ort::{execution_providers::coreml::{CoreMLExecutionProvider, CoreMLComputeUnits}, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CoreMLExecutionProvider::default()
  /// 	.with_compute_units(CoreMLComputeUnits::CPUAndNeuralEngine)
  /// 	.build();
  /// # Ok(())
  /// # }
  /// ```
  CoreMLExecutionProvider withComputeUnits(
          coreml.CoreMLComputeUnits computeUnits) =>
      this.._inner = _inner.copyWith(computeUnits: computeUnits);

  /// Configures whether to log the hardware each operator is dispatched to and the estimated execution time; useful
  /// for debugging unexpected performance with CoreML.
  ///
  /// ```
  /// # use ort::{execution_providers::coreml::CoreMLExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CoreMLExecutionProvider::default().with_profile_compute_plan(true).build();
  /// # Ok(())
  /// # }
  /// ```
  CoreMLExecutionProvider withProfileComputePlan(bool profileComputePlan) =>
      this.._inner = _inner.copyWith(profileComputePlan: profileComputePlan);

  /// Configures whether to allow low-precision (fp16) accumulation on GPU.
  ///
  /// ```
  /// # use ort::{execution_providers::coreml::CoreMLExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CoreMLExecutionProvider::default().with_low_precision_accumulation_on_gpu(true).build();
  /// # Ok(())
  /// # }
  /// ```
  CoreMLExecutionProvider withLowPrecisionAccumulationOnGpu(
          bool lowPrecisionAccumulationOnGpu) =>
      this
        .._inner = _inner.copyWith(
            lowPrecisionAccumulationOnGpu: lowPrecisionAccumulationOnGpu);

  /// Configures a path to cache the compiled CoreML model.
  ///
  /// If caching is not enabled (the default), the model will be compiled and saved to disk on each instantiation of a
  /// session. Setting this option allows the compiled model to be reused across session loads.
  ///
  /// ```
  /// # use ort::{execution_providers::coreml::CoreMLExecutionProvider, session::Session};
  /// # fn main() -> ort::Result<()> {
  /// let ep = CoreMLExecutionProvider::default().with_model_cache_dir("/path/to/cache").build();
  /// # Ok(())
  /// # }
  /// ```
  ///
  /// ## Updating the cache
  /// The cached model will only be recompiled if the ONNX model's metadata or the structure of the graph changes. To
  /// ensure a model updates when i.e. only weights change, you can add the hash of the model file as a custom
  /// metadata option:
  /// ```python
  /// import onnx
  /// import hashlib
  ///
  /// # You can use any other hash algorithms to ensure the model and its hash-value is a one-one mapping.
  /// def hash_file(file_path, algorithm='sha256', chunk_size=8192):
  /// 	hash_func = hashlib.new(algorithm)
  /// 	with open(file_path, 'rb') as file:
  /// 		while chunk := file.read(chunk_size):
  /// 		hash_func.update(chunk)
  /// 	return hash_func.hexdigest()
  ///
  /// CACHE_KEY_NAME = "CACHE_KEY"
  /// model_path = "/a/b/c/model.onnx"
  /// m = onnx.load(model_path)
  ///
  /// cache_key = m.metadata_props.add()
  /// cache_key.key = CACHE_KEY_NAME
  /// cache_key.value = str(hash_file(model_path))
  ///
  /// onnx.save_model(m, model_path)
  /// ```
  CoreMLExecutionProvider withModelCacheDir(String modelCacheDir) =>
      this.._inner = _inner.copyWith(modelCacheDir: modelCacheDir);
}
