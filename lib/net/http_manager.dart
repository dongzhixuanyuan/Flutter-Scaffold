import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'api.dart';
import 'mock_adapter.dart';

class HttpManager {
  static HttpManager instance = new HttpManager();
  Dio dio;
  static Map<String,dynamic> commonParams;

  HttpManager(){
    var baseUrl = Api.BaseUrl;

    BaseOptions baseOptions = new BaseOptions(
      //连接服务器超时时间
      connectTimeout: 10000,
      //响应流前后两次接收数据的间隔
      receiveTimeout: 5000,
      baseUrl: baseUrl,
    );
    dio = new Dio(baseOptions);
    //添加cookie管理，暂时使用默认的 DefaultCookieJar
    dio.interceptors..add(CookieManager(CookieJar()));
    //TODO  common参数拦截器； dns重连拦截器

    //添加debug模式下请求log
    dio.interceptors.add(LogInterceptor());

      dio.httpClientAdapter = MockAdapter();

  }

  /// get
  /// [urlOrPath] 请求url或者传入path（见Api.BASE_URL）
  /// [queryParametersData] 可选，请求参数；见dio包 queryParameters
  /// [options]可选，可修改http选项；见dio包Options
  /// [cancelToken]可选，用于取消当前请求；注意：一个cancelToken可以用于多个请求；
  /// 见dio 包cancelToken
  /// [onError] 可选，错误回调方法
  ///
  Future<Response> get(urlOrPath, {queryParametersData, options, cancelToken, void onError(DioError e)}) async {
    Response response;
    try {
      response = await dio.get(urlOrPath,
          queryParameters: queryParametersData, options: options, cancelToken: cancelToken);
    } on DioError catch (e) {
      if (onError != null) {
        onError(e);
      }
    }
    if(response != null && response.data is DioError) {
      if (onError != null) {
        onError(response.data);
      }
    }
    return response;
  }

  /// post
  /// [urlOrPath] 请求url或者传入path（见Api.BASE_URL）
  /// [queryParametersData] 可选，请求参数；见dio包 queryParameters
  /// [options]可选，可修改http选项；见dio包Options
  /// [cancelToken]可选，用于取消当前请求；注意：一个cancelToken可以用于多个请求；
  /// 见dio 包cancelToken
  /// [onError] 可选，错误回调方法
  ///
  Future<Response> post(urlOrPath, {data,queryParametersData, options, cancelToken, void onError(DioError e)}) async {
    Response response;
    try {
      response = await dio.post(urlOrPath,data: data,
          queryParameters: queryParametersData, options: options, cancelToken: cancelToken);
    } on DioError catch (e) {
      if (onError != null) {
        onError(e);
      }
    }
    if(response.data is DioError) {
      if(onError != null){
        onError(response.data);
      }
    }
    return response;
  }



}