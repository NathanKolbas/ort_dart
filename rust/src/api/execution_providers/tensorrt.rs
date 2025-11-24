use flutter_rust_bridge::frb;
use ort::Result;
use ort::execution_providers::{TensorRTExecutionProvider as OrtTensorRTExecutionProvider};
use ort::execution_providers::{ExecutionProvider, ExecutionProviderDispatch};
use crate::api::execution_providers::ExecutionProviderBase;
pub use ort::execution_providers::cuda::CuDNNConvAlgorithmSearch;

#[derive(Debug, Default, Clone)]
#[frb(dart_metadata=("freezed"))]
pub struct TensorRTExecutionProvider {
  pub device_id: Option<i32>,
  pub max_workspace_size: Option<usize>,
  pub min_subgraph_size: Option<usize>,
  pub max_partition_iterations: Option<u32>,
  pub fp16: Option<bool>,
  pub int8: Option<bool>,
  pub dla: Option<bool>,
  pub dla_core: Option<u32>,
  pub int8_calibration_table_name: Option<String>,
  pub int8_use_native_calibration_table: Option<bool>,
  pub engine_cache: Option<bool>,
  pub engine_cache_path: Option<String>,
  pub dump_subgraphs: Option<bool>,
  pub engine_cache_prefix: Option<String>,
  pub weight_stripped_engine: Option<bool>,
  pub onnx_model_folder_path: Option<String>,
  pub engine_decryption: Option<bool>,
  pub engine_decryption_lib_path: Option<String>,
  pub force_sequential_engine_build: Option<bool>,
  pub context_memory_sharing: Option<bool>,
  pub layer_norm_fp32_fallback: Option<bool>,
  pub timing_cache: Option<bool>,
  pub timing_cache_path: Option<String>,
  pub force_timing_cache: Option<bool>,
  pub detailed_build_log: Option<bool>,
  pub build_heuristics: Option<bool>,
  pub sparsity: Option<bool>,
  pub builder_optimization_level: Option<u8>,
  pub auxiliary_streams: Option<i8>,
  pub tactic_sources: Option<String>,
  pub extra_plugin_lib_paths: Option<String>,
  pub profile_min_shapes: Option<String>,
  pub profile_max_shapes: Option<String>,
  pub profile_opt_shapes: Option<String>,
  pub cuda_graph: Option<bool>,
  pub dump_ep_context_model: Option<bool>,
  pub ep_context_file_path: Option<String>,
  pub ep_context_embed_mode: Option<u8>,
  pub engine_hw_compatible: Option<bool>,
}

impl TensorRTExecutionProvider {
  #[frb(sync)]
  pub fn new() -> Self { TensorRTExecutionProvider::default() }
}

impl ExecutionProviderBase for TensorRTExecutionProvider {
  #[frb(sync)]
  fn name(&self) -> String {
    OrtTensorRTExecutionProvider::default().name().to_string()
  }

  #[frb(sync)]
  fn supported_by_platform(&self) -> bool {
    OrtTensorRTExecutionProvider::default().supported_by_platform()
  }

  #[frb(sync)]
  fn is_available(&self) -> Result<bool> {
    OrtTensorRTExecutionProvider::default().is_available()
  }

