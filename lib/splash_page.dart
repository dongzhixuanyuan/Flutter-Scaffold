import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelflutter/application.dart';
import 'package:travelflutter/common/customToast.dart';
import 'package:travelflutter/common/shared_preference_key.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/router/routers.dart';
import 'package:travelflutter/user/user.dart';

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
      Application.sharedPreference().then((sp) async {
        var name = sp.getString(SharedPreferenceKeys.KEY_USER_NAME) ?? "";
        var password = sp.getString(SharedPreferenceKeys.KEY_PASS_WORD) ?? "";
        if (name.isNotEmpty && password.isNotEmpty) {
          var loginResult = await ApiRepository.login(name, password, (e) {
            Toast.show('登录失败', context);
          });
          if (loginResult.data.result.stat == '1') {
//            Toast.show('登录成功', context);
            MineUser.user = loginResult.data.result.login.first;
            TravelRouter.navigateTo(context, TravelRouter.main);
          } else {
            Toast.show('登录失败', context);
          }
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
