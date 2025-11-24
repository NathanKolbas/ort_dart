use flutter_rust_bridge::frb;
use tracing_subscriber::{layer::SubscriberExt, util::SubscriberInitExt};

/// The level of logging for [enable_ort_debug_messages]
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
pub fn enable_ort_debug_messages(level: Option<OrtDebugLevel>) {
  let level = level.unwrap_or(OrtDebugLevel::Debug).value();

  tracing_subscriber::registry()
    .with(tracing_subscriber::EnvFilter::try_from_default_env().unwrap_or_else(|_| format!("info,ort={level}").into()))
    .with(tracing_subscriber::fmt::layer())
    .init();
}
