pub mod builder;

use std::collections::HashMap;
use flutter_rust_bridge::frb;
use ort::Result;
use ort::session::builder::{GraphOptimizationLevel, SessionBuilder};
use ort::session::{Session, SessionInputs};
use ort::value::ValueRef;
pub use ort::value::ValueType;
use crate::api::execution_providers::{ExecutionProvider, ExecutionProviderBase};
use crate::api::tensor::TensorImpl;

// #[derive(Debug)]
// #[frb(opaque)]
// pub struct MyStructOne {
//   name: String,
// }
// #[derive(Debug)]
// #[frb(opaque)]
// pub struct MyStructTwo {
//   name: String,
// }
//
// pub trait MyTrait: Debug {
//   fn name(&self) -> String;
// }
// impl MyTrait for MyStructOne {
//   fn name(&self) -> String {
//     self.name.clone()
//   }
// }
// impl MyTrait for MyStructTwo {
//   fn name(&self) -> String {
//     self.name.clone()
//   }
// }
//
// #[frb(serialize)]
// pub fn f(a: &dyn MyTrait) {
//   println!("{:?}", a);
// }

#[derive(Default)]
// #[frb(opaque, ignore_all)]
// #[frb(ignore_all)]
#[frb(dart_metadata=("freezed"))]
pub struct SessionBuilderOptions {
  pub execution_providers: Option<Vec<ExecutionProvider>>,
  pub intra_threads: Option<usize>,
  pub inter_threads: Option<usize>,
  pub parallel_execution: Option<bool>,
  pub optimization_level: Option<GraphOptimizationLevel>,
  pub memory_pattern: Option<bool>,
}

impl SessionBuilderOptions {
  fn build_session(self) -> Result<SessionBuilder> {
    let mut session = Session::builder()?;

    if let Some(execution_providers) = self.execution_providers {
      session = session.with_execution_providers(
        execution_providers.iter().map(|x| match x {
          ExecutionProvider::CoreML(core_ml) => core_ml.build(),
          ExecutionProvider::CPU(cpu) => cpu.build(),
          ExecutionProvider::CUDA(cuda) => cuda.build(),
          ExecutionProvider::DirectML(direct_ml) => direct_ml.build(),
          ExecutionProvider::NNApi(nn_api) => nn_api.build(),
          ExecutionProvider::QNN(qnn) => qnn.build(),
          ExecutionProvider::ROCm(rocm) => rocm.build(),
          ExecutionProvider::TensorRT(tensorrt) => tensorrt.build(),
        }).collect::<Vec<_>>()
      )?;
    }
    if let Some(intra_threads) = self.intra_threads {
      session = session.with_intra_threads(intra_threads)?;
    }
    if let Some(inter_threads) = self.inter_threads {
      session = session.with_inter_threads(inter_threads)?;
    }
    if let Some(parallel_execution) = self.parallel_execution {
      session = session.with_parallel_execution(parallel_execution)?;
    }
    if let Some(optimization_level) = self.optimization_level {
      session = session.with_optimization_level(optimization_level)?;
    }
    if let Some(memory_pattern) = self.memory_pattern {
      session = session.with_memory_pattern(memory_pattern)?;
    }

    Ok(session)
  }

