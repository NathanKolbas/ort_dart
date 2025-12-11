library;

export 'src/api/session.dart';
export 'src/api/tensor.dart' hide tensorFromImpl;
export 'src/api/execution_providers/execution_providers.dart';

export 'src/rust/api/session/builder/impl_options.dart';
export 'src/rust/api/logging.dart' hide ortDebugMessages;

import 'package:flutter/foundation.dart';
import 'package:ort/src/rust/api/logging.dart';

import 'src/rust/frb_generated.dart' show RustLib;

/// Options for initializing Ort.
class OrtInitializationOptions {
  /// Enables ORT debug messages. Defaults to enabled when [kDebugMode] is true.
  final bool? showDebugMessages;

  /// The level of debug information you would like to receive when
  /// [showDebugMessages] is true.
  final OrtDebugLevel? ortDebugLevel;

  const OrtInitializationOptions({
    this.showDebugMessages,
    this.ortDebugLevel,
  });
}

class Ort {
  static final Ort _instance = Ort._internal();

  factory Ort() => _instance;

  Ort._internal();

  bool _initialized = false;

  /// If Ort is initialized. Typically you don't need this and can
  /// just call [ensureInitialized] directly without checking if initialized
  /// prior.
  static bool get initialized => Ort._instance._initialized;

  /// Make sure Ort is initialized.
  ///
  /// If [throwOnFail] is set to true then an exception will be thrown if
  /// initialization fails. By default this is false.
  ///
  /// Returns [bool] whether or not initialization was successful. If
  /// [throwOnFail] is true then you must catch the error.
  static Future<bool> ensureInitialized({
    bool throwOnFail = false,
    OrtInitializationOptions options = const OrtInitializationOptions(),
  }) async {
    if (Ort._instance._initialized) return true;

    try {
      await RustLib.init();

      final showDebugMessages = options.showDebugMessages;
      if (showDebugMessages == true || (showDebugMessages == null && kDebugMode)) {
        ortDebug(options.ortDebugLevel);
      }

      Ort._instance._initialized = true;
      return Ort._instance._initialized;
    } catch (_) {
      if (throwOnFail) {
        rethrow;
      }
    }

    return Ort._instance._initialized;
  }

  /// Enables/adjust ORT debug messages. Defaults to enabled when [kDebugMode]
  /// is true. You can also adjust this in [ensureInitialized].
  static ortDebug([OrtDebugLevel? level]) {
    ortDebugMessages(level: level);
  }
}
