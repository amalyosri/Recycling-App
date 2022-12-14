import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
// headers: {

// }
    ));
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
    String lang = "ar",
    String? token,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      "Content-Type": "application/json"
    };
    return await dio.get(path, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    String lang = "ar",
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      "Content-Type": "application/json"
    };
    return dio.post(url, queryParameters: query, data: data);
  }
}
