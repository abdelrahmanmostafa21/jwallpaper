import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/developer/index.dart';

class AppGuard with AppLogger {
  AppGuard({
    required Widget child,
  }) {
    if (kReleaseMode) {
      // override the error widget in release mode (the red error screen)
      ErrorWidget.builder = (details) => const SizedBox();
    }
    FlutterError.onError = _handleFlutterError;
    runZonedGuarded(() => _initalizeApp(child), _handleError);
  }

  Future<void> _initalizeApp(Widget child) async => runApp(child);

  /// Handles errors caught by the Flutter framework.
  ///
  /// Forwards the error to the [_handleError] handler when in release mode.
  /// Prints it to the console otherwise.
  Future<void> _handleFlutterError(FlutterErrorDetails details) async {
    log.severe('Caught flutter error');
    if (kReleaseMode) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    } else {
      FlutterError.dumpErrorToConsole(details);
    }
  }

  Future<void> _handleError(Object error, StackTrace stackTrace) async {
    if (error is SocketException) {
      // no internet connection, can be ignored
      log.warning('ignoring internet connection error $error');
      return;
    }
    log.severe('Caught Error', error, stackTrace);
    //TODO:- This Demo Version of error handler 
    if (kReleaseMode) {
      log.info('Reporting Error To any LOGS SDK ex: Sentry https://sentry.io/');
      try {
        log.fine('Error Reported Successfully');
      } catch (e, st) {
        log.warning('Error While Reporting Error', e, st);
      }
    } else {
      log.info('Not Reporting error in debug / profile mode');
    }
  }
}
