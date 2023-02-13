import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Arduino IoT Cloud Group Code

class ArduinoIoTCloudGroup {
  static String baseUrl = 'https://api2.arduino.cc/iot/v2/';
  static Map<String, String> headers = {};
  static CallThingsCall callThingsCall = CallThingsCall();
  static ShowThingCall showThingCall = ShowThingCall();
  static TurnOnCall turnOnCall = TurnOnCall();
  static TurnOffCall turnOffCall = TurnOffCall();
  static UpdateValueCall updateValueCall = UpdateValueCall();
  static CallDevicesCall callDevicesCall = CallDevicesCall();
}

class CallThingsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Call Things',
      apiUrl: '${ArduinoIoTCloudGroup.baseUrl}things',
      callType: ApiCallType.GET,
      headers: {
        ...ArduinoIoTCloudGroup.headers,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ShowThingCall {
  Future<ApiCallResponse> call({
    String? thingId = '',
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Show Thing',
      apiUrl:
          '${ArduinoIoTCloudGroup.baseUrl}things/${thingId}/properties?show_deleted=false',
      callType: ApiCallType.GET,
      headers: {
        ...ArduinoIoTCloudGroup.headers,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TurnOnCall {
  Future<ApiCallResponse> call({
    String? propertyId = '',
    String? authToken = '',
    String? thingId = '',
  }) {
    final body = '''
{
  "id": "${propertyId}",
  "value": true,
  "thing_id": "${thingId}",
  "update_strategy": "ON_CHANGE",
  "type": "STATUS"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Turn On',
      apiUrl:
          '${ArduinoIoTCloudGroup.baseUrl}things/${thingId}/properties/${propertyId}/publish',
      callType: ApiCallType.PUT,
      headers: {
        ...ArduinoIoTCloudGroup.headers,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TurnOffCall {
  Future<ApiCallResponse> call({
    String? thingId = '',
    String? propertyId = '',
    String? authToken = '',
  }) {
    final body = '''
{
  "id": "${propertyId}",
  "value": false,
  "thing_id": "${thingId}",
  "update_strategy": "ON_CHANGE",
  "type": "STATUS"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Turn Off',
      apiUrl:
          '${ArduinoIoTCloudGroup.baseUrl}things/${thingId}/properties/${propertyId}/publish',
      callType: ApiCallType.PUT,
      headers: {
        ...ArduinoIoTCloudGroup.headers,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateValueCall {
  Future<ApiCallResponse> call({
    String? thingId = '',
    String? propertyId = '',
    String? authToken = '',
    int? newValue,
  }) {
    final body = '''
{
  "id": "${propertyId}",
  "value": ${newValue},
  "thing_id": "${thingId}",
  "update_strategy": "ON_CHANGE",
  "type": "INT"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Value',
      apiUrl:
          '${ArduinoIoTCloudGroup.baseUrl}things/${thingId}/properties/${propertyId}/publish',
      callType: ApiCallType.PUT,
      headers: {
        ...ArduinoIoTCloudGroup.headers,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CallDevicesCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? deviceId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Call Devices',
      apiUrl: '${ArduinoIoTCloudGroup.baseUrl}devices/${deviceId}',
      callType: ApiCallType.GET,
      headers: {
        ...ArduinoIoTCloudGroup.headers,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic thingpropertyname(dynamic response) => getJsonField(
        response,
        r'''$[:].thing.properties[:].name''',
        true,
      );
  dynamic thingraw(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      );
}

/// End Arduino IoT Cloud Group Code

/// Start Simbase API Group Code

class SimbaseAPIGroup {
  static String baseUrl = 'https://api.simbase.com';
  static Map<String, String> headers = {};
  static SendSMSCall sendSMSCall = SendSMSCall();
  static GetSMSCall getSMSCall = GetSMSCall();
}

class SendSMSCall {
  Future<ApiCallResponse> call({
    String? iccId = '',
    String? message = '',
    String? apiKey = '',
  }) {
    final body = '''
{"message":"${message}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send SMS',
      apiUrl: '${SimbaseAPIGroup.baseUrl}/simcards/${iccId}/sms',
      callType: ApiCallType.POST,
      headers: {
        ...SimbaseAPIGroup.headers,
        'x-api-key': '${apiKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetSMSCall {
  Future<ApiCallResponse> call({
    String? iccId = '',
    String? apiKey = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get SMS',
      apiUrl: '${SimbaseAPIGroup.baseUrl}/simcards/${iccId}/sms',
      callType: ApiCallType.GET,
      headers: {
        ...SimbaseAPIGroup.headers,
        'x-api-key': '${apiKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Simbase API Group Code

class GetTokenCall {
  static Future<ApiCallResponse> call({
    String? clientSecret = '',
    String? clientId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Token',
      apiUrl: 'https://api2.arduino.cc/iot/v1/clients/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'grant_type': "client_credentials",
        'audience': "https://api2.arduino.cc/iot",
        'client_id': clientId,
        'client_secret': clientSecret,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
