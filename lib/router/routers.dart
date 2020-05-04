// @(#)routers.dart, 2020-04-28.
//
// Copyright 2020 Youdao, Inc. All rights reserved.
// YOUDAO PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.

import 'package:fluro/fluro.dart';
import 'package:travelflutter/router/router_handlers.dart';


class TravelRouter {

  static const String login = "/login";
  static const String root = "/";
  static const String home = "/home";
  static const String main = "/main";
  static const String user = "/user";


  static void configureRoutes(Router router) {
    router.define(login, handler: loginHandler);
    router.define(root, handler: mainHandler);
    router.define(home, handler: homeHandler);
    router.define(main, handler: mainHandler);
    router.define(user, handler: userInfoHandler);
  }
}