use std::sync::OnceLock;
use flutter_rust_bridge::frb;
use log::error;
use tracing_subscriber::{
  fmt,
  prelude::*,
  reload::{self, Handle},
  EnvFilter,
  Registry,
};

type ReloadHandle = Handle<EnvFilter, Registry>;
static RELOAD_HANDLE: OnceLock<ReloadHandle> = OnceLock::new();

#[frb(ignore)]
pub fn init_logging() {
  let filter = EnvFilter::try_from_default_env().unwrap_or_else(|_| "info".into());
  let (filter, reload_handle) = reload::Layer::new(filter);

  if RELOAD_HANDLE.set(reload_handle).is_err() {
    // Already initialized.
    return;
  }

  #[cfg(not(target_os = "android"))]
  let _ = tracing_subscriber::registry()
    .with(filter)
    .with(fmt::layer())
    .try_init();

  #[cfg(target_os = "android")]
  let _ = tracing_subscriber::registry()
    .with(filter)
    .with(tracing_android::layer("ort").unwrap())
    .with(fmt::layer())
    .try_init();
}

#[frb(ignore)]
pub(crate) fn update_log_level(level: &str) {
  if let Some(handle) = RELOAD_HANDLE.get() {
    let filter_str = format!("info,ort={level}");
    match EnvFilter::try_new(&filter_str) {
      Ok(filter) => {
        // Ignore error if subscriber is already dropped.
        let _ = handle.reload(filter);
      },
      Err(e) => {
        // This is a programming error, but we'll log it.
        error!("Invalid log filter syntax '{}': {}", filter_str, e);
      }
    }
  }
}

/// The level of logging for [ort_debug_messages]
pub enum OrtDebugLevel {
  Trace,
  Debug,
  Info,
  Warn,
  Error
}

impl OrtDebugLevel {
  #[frb(ignore)]
  pub fn value(&self) -> String {
    match self {
      OrtDebugLevel::Trace => "trace",
      OrtDebugLevel::Debug => "debug",
      OrtDebugLevel::Info => "info",
      OrtDebugLevel::Warn => "warn",
      OrtDebugLevel::Error => "error",
    }.to_string()
  }
}

/// Enable logging ORT messages to the console
#[frb(sync)]
pub fn ort_debug_messages(level: Option<OrtDebugLevel>) {
  let level = level.unwrap_or(OrtDebugLevel::Debug).value();
  update_log_level(&level);
}