  // /// Registers a list of execution providers for this session. Execution providers are registered in the order they
  // /// are provided.
  // ///
  // /// Execution providers will only work if the corresponding Cargo feature is enabled and ONNX Runtime was built
  // /// with support for the corresponding execution provider. Execution providers that do not have their corresponding
  // /// feature enabled will emit a warning.
  // ///
  // /// ## Notes
  // ///
  // /// - **Indiscriminate use of [`SessionBuilder::with_execution_providers`] in a library** (e.g. always enabling
  // ///   `CUDAExecutionProvider`) **is discouraged** unless you allow the user to configure the execution providers by
  // ///   providing a `Vec` of [`ExecutionProviderDispatch`]es.
  // #[frb(ignore)]
  // pub fn with_execution_providers(mut self, execution_provider: &'static dyn ExecutionProviderBase) -> Result<Self> {
  //   self.execution_providers = Some(vec![execution_provider]);
  //   Ok(self)
  // }
  //
  // /// Configure the session to use a number of threads to parallelize the execution within nodes. If ONNX Runtime was
  // /// built with OpenMP (as is the case with Microsoft's prebuilt binaries), this will have no effect on the number of
  // /// threads used. Instead, you can configure the number of threads OpenMP uses via the `OMP_NUM_THREADS` environment
  // /// variable.
  // ///
  // /// For configuring the number of threads used when the session execution mode is set to `Parallel`, see
  // /// [`SessionBuilder::with_inter_threads()`].
  // #[frb(ignore)]
  // pub fn with_intra_threads(mut self, num_threads: usize) -> Result<Self> {
  //   self.inter_threads = Some(num_threads);
  //   Ok(self)
  // }
  //
  // /// Configure the session to use a number of threads to parallelize the execution of the graph. If nodes can be run
  // /// in parallel, this sets the maximum number of threads to use to run them in parallel.
  // ///
  // /// This has no effect when the session execution mode is set to `Sequential`.
  // ///
  // /// For configuring the number of threads used to parallelize the execution within nodes, see
  // /// [`SessionBuilder::with_intra_threads()`].
  // #[frb(ignore)]
  // pub fn with_inter_threads(mut self, num_threads: usize) -> Result<Self> {
  //   self.intra_threads = Some(num_threads);
  //   Ok(self)
  // }
  //
  // /// Enable/disable the parallel execution mode for this session. By default, this is disabled.
  // ///
  // /// Parallel execution can improve performance for models with many branches, at the cost of higher memory usage.
  // /// You can configure the amount of threads used to parallelize the execution of the graph via
  // /// [`SessionBuilder::with_inter_threads()`].
  // #[frb(ignore)]
  // pub fn with_parallel_execution(mut self, parallel_execution: bool) -> Result<Self> {
  //   self.parallel_execution = Some(parallel_execution);
  //   Ok(self)
  // }
  //
  // /// Set the session's optimization level. See [`GraphOptimizationLevel`] for more information on the different
  // /// optimization levels.
  // #[frb(ignore)]
  // pub fn with_optimization_level(mut self, opt_level: GraphOptimizationLevel) -> Result<Self> {
  //   self.optimization_level = Some(opt_level);
  //   Ok(self)
  // }
  //
  // /// Enables/disables memory pattern optimization. Disable it if the input size varies, i.e., dynamic batch
  // #[frb(ignore)]
  // pub fn with_memory_pattern(mut self, enable: bool) -> Result<Self> {
  //   self.memory_pattern = Some(enable);
  //   Ok(self)
  // }

  /// Load an ONNX graph from memory and commit the session.
  pub fn commit_from_memory(self, model_bytes: &[u8]) -> Result<SessionImpl> {
    let options = self.build_session()?;

    if let Ok(inner) = options.commit_from_memory(model_bytes) {
      Ok(SessionImpl::from_session(inner))
    } else {
      Err(ort::Error::new("failed to commit session from memory"))
    }
  }

  /// Loads an ONNX model from a file and builds the session.
  pub fn commit_from_file(self, model_filepath: String) -> Result<SessionImpl> {
    let options = self.build_session()?;

    if let Ok(inner) = options.commit_from_file(model_filepath) {
      Ok(SessionImpl::from_session(inner))
    } else {
      Err(ort::Error::new("failed to commit session from file"))
    }
  }
}

// Ort doesn't implement the Clone trait for Input and Output structs so they are cloned below

/// Information about a [`Session`] input.
#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct Input {
  /// Name of the input.
  pub name: String,
  // /// Type of the input's elements.
  // pub input_type: ValueType,
}

/// Information about a [`Session`] output.
#[derive(Debug, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct Output {
  /// Name of the output.
  pub name: String,
  // /// Type of the output's elements.
  // pub output_type: ValueType
}

pub struct SessionImpl {
  inner: Session,
}

impl SessionImpl {
  fn from_session(inner: Session) -> Self {
    SessionImpl {
      inner,
    }
  }

  /// Creates a new [`SessionBuilder`].
  #[frb(sync)]
  pub fn builder() -> SessionBuilderOptions {
    SessionBuilderOptions::default()
  }

  /// Information about the graph's inputs.
  #[frb(sync)]
  pub fn inputs(&self) -> Vec<Input> {
    self.inner
      .inputs
      .iter()
      .map(|i| Input {
        name: i.name.clone(),
        // input_type: i.input_type.clone(),
      })
      .collect()
  }

  /// Information about the graph's outputs.
  #[frb(sync)]
  pub fn outputs(&self) -> Vec<Output> {
    self.inner
      .outputs
      .iter()
      .map(|o| Output {
        name: o.name.clone(),
        // output_type: o.output_type.clone(),
      })
      .collect()
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
  pub fn run(&mut self, input_values: HashMap<String, TensorImpl>) -> Result<HashMap<String, TensorImpl>> {
    let inputs: HashMap<String, ValueRef> = input_values
      .iter()
      .map(|(k, v)| (k.clone(), v.tensor.view().into_dyn()))
      .collect();
    let inputs = SessionInputs::from(inputs);

    if let Ok(outputs) = self.inner.run(inputs) {
      Ok(
        outputs
          .iter()
          .map(|(k, v)| (
            k.to_string(),
            TensorImpl::from_value_ref(v),
          ))
          .collect()
      )
    } else {
      Err(ort::Error::new("failed to run session"))
    }
  }
}

// #[cfg(test)]
// mod tests {
//   use std::collections::HashMap;
//   use ort::error::Result;
//   use crate::api::execution_providers::cpu::CPUExecutionProvider;
//   use crate::api::session::SessionImpl;
//   use crate::api::tensor::TensorImpl;
//
//   const MATMUL_MODEL: &[u8] = &[
//     8, 9, 18, 0, 58, 55, 10, 17, 10, 1, 97, 10, 1, 98, 18, 1, 99, 34, 6, 77, 97, 116, 77, 117, 108,
//     18, 1, 114, 90, 9, 10, 1, 97, 18, 4, 10, 2, 8, 1, 90, 9, 10, 1, 98, 18, 4, 10, 2, 8, 1, 98, 9,
//     10, 1, 99, 18, 4, 10, 2, 8, 1, 66, 2, 16, 20
//   ];
//
//   #[test]
//   fn test_run_session() -> Result<()> {
//     let mut session = SessionImpl::builder().commit_from_memory(MATMUL_MODEL)?;
//
//     let vec = vec![1., 2., 3.];
//     let tensor_a = TensorImpl::from_array_f32(None, vec.clone())?;
//     let tensor_b = TensorImpl::from_array_f32(None, vec.clone())?;
//
//     let output = session.run(HashMap::from([
//       ("a".to_string(), tensor_a),
//       ("b".to_string(), tensor_b),
//     ]))?;
//
//     assert_eq!(output.len(), 1);
//     assert_eq!(output.get("c").unwrap().tensor.try_extract_tensor::<f32>()?.1, vec![14.]);
//
//     Ok(())
//   }
//
//   // #[test]
//   // fn test_set_execution_providers() -> Result<()> {
//   //   let _session = SessionImpl::builder()
//   //     .with_execution_providers(vec![
//   //       Box::new(CPUExecutionProvider::new())
//   //     ])?
//   //     .commit_from_memory(MATMUL_MODEL)?;
//   //
//   //   Ok(())
//   // }
// }
