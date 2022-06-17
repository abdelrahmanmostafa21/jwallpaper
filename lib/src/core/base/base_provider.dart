import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/developer/index.dart';
import 'package:jwallpaper/src/core/base/view_state.dart';


abstract class BaseProvider extends ChangeNotifier with AppLogger {
  // Initial value will be loading always.
  ViewState state = const ViewState.idle();

  String _error = '';
  String get error => _error;

  String _message = '';
  String get message => _message;

  /// Changes the state of the views.
  /// Call this to notify the listeners
  void notifyState(ViewState newState) {
    state = newState;
    log.fine('State changed to $state');
    refresh();
  }

  void notifyLoading() {
    _error = '';
    notifyState(const ViewState.loading());
  }

  void notifyLoadingMore() {
    _error = '';
    notifyState(const ViewState.loadingMore());
  }

  void notifyError({String message = ''}) {
    _error = message;
    notifyState(const ViewState.error());
  }

  /// Shows this custom message on the screen
  void notifyCustomMessage(String value) {
    _error = '';
    _message = value;
    notifyState(ViewState.customMessage(value));
  }

  void refresh() => notifyListeners();
}
