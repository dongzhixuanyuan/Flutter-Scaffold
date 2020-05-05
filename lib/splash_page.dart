import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelflutter/application.dart';
import 'package:travelflutter/common/shared_preference_key.dart';
import 'package:travelflutter/router/routers.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 700), () {
      Application.sharedPreference().then((sp) {
        var name = sp.getString(SharedPreferenceKeys.KEY_USER_NAME) ?? "";
        var password = sp.getString(SharedPreferenceKeys.KEY_PASS_WORD) ?? "";
        if (name.isNotEmpty && password.isNotEmpty) {
          TravelRouter.navigateTo(context, TravelRouter.main);
        } else {
          TravelRouter.navigateTo(context, TravelRouter.login);
        }
//        Application.router.pop(context);
      });
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('images/beach.jpg'),
      ),
    );
  }
}
