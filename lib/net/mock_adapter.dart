import 'dart:convert';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'api.dart';


class MockAdapter extends HttpClientAdapter {
  static const String mockHost = "mockserver";
  static const String mockBase = "http://$mockHost/";
  DefaultHttpClientAdapter _adapter = DefaultHttpClientAdapter();

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<List<int>> requestStream, Future cancelFuture) async {
    Uri uri = options.uri;
    if (uri.host == mockHost) {
      switch (uri.path) {
        default:
          return ResponseBody.fromString("", 404);
      }
    }
    return _adapter.fetch(options, requestStream, cancelFuture);
  }


  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}