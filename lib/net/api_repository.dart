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
    return NetResponse(response.statusCode, response.statusMessage,
        StrategyModel.fromJson(response.data));
  }

  static Future<bool> register(
      String userName, String password, String phoneNum, onError) async {
    var response = await HttpManager.instance.post(Api.SetRegister,
        data: {'username': userName, 'password': password, 'phone': phoneNum},
        onError: onError);
    return response.statusCode == 200;
  }
}