  #[frb(ignore)]
  fn build(&self) -> ExecutionProviderDispatch {
    let mut epd = OrtTensorRTExecutionProvider::default();

    if let Some(device_id) = self.device_id {
      epd = epd.with_device_id(device_id);
    }
    if let Some(max_workspace_size) = self.max_workspace_size {
      epd = epd.with_max_workspace_size(max_workspace_size);
    }
    if let Some(min_subgraph_size) = self.min_subgraph_size {
      epd = epd.with_min_subgraph_size(min_subgraph_size);
    }
    if let Some(max_partition_iterations) = self.max_partition_iterations {
      epd = epd.with_max_partition_iterations(max_partition_iterations);
    }
    if let Some(fp16) = self.fp16 {
      epd = epd.with_fp16(fp16);
    }
    if let Some(int8) = self.int8 {
      epd = epd.with_int8(int8);
    }
    if let Some(dla) = self.dla {
      epd = epd.with_dla(dla);
    }
    if let Some(dla_core) = self.dla_core {
      epd = epd.with_dla_core(dla_core);
    }
    if let Some(int8_calibration_table_name) = &self.int8_calibration_table_name {
      epd = epd.with_int8_calibration_table_name(int8_calibration_table_name.clone());
    }
    if let Some(int8_use_native_calibration_table) = self.int8_use_native_calibration_table {
      epd = epd.with_int8_use_native_calibration_table(int8_use_native_calibration_table);
    }
    if let Some(engine_cache) = self.engine_cache {
      epd = epd.with_engine_cache(engine_cache);
    }
    if let Some(engine_cache_path) = &self.engine_cache_path {
      epd = epd.with_engine_cache_path(engine_cache_path.clone());
    }
    if let Some(dump_subgraphs) = self.dump_subgraphs {
      epd = epd.with_dump_subgraphs(dump_subgraphs);
    }
    if let Some(engine_cache_prefix) = &self.engine_cache_prefix {
      epd = epd.with_engine_cache_prefix(engine_cache_prefix.clone());
    }
    if let Some(weight_stripped_engine) = self.weight_stripped_engine {
      epd = epd.with_weight_stripped_engine(weight_stripped_engine);
    }
    if let Some(onnx_model_folder_path) = &self.onnx_model_folder_path {
      epd = epd.with_onnx_model_folder_path(onnx_model_folder_path.clone());
    }
    if let Some(engine_decryption) = self.engine_decryption {
      epd = epd.with_engine_decryption(engine_decryption);
    }
    if let Some(engine_decryption_lib_path) = &self.engine_decryption_lib_path {
      epd = epd.with_engine_decryption_lib_path(engine_decryption_lib_path.clone());
    }
    if let Some(force_sequential_engine_build) = self.force_sequential_engine_build {
      epd = epd.with_force_sequential_engine_build(force_sequential_engine_build);
    }
    if let Some(context_memory_sharing) = self.context_memory_sharing {
      epd = epd.with_context_memory_sharing(context_memory_sharing);
    }
    if let Some(layer_norm_fp32_fallback) = self.layer_norm_fp32_fallback {
      epd = epd.with_layer_norm_fp32_fallback(layer_norm_fp32_fallback);
    }
    if let Some(timing_cache) = self.timing_cache {
      epd = epd.with_timing_cache(timing_cache);
    }
    if let Some(timing_cache_path) = &self.timing_cache_path {
      epd = epd.with_timing_cache_path(timing_cache_path.clone());
    }
    if let Some(force_timing_cache) = self.force_timing_cache {
      epd = epd.with_force_timing_cache(force_timing_cache);
    }
    if let Some(detailed_build_log) = self.detailed_build_log {
      epd = epd.with_detailed_build_log(detailed_build_log);
    }
    if let Some(build_heuristics) = self.build_heuristics {
      epd = epd.with_build_heuristics(build_heuristics);
    }
    if let Some(sparsity) = self.sparsity {
      epd = epd.with_sparsity(sparsity);
    }
    if let Some(builder_optimization_level) = self.builder_optimization_level {
      epd = epd.with_builder_optimization_level(builder_optimization_level);
    }
    if let Some(auxiliary_streams) = self.auxiliary_streams {
      epd = epd.with_auxiliary_streams(auxiliary_streams);
    }
    if let Some(tactic_sources) = &self.tactic_sources {
      epd = epd.with_tactic_sources(tactic_sources.clone());
    }
    if let Some(extra_plugin_lib_paths) = &self.extra_plugin_lib_paths {
      epd = epd.with_extra_plugin_lib_paths(extra_plugin_lib_paths.clone());
    }
    if let Some(profile_min_shapes) = &self.profile_min_shapes {
      epd = epd.with_profile_min_shapes(profile_min_shapes.clone());
    }
    if let Some(profile_max_shapes) = &self.profile_max_shapes {
      epd = epd.with_profile_max_shapes(profile_max_shapes.clone());
    }
    if let Some(profile_opt_shapes) = &self.profile_opt_shapes {
      epd = epd.with_profile_opt_shapes(profile_opt_shapes.clone());
    }
    if let Some(cuda_graph) = self.cuda_graph {
      epd = epd.with_cuda_graph(cuda_graph);
    }
    if let Some(dump_ep_context_model) = self.dump_ep_context_model {
      epd = epd.with_dump_ep_context_model(dump_ep_context_model);
    }
    if let Some(ep_context_file_path) = &self.ep_context_file_path {
      epd = epd.with_ep_context_file_path(ep_context_file_path.clone());
    }
    if let Some(ep_context_embed_mode) = self.ep_context_embed_mode {
      epd = epd.with_ep_context_embed_mode(ep_context_embed_mode);
    }
    if let Some(engine_hw_compatible) = self.engine_hw_compatible {
      epd = epd.with_engine_hw_compatible(engine_hw_compatible);
    }

    epd.build()
  }
}
