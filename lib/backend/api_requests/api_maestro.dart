import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';


class APIRENIEC {
  static Future<ApiCallResponse> call({
    String? dni = '',
}) async {
    final ffApiRequestBody = '''
{
  "dato": {
    "tipodocumento": 0,
    "numerodocumento": "$dni",
    "appid": "SISMON"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'API Reniec',
      //apiUrl: 'https://calidad.ngrok.io/maestroback/api/persona/v1/consulta-tipo-documento',
      apiUrl: 'https://calidad.pronied.gob.pe/maestroback/api/persona/v1/consulta-tipo-documento',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? mensaje(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.mensaje''',
  ));
  static String? tipodocumento(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.tipodocumento''',
  ));
  static String? numerodocumento(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.numerodocumento''',
  ));
  static String? nombres(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.nombres''',
  ));
  static String? apellidopaterno(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.apellidopaterno''',
  ));
  static String? apellidomaterno(dynamic response) => castToType<String>(getJsonField(
    response,
    r'''$.dato.apellidomaterno''',
  ));
  static int? estado(dynamic response) => castToType<int>(getJsonField(
    response,
    r'''$.estado''',
  ));
}


class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
