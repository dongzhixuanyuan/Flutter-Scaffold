import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:travelflutter/home/model/strategy_model.dart';
import 'package:travelflutter/home_detail/bloc/comment_model.dart';
import 'package:travelflutter/net/common_net_response.dart';
import 'package:travelflutter/tickets/flight_ticket_model.dart';
import 'package:travelflutter/tickets/train_ticket_model.dart';

import 'api.dart';
import 'http_manager.dart';

//每个get请求之前，需要先进行一次post请求。
class ApiRepository {
  static Future<NetResponse<StrategyModel>> getStrategyData(onError) async {
    var prePost =
        await HttpManager.instance.post(Api.SetStrategy, onError: onError);
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

  static Future<bool> login(String userName, String password, onError) async {
    var response = await HttpManager.instance.post(Api.SetLogin,
        data: {'username': userName, 'password': password}, onError: onError);

    debugPrint("${response.statusCode},${response.data.toString()}");

    if (response.statusCode == 200 && response.data is Map) {
      return (response.data as Map).isNotEmpty;
    }
    return false;
  }

  //获取评论
  static Future<CommentModel> getComments() async {
    var prePost = await HttpManager.instance.post(Api.SetEvaluate);
    var response = await HttpManager.instance.post(Api.GetEvaluate);
    if (response.statusCode != 200) {
      return null;
    }
    return CommentModel.fromJson(response.data);
  }

  //获取火车票
  static Future<TrainTicketModel> getTrainTickets() async {
    var prePost = await HttpManager.instance.post(Api.SetTrain);
    var response = await HttpManager.instance.post(Api.GetTrain);
    if (response.statusCode != 200) {
      return null;
    }
    return TrainTicketModel.fromJson(response.data);
  }

  //获取飞机票
  static Future<FlightTicketModel> getFlightTickets() async {
    var prePost = await HttpManager.instance.post(Api.SetFlight);
    var response = await HttpManager.instance.post(Api.GetFlight);
    if (response.statusCode != 200) {
      return null;
    }
    return FlightTicketModel.fromJson(response.data);
  }



}
