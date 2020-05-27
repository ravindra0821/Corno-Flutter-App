import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        if (statusCode == 200) {
          final jsonResponse = json.decode(response.body);

          //YOUR API RESPONSE
        } else {
          throw new Exception("Error while fetching data");
        }
      }
    }).catchError((dynamic res) {
      print(res.toString());
    });
  }

  Future<dynamic> post(String url, {Map headers, body, encoding}) {
    encoding = jsonEncode("");
    print(headers);
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode == 200) {
        //YOUR API RESPONSE
        final jsonResponse = json.decode(response.body);

      } else {
        throw new Exception("Error while fetching data");
      }
    }).catchError((dynamic res) {
      print(res.toString());
      return res;
    });
  }
}
