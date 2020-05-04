// @(#)router_handlers.dart, 2020-04-28.
//
// Copyright 2020 Youdao, Inc. All rights reserved.
// YOUDAO PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/login/login_page.dart';


void initScreenUtil(BuildContext context) {
  ScreenUtil.init(context,
      width: 375, height: 670, allowFontScaling: false); //根据UI稿件设置屏幕基准
}

var loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  initScreenUtil(context);
  return LoginPage();
});

//var infoListHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
//  initScreenUtil(context);
//
//});