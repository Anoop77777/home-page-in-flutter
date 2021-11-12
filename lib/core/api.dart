import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './constant.dart';

class Api {
  ///url: string url end point \n
  ///type: request type \n
  ///body: body to passed to request
  ///header: defaults to {"Content-Type": "application/json;charset=UTF-8"}
  Future<dynamic> request({
    @required String url,
    RequestType type = RequestType.Get,
    Map<String, dynamic> body = const {},
    Map<String, String> header = const {
      "Content-Type": "application/json;charset=UTF-8"
    },
  }) async {
    print(url);
    http.Response response;
    switch (type) {
      case RequestType.Get:
        print(Uri.parse(Url.server + url));
        response = await http.get(Uri.parse(Url.server + url), headers: header);

        break;
      case RequestType.Post:
        response = await http.post(Uri.parse(Url.server + url),
            body: jsonEncode(body), headers: header);
        break;
      default:
    }
    if (response.statusCode == 200 || response.statusCode == 401)
      return response.body;
    if (response.statusCode == 404)
      return {"error": "404", "message": response.reasonPhrase};
  }
}
