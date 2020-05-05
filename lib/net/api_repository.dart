import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:travelflutter/home/model/strategy_model.dart';
import 'package:travelflutter/net/common_net_response.dart';

import 'api.dart';
import 'http_manager.dart';

class ApiRepository {
  static Future<NetResponse<StrategyModel>> getStrategyData(onError) async {
    var response =
        await HttpManager.instance.get(Api.GetStrategy, onError: onError);
//    if (response != null &&
//        response.statusCode == 200 &&
//        response.data is Map) {
//      return NetResponse<StrategyModel>(
//          200, '', StrategyModel.fromJson(response.data));
//    }
    return NetResponse(
        response.statusCode, response.statusMessage, StrategyModel.fromJson(response.data));
  }
}
