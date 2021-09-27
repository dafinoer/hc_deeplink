



import 'package:dio/dio.dart';

import 'interceptor_dio.dart';

class DioSetup {
  final Dio _dio;

  DioSetup._(this._dio);

  factory DioSetup.create(){
    final dio = Dio();
    dio.options.baseUrl = 'https://hacker-news.firebaseio.com/v0';
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 5000;
    dio.interceptors.add(InterceptorDio.create());

   return DioSetup._(dio);
  }

  Dio get dio => this._dio;
}
