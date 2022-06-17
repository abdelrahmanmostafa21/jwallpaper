import 'dart:convert';

///**************************Parsing Helper**************************

Map<String, dynamic>? decodeJson(String body) {
  try {
    final jsonBody = json.decode(body);
    return jsonBody;
  } catch (error) {
    return null;
  }
}

String? encodeJson(dynamic body) {
  try {
    final jsonBody = json.encode(body);
    return jsonBody;
  } catch (error) {
    return null;
  }
}


String? forceString(dynamic value) => value.toString();
