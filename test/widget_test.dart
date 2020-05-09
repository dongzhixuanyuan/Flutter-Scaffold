// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:travelflutter/net/api_repository.dart';

void main() {
  onError(DioError dioError) {
    print(dioError);
    throwsA(isStateError);
  }


  test("get avartar iamge ", () async {
    var data = await ApiRepository.getAvartarImage('wer');

//    assert(data.code == 200);
  });

  return;


  test("get question article mock data", () async {
    var data = await ApiRepository.getStrategyData(onError);
    assert(data.code == 200);
  });

  test("register", () async {
    var data =
        await ApiRepository.register('liudong', '123', '18937894567', onError);
    assert(data.data);
  });

  test("login", () async {
    var data = await ApiRepository.login('liudong', '123', onError);
    assert(data.data.result.stat == '1');
  });

  test("getComments", () async {
    var data = await ApiRepository.getComments();
    assert(data.data.result.stat == '1');
  });

  test("addComments", () async {
    var data = await ApiRepository.addComments('liudong', 'image', "非常好", "张家界");
    assert(data.data);
  });
  test("getTrainTickets", () async {
    var data = await ApiRepository.getTrainTickets();
    assert(data.data.result.stat == '1');
  });
  test("getFlightTickets", () async {
    var data = await ApiRepository.getFlightTickets();
    assert(data.data.result.stat == '1');
  });

  test("getOrders", () async {
    var data = await ApiRepository.getOrders('wer');
    assert(data.data !=null);
  });
}
