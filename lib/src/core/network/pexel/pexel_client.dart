import 'dart:async';

import 'package:dio/dio.dart';
import 'package:jwallpaper/src/config/constants/env.dart';
import 'package:jwallpaper/src/core/network/index.dart';

class PexelsClient extends AbstractAppClient {
  PexelsClient()
      : assert(
          AppEnv.baseUrl.isNotEmpty && AppEnv.apiKey.isNotEmpty,
          'Pexels Client:- Missing baseUrl or apiKey.. please check constants/env file to add your missing data',
        ) {
    _initialize();
  }

  late Dio client;

  void _initialize() {
    client = Dio();
    _setOptions();
    _setInterceptors();
  }

  ///dio client [Options]
  void _setOptions() => client.options = BaseOptions(
        baseUrl: AppEnv.baseUrl,
        contentType: defaultContentType,
        connectTimeout: defaultConnectTimeout,
        sendTimeout: defaultSendTimeout,
        receiveTimeout: defaultReceiveTimeout,
        headers: _authorizationHeader,
      );

  ///base authorization api header key
  Map<String, String> get _authorizationHeader => {authHeader: AppEnv.apiKey};

  //interceptors are used to modify the request and response
  void _setInterceptors() => client.interceptors.addAll(_interceptors);
  List<Interceptor> get _interceptors => [
        if (AppEnv.debugMode)
          LogInterceptor(responseBody: true, requestBody: true)
        else
          Interceptor()
      ];

  /// Update headers for all requests
  @override
  void updateHeaders({Map<String, String>? headers}) {
    if (headers == null) {
      return;
    }
    client.options.headers.addAll(headers);
  }

  @override
  Future<Response> request(
    String endPoint, {
    Options? options,
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
    ClientMethods method = ClientMethods.GET,
    CancelToken? cancelToken,
    ApiProgressCallback? sendProgress,
    ApiProgressCallback? recieveProgress,
  }) {
    options ??= Options();
    options
      ..method = method.name.toLowerCase()
      ..headers = headers;
    return client.request<String>(
      endPoint,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: sendProgress,
      onReceiveProgress: recieveProgress,
    );
  }
}
