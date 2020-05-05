// @(#)routers.dart, 2020-04-28.
//
// Copyright 2020 Youdao, Inc. All rights reserved.
// YOUDAO PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.

import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:travelflutter/application.dart';
import 'package:travelflutter/router/router_handlers.dart';

class TravelRouter {
  static const String login = "/login";
  static const String root = "/";
  static const String home = "/home";
  static const String main = "/main";
  static const String user = "/user";
  static const String detail = "/detail";
  static const String register = "/register";

  static void configureRoutes(Router router) {
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
    router.define(root, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(main, handler: mainHandler);
    router.define(user, handler: userInfoHandler);
    router.define(detail, handler: detailHandler);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      TransitionType transition = TransitionType.native}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');

    path = path + query;
    return Application.router.navigateTo(context, path, transition: transition);
  }
}
