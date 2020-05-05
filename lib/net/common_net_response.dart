import 'package:dio/dio.dart';

class NetResponse<T> {
  static const ERROR_CODE = -1;
  int code;
  String msg;
  T data;
  final Response response;

  // ignore: non_constant_identifier_names
  NetResponse(this.response, T block(Response))
      : code = response.statusCode,
        msg = response.statusMessage,
        data = block(response);
}
