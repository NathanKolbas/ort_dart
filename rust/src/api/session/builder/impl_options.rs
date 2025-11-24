#[allow(unused_imports)]
pub use ort::session::builder::GraphOptimizationLevel;

/// ONNX Runtime provides various graph optimizations to improve performance. Graph optimizations are essentially
/// graph-level transformations, ranging from small graph simplifications and node eliminations to more complex node
/// fusions and layout optimizations.
///
/// Graph optimizations are divided in several categories (or levels) based on their complexity and functionality. They
/// can be performed either online or offline. In online mode, the optimizations are done before performing the
/// inference, while in offline mode, the runtime saves the optimized graph to disk (most commonly used when converting
/// an ONNX model to an ONNX Runtime model).
///
/// The optimizations belonging to one level are performed after the optimizations of the previous level have been
/// applied (e.g., extended optimizations are applied after basic optimizations have been applied).
///
/// **All optimizations (i.e. [`GraphOptimizationLevel::Level3`]) are enabled by default.**
///
/// # Online/offline mode
/// All optimizations can be performed either online or offline. In online mode, when initializing an inference session,
/// we also apply all enabled graph optimizations before performing model inference. Applying all optimizations each
/// time we initiate a session can add overhead to the model startup time (especially for complex models), which can be
/// critical in production scenarios. This is where the offline mode can bring a lot of benefit. In offline mode, after
/// performing graph optimizations, ONNX Runtime serializes the resulting model to disk. Subsequently, we can reduce
/// startup time by using the already optimized model and disabling all optimizations.
///
/// ## Notes:
/// - When running in offline mode, make sure to use the exact same options (e.g., execution providers, optimization
///   level) and hardware as the target machine that the model inference will run on (e.g., you cannot run a model
///   pre-optimized for a GPU execution provider on a machine that is equipped only with CPU).
/// - When layout optimizations are enabled, the offline mode can only be used on compatible hardware to the environment
///   when the offline model is saved. For example, if model has layout optimized for AVX2, the offline model would
///   require CPUs that support AVX2.
#[derive(Copy, Clone)]
#[flutter_rust_bridge::frb(mirror(GraphOptimizationLevel))]
pub enum _GraphOptimizationLevel {
  /// Disables all graph optimizations.
  Disable,
  /// Level 1 includes semantics-preserving graph rewrites which remove redundant nodes and redundant computation.
  /// They run before graph partitioning and thus apply to all the execution providers. Available basic/level 1 graph
  /// optimizations are as follows:
  ///
  /// - Constant Folding: Statically computes parts of the graph that rely only on constant initializers. This
  ///   eliminates the need to compute them during runtime.
  /// - Redundant node eliminations: Remove all redundant nodes without changing the graph structure. The following
  ///   such optimizations are currently supported:
  ///   * Identity Elimination
  ///   * Slice Elimination
  ///   * Unsqueeze Elimination
  ///   * Dropout Elimination
  /// - Semantics-preserving node fusions : Fuse/fold multiple nodes into a single node. For example, Conv Add fusion
  ///   folds the Add operator as the bias of the Conv operator. The following such optimizations are currently
  ///   supported:
  ///   * Conv Add Fusion
  ///   * Conv Mul Fusion
  ///   * Conv BatchNorm Fusion
  ///   * Relu Clip Fusion
  ///   * Reshape Fusion
  Level1,
  #[rustfmt::skip]
	/// Level 2 optimizations include complex node fusions. They are run after graph partitioning and are only applied to
	/// the nodes assigned to the CPU or CUDA execution provider. Available extended/level 2 graph optimizations are as follows:
	///
	/// | Optimization                    | EPs       | Comments                                                                       |
	/// |:------------------------------- |:--------- |:------------------------------------------------------------------------------ |
	/// | GEMM Activation Fusion          | CPU       |                                                                                |
	/// | Matmul Add Fusion               | CPU       |                                                                                |
	/// | Conv Activation Fusion          | CPU       |                                                                                |
	/// | GELU Fusion                     | CPU, CUDA |                                                                                |
	/// | Layer Normalization Fusion      | CPU, CUDA |                                                                                |
	/// | BERT Embedding Layer Fusion     | CPU, CUDA | Fuses BERT embedding layers, layer normalization, & attention mask length      |
	/// | Attention Fusion*               | CPU, CUDA |                                                                                |
	/// | Skip Layer Normalization Fusion | CPU, CUDA | Fuse bias of fully connected layers, skip connections, and layer normalization |
	/// | Bias GELU Fusion                | CPU, CUDA | Fuse bias of fully connected layers & GELU activation                          |
	/// | GELU Approximation*             | CUDA      | Disabled by default; enable with `OrtSessionOptions::EnableGeluApproximation`  |
	///
	/// > **NOTE**: To optimize performance of the BERT model, approximation is used in GELU Approximation and Attention
	/// > Fusion for the CUDA execution provider. The impact on accuracy is negligible based on our evaluation; F1 score
	/// > for a BERT model on SQuAD v1.1 is almost the same (87.05 vs 87.03).
	Level2,
  /// Level 3 optimizations include memory layout optimizations, which may optimize the graph to use the NCHWc memory
  /// layout rather than NCHW to improve spatial locality for some targets.
  Level3
}
