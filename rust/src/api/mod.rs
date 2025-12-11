pub mod execution_providers;
pub mod session;
pub mod logging;
pub mod memory;
pub mod tensor;

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
  logging::init_logging();
  flutter_rust_bridge::setup_default_user_utils();
}
