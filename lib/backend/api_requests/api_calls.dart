import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start CityDashboard Group Code

class CityDashboardGroup {
  static String getBaseUrl() => 'https://city-dashboard-backend.fly.dev/api';
  static Map<String, String> headers = {
    'Authorization': 'Token 8cef8d0a02fc8e9befc44c97f985c478ae44fc94',
  };
  static FindBuildingCall findBuildingCall = FindBuildingCall();
}

class FindBuildingCall {
  Future<ApiCallResponse> call({
    double? lat,
    double? lon,
  }) async {
    final baseUrl = CityDashboardGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'FindBuilding',
      apiUrl: '${baseUrl}/find-building',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Token 8cef8d0a02fc8e9befc44c97f985c478ae44fc94',
      },
      params: {
        'lat': lat,
        'lon': lon,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? coordinates(dynamic response) => getJsonField(
        response,
        r'''$.geometry.coordinates''',
        true,
      ) as List?;
  String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.street''',
      ));
}

/// End CityDashboard Group Code

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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
