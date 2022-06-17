// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/utils/services/index.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('NetworkErrorHandler');

/// Does nothing with the error except logging it.
///
/// Used when an error can just be ignored.
void silentErrorHandler(dynamic error, [StackTrace? stackTrace]) {
  _log.info('silently ignoring error', error, stackTrace);
}

/// Handles the [error] from a request.
///
/// An error message is shown in a [- AppMessage].
void apiErrorHandler(dynamic error, [StackTrace? stackTrace]) {
  _log.info('handling klliq error', error);

  String? message;

  if (error is Response) {
    // response error (status code != 2xx)

    switch (error.statusCode) {
      case 429:
        // rate limit reached
        final limitReset = _limitResetDuration(error);

        message = 'rate limit reached\n';
        message += limitReset != null
            ? 'please try again in ${prettyPrintDurationDifference(limitReset)}'
            : 'please try again later';

        break;
      default:
        _log.warning(
          'unhandled response exception\n'
          'request: ${error.requestOptions}\n'
          'statuscode: ${error.statusCode}\n'
          'body: ${error.data}',
        );
        break;
    }

    message ??= 'an unexpected error occurred (${error.statusCode})\n'
        'please try again later';
  } else if (error is DioError) {
    message = responseErrorMessage(
      error.response?.data ?? error.message,
    );
  } else if (error is TimeoutException) {
    message = 'request timeout, try again later';
  } else if (error is SocketException) {
    // no internet connection
    message = 'no internet connection, check your network first!';
  } else if (error is Error) {
    _log.warning('pexels api error not handled', error, stackTrace);
  } else if (error is Exception) {
    _log.warning('pexels api exception not handled', error, stackTrace);
  }

  message ??= 'unexpected error';

  di<MessageService>().show(message);
}

/// Gets the duration of how long the request is blocked due to being rate
/// limited from the pexels api.
Duration? _limitResetDuration(Response response) {
  try {
    final limitReset = int.parse(response.headers.value('x-rate-limit-reset')!);

    return DateTime.fromMillisecondsSinceEpoch(
      limitReset * 1000,
    ).difference(DateTime.now());
  } catch (e) {
    return null;
  }
}

/// Returns the error message of an error response or `null` if the error was
/// unable to be parsed.
///
String? responseErrorMessage(String body) {
  try {
    final Map<String, dynamic> decodedBody = jsonDecode(body);
    String? msg;
    if (decodedBody.containsKey('error_message') && decodedBody['error_message'] is String) {
      msg = decodedBody['error_message'];
    } else if (decodedBody.containsKey('errors') && decodedBody['errors'] is List<dynamic>) {
      msg = decodedBody['errors'][0]['message'];
    } else if (decodedBody.containsKey('error') && decodedBody['error'] is String) {
      msg = decodedBody['error'];
    }
    return msg;
  } catch (e, st) {
    _log.warning(
      'unable to parse error message from response body: $body',
      e,
      st,
    );
    return null;
  }
}


/// Pretty prints a duration difference as long as the difference is smaller
/// than an hour.
String prettyPrintDurationDifference(Duration difference) {
  final minutes = difference.inMinutes;
  final seconds = difference.inSeconds;

  if (minutes > 0) {
    final remainingSeconds = seconds - minutes * 60;
    final secondsString = remainingSeconds > 9 ? '$remainingSeconds' : '0$remainingSeconds';

    return '$minutes:$secondsString minutes';
  } else {
    return '$seconds seconds';
  }
}
