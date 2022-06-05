import 'dart:async';

import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34",
        receiveDataWhenStatusError: true,
        headers: {"Content-Type": "application/json"}));
  }

  static Future<Response> getData() async {
    dio.options.headers = {"Content-Type": "application/json"};

    return await dio.get("");
  }


}
