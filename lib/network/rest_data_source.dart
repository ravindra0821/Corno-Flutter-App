import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';


//Same as Delegate
abstract class ApiResponse {
  void onSuccess(dynamic response, String eventType);

  void onError(String errorTxt);
}

class RestDatasource {
  ApiResponse apiResponse;

  RestDatasource(this.apiResponse);

  String HEADER_VERSION_KEY = "version";
  String HEADER_CONTENT_TYPE_KEY = "Content-Type";
  String HEADER_DEVICE_TYPE_KEY = "device_type";
  String HEADER_DEVICE_TOKEN_KEY = "device_token";
  String HEADER_AUTH_TOKEN_KEY = "Authorization";
  String HEADER_TIME_KEY = "current_time";

  String HEADER_VERSION_VALUE = "1.0.0";
  String HEADER_CONTENT_TYPE_VALUE = "application/json";
  String HEADER_DEVICE_TYPE_VALUE = "Android";
  String HEADER_DEVICE_TOKEN_VALUE = "";
  String HEADER_AUTH_TOKEN_VALUE = "";
  String HEADER_TIME_VALUE = "";

  static String LATEST_CASES_API = "https://api.rootnet.in/covid19-in/stats/latest"; //  Client  Url


  Future<dynamic> apiForGet(String url, String eventType) async {
/*    SharedPreferences.getInstance().then((SharedPreferences sp) {
      HEADER_AUTH_TOKEN_VALUE = sp.getString(GlobalUtil.AuthKey);
      HEADER_DEVICE_TOKEN_VALUE = sp.getString(GlobalUtil.DeviceId);
    });*/
    HEADER_TIME_VALUE =
        new DateTime.now().toUtc().millisecondsSinceEpoch.toString();

    final response = await http.get(url, headers: {
      HEADER_CONTENT_TYPE_KEY: HEADER_CONTENT_TYPE_VALUE,
      HEADER_VERSION_KEY: HEADER_VERSION_VALUE,
      HEADER_DEVICE_TYPE_KEY: HEADER_DEVICE_TYPE_VALUE,
      HEADER_DEVICE_TOKEN_KEY: HEADER_DEVICE_TOKEN_VALUE,
      HEADER_AUTH_TOKEN_KEY: HEADER_AUTH_TOKEN_VALUE,
      HEADER_TIME_KEY: HEADER_TIME_VALUE
    });

    if (response.statusCode == 200) {
      debugPrint(eventType + "========" + HEADER_DEVICE_TOKEN_VALUE);
      debugPrint(eventType + "========" + response.body);
      apiResponse.onSuccess(response.body, eventType);
    } else {
      apiResponse.onError(StringConst.SOMETHING_WENT_WRONG);
      throw Exception('Failed to load post');
    }
    return response;
  }

}
