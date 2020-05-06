import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:travelflutter/home/model/strategy_model.dart';
import 'package:travelflutter/home_detail/bloc/comment_model.dart';
import 'package:travelflutter/net/common_net_response.dart';
import 'package:travelflutter/tickets/flight_ticket_model.dart';
import 'package:travelflutter/tickets/train_ticket_model.dart';
import 'package:travelflutter/user/user_model.dart';

import 'api.dart';
import 'http_manager.dart';

//每个get请求之前，需要先进行一次post请求。
class ApiRepository {
  static Future<NetResponse<StrategyModel>> getStrategyData(onError) async {
    var prePost =
        await HttpManager.instance.post(Api.SetStrategy, onError: onError);
    var response =
        await HttpManager.instance.get(Api.GetStrategy, onError: onError);
    return NetResponse(
        response, (response) => StrategyModel.fromJson(response.data));
  }

  static Future<NetResponse<bool>> register(
      String userName, String password, String phoneNum, onError) async {
    var response = await HttpManager.instance.post(Api.SetRegister,
        data: {'username': userName, 'password': password, 'phone': phoneNum},
        options: Options(contentType: Headers.formUrlEncodedContentType),
        onError: onError);
    bool success = response.statusCode == 200;
    return NetResponse(response, (response) => success);
  }

  static Future<bool> loginPost(String userName, String password) async {
    var prePost = await HttpManager.instance.post(Api.SetLogin,
        data: {'username': userName, 'password': password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
    return prePost.statusCode == 200;
  }

  static Future<NetResponse<UserModel>> login(
      String userName, String password, onError) async {
    var response = await HttpManager.instance.get(Api.GetLogin);
    debugPrint("${response.statusCode},${response.data.toString()}");
    return NetResponse(
        response, (response) => UserModel.fromJson(response.data));
  }

//  修改密码接口
  static Future<NetResponse<bool>> updatePassword(
      String userName, String password, onError) async {
    var response = await HttpManager.instance.get(Api.UpdatePassword);
    debugPrint("${response.statusCode},${response.data.toString()}");
    bool success = response.statusCode == 200;
    return NetResponse(
        response, (response) => success);
  }



  //获取评论
  static Future<NetResponse<CommentModel>> getComments() async {
    var prePost = await HttpManager.instance.post(Api.SetEvaluate);
    var response = await HttpManager.instance.post(Api.GetEvaluate);
    if (response.statusCode != 200) {
      return null;
    }
    return NetResponse(
        response, (response) => CommentModel.fromJson(response.data));
  }

  //获取火车票
  static Future<NetResponse<TrainTicketModel>> getTrainTickets() async {
    var prePost = await HttpManager.instance.post(Api.SetTrain);
    var response = await HttpManager.instance.post(Api.GetTrain);
    if (response.statusCode != 200) {
      return null;
    }
    return NetResponse(
        response, (response) => TrainTicketModel.fromJson(response.data));
  }

  //获取飞机票
  static Future<NetResponse<FlightTicketModel>> getFlightTickets() async {
    var prePost = await HttpManager.instance.post(Api.SetFlight);
    var response = await HttpManager.instance.post(Api.GetFlight);
    if (response.statusCode != 200) {
      return null;
    }
    return NetResponse(
        response, (response) => FlightTicketModel.fromJson(response.data));
  }
}
