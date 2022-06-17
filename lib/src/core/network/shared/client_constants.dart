part of '../client/abstract_app_client.dart';

/// A function used to transform the response.
///
/// To prevent large computations from blocking the thread, response bodies are
/// decoded in an isolate by default.
typedef TransformResponse<T> = FutureOr<T> Function(Response response);

/// Callback to listen the progress for sending/receiving data.
///
/// [count] is the length of the bytes have been sent/received.
///
/// [total] is the content length of the response/request body.
/// 1.When receiving data:
///   [total] is the request body length.
/// 2.When receiving data:
///   [total] will be -1 if the size of the response body is not known in advance,
///   for example: response data is compressed with gzip or no content-length header.
typedef ApiProgressCallback = void Function(int count, int total);

///You have to send an extra header parameter with the app key
///this like the consumer authorization key is static from your provider [Authorization].
const String authHeader = 'Authorization';

//DEFAULT API CLIENT VALUES
const String defaultContentType = 'application/json';
const int defaultConnectTimeout = kReleaseMode ? 10000 : 100000;
const int defaultSendTimeout = 15000;
const int defaultReceiveTimeout = 15000;

