import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jwallpaper/src/core/network/index.dart';

part '../shared/client_constants.dart';

/// An abstraction to make http calls to the KLLIQ API used by the
/// services.
///
/// Implemented by [-AppClient].
abstract class AbstractAppClient {
  const AbstractAppClient();

  Future<Response> request(
    String endPoint, {
    Options? options,
    dynamic data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    ClientMethods method = ClientMethods.GET,
    CancelToken? cancelToken,
    ApiProgressCallback? sendProgress,
    ApiProgressCallback? recieveProgress,
  });

  void updateHeaders({Map<String, String>? headers});
}
