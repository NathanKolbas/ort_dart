pub mod execution_providers;
pub mod session;
pub mod debug;
pub mod memory;
pub mod tensor;

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
  // Default utilities - feel free to customize
  flutter_rust_bridge::setup_default_user_utils();
}
