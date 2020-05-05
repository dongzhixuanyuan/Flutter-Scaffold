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
  test("get question article mock data", () async {

    onError(DioError dioError){
      print(dioError);
      throwsA(isStateError);
    }
    var data = await ApiRepository.getStrategyData(onError);
    assert (data.code == 200);
  });

  test("register", () async {

    onError(DioError dioError){
      print(dioError);
      throwsA(isStateError);
    }
    var data = await ApiRepository.register('liudong','123','18937894567',onError);
    assert (data);
  });




}
