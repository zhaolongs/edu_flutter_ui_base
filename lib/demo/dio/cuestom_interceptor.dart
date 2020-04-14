

import 'package:dio/dio.dart';

class CuestomInterceptor extends InterceptorsWrapper{
  ///拦截 发送的信息
  @override
  Future onRequest(RequestOptions options) {
    
    print("请求链接是 ${options.path}");
    print("请求方法是 ${options.method}");

    if(options.method=="GET") {
      print("请求参数是 ${options.queryParameters.toString()}");
    }else{
      print("请求参数是 ${options.data.toString()}");
    }
    print("请求Content-typ 是 ${options.contentType}");

    
    return super.onRequest(options);
  }
  ///拦截 响应的信息
  @override
  Future onResponse(Response response) {

    return super.onResponse(response);
  }
  ///拦截错误的信息
   @override
  Future onError(DioError err) {
    return super.onError(err);
  }
}