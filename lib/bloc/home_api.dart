import 'dart:convert';

import 'package:backb/core/api.dart';
import 'package:backb/core/constant.dart';
import 'package:backb/model.dart';

abstract class HomeRespo {
  Future<HomeModel> getHome();
}

class HomeApi implements HomeRespo {
  @override
  Future<HomeModel> getHome() async {
  
    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxNzI2MDU0OTI1ZTM0MmE0ZDBkMzM4MiIsImlhdCI6MTYzNjY5NDM1OSwiZXhwIjoxNjM5Mjg2MzU5fQ.H9ONRkJkCs6New0OxtXtjKodJuvdaBnui-BtQ45f1Rs";
    print(token);
    var header = {
      "Content-Type": "application/json;charset=UTF-8",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      final res = await Api()
          .request(url: Url.home, header: header, type: RequestType.Get);
      return Future.value(HomeModel.fromJson(json.decode(res)));
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
