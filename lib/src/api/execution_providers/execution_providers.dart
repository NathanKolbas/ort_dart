import 'package:ort/src/api/execution_providers/coreml.dart';
import 'package:ort/src/api/execution_providers/cpu.dart';
import 'package:ort/src/api/execution_providers/cuda.dart';
import 'package:ort/src/api/execution_providers/directml.dart';
import 'package:ort/src/api/execution_providers/nnapi.dart';
import 'package:ort/src/api/execution_providers/qnn.dart';
import 'package:ort/src/api/execution_providers/rocm.dart';
import 'package:ort/src/api/execution_providers/tensorrt.dart';
import 'package:ort/src/rust/api/execution_providers.dart' as ort_ep;

export 'package:ort/src/api/execution_providers/coreml.dart';
export 'package:ort/src/api/execution_providers/cpu.dart';
export 'package:ort/src/api/execution_providers/cuda.dart';
export 'package:ort/src/api/execution_providers/directml.dart';
export 'package:ort/src/api/execution_providers/nnapi.dart';
export 'package:ort/src/api/execution_providers/qnn.dart';
export 'package:ort/src/api/execution_providers/rocm.dart';
export 'package:ort/src/api/execution_providers/tensorrt.dart';

export 'package:ort/src/rust/api/execution_providers.dart' show ArenaExtendStrategy;

abstract class ExecutionProvider {
  /// Returns `Ok(true)` if ONNX Runtime was *compiled with support* for this execution provider, and `Ok(false)`
  /// otherwise.
  ///
  /// An `Err` may be returned if a serious internal error occurs, in which case your application should probably
  /// just abort.
  ///
  /// **Note that this does not always mean the execution provider is *usable* for a specific session.** A model may
  /// use operators not supported by an execution provider, or the EP may encounter an error while attempting to load
  /// dependencies during session creation. In most cases (i.e. showing the user an error message if CUDA could not be
  /// enabled), you'll instead want to manually register this EP via [`ExecutionProvider::register`] and detect
  /// and handle any errors returned by that function.
  bool isAvailable();

  /// Returns the identifier of this execution provider used internally by ONNX Runtime.
  ///
  /// This is the same as what's used in ONNX Runtime's Python API to register this execution provider, i.e.
  /// [`TVMExecutionProvider`]'s identifier is `TvmExecutionProvider`.
  String name();

  /// Returns whether this execution provider is supported on this platform.
  ///
  /// For example, the CoreML execution provider implements this as:
  /// ```ignore
  /// impl ExecutionProvider for CoreMLExecutionProvider {
  /// 	fn supported_by_platform() -> bool {
  /// 		cfg!(target_vendor = "apple")
  /// 	}
  /// }
  /// ```
  bool supportedByPlatform();

  ort_ep.ExecutionProvider toImpl();
}

/// Returns a list of [ExecutionProvider]s that pass [isAvailable], which is if
/// ONNX Runtime was *compiled with support* for said execution provider.
///
/// **Note that this does not always mean the execution provider is *usable* for a specific session.** A model may
/// use operators not supported by an execution provider, or the EP may encounter an error while attempting to load
/// dependencies during session creation. In most cases (i.e. showing the user an error message if CUDA could not be
/// enabled), you'll instead want to manually register this EP via [`ExecutionProvider::register`] and detect
/// and handle any errors returned by that function.
List<ExecutionProvider> getAvailableExecutionProviders() => [
  CoreMLExecutionProvider(),
  CPUExecutionProvider(),
  CUDAExecutionProvider(),
  DirectMLExecutionProvider(),
  NNAPIExecutionProvider(),
  QNNExecutionProvider(),
  ROCmExecutionProvider(),
  TensorRTExecutionProvider(),
].where((ep) => ep.isAvailable()).toList(growable: false);
