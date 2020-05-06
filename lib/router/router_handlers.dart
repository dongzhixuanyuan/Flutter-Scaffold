// @(#)router_handlers.dart, 2020-04-28.
//
// Copyright 2020 Youdao, Inc. All rights reserved.
// YOUDAO PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/home/home_page.dart';
import 'package:travelflutter/home_detail/bloc/home_detail_page.dart';
import 'package:travelflutter/login/login_page.dart';
import 'package:travelflutter/login/modify_password.dart';
import 'package:travelflutter/login/register_page.dart';
import 'package:travelflutter/main_page.dart';
import 'package:travelflutter/splash_page.dart';
import 'package:travelflutter/user/user_info.dart';


void initScreenUtil(BuildContext context) {
  ScreenUtil.init(context,
      width: 375, height: 670, allowFontScaling: false); //根据UI稿件设置屏幕基准
}


var splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      initScreenUtil(context);
      return SplashPage();
    });

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      initScreenUtil(context);
      return LoginPage();
    });

var registerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      initScreenUtil(context);
      return RegisterPage();
    });

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      initScreenUtil(context);
      return HomePage();
    });

var mainHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      initScreenUtil(context);
      return MainPage();
    });

var userInfoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      initScreenUtil(context);
      return UserInfoPage();
    });

var detailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      initScreenUtil(context);
      return StrategyDetailPage(params['data']?.first);
    });

var modifyPasswordHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      initScreenUtil(context);
      return ModifyPasswordPage();
    });