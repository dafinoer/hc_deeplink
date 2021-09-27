



import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hc_deeplink/injector.dart';

class InterceptorDio implements Interceptor {

  const InterceptorDio();

  factory InterceptorDio.create() => const InterceptorDio();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(options.toString());
    final queryParams = {'print': 'pretty'};
    options.copyWith(queryParameters: queryParams);
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(response.data.toString());
    return handler.next(response);
  }


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(err.stackTrace.toString());
    return handler.next(err);
  }

}