import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref){
  final dio = Dio();

  dio.interceptors.add(CustomInterceptor());
  return dio;
});


class CustomInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('[REQ] [${options.method}] [${options.uri}]');
    return super.onRequest(options, handler);
  }


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('[REQ] [${response.requestOptions.method}] [${response.requestOptions.uri}]');

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('[ERR] [${err.requestOptions.method}] [${err.requestOptions.uri}]');
    return super.onError(err, handler);
  }


}