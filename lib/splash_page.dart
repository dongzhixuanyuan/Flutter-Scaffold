import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelflutter/application.dart';
import 'package:travelflutter/common/customToast.dart';
import 'package:travelflutter/common/shared_preference_key.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/res/resources.dart';
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

    Future.delayed(Duration(milliseconds: 200), () {
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
            var imagreResponse = await ApiRepository.getAvartarImage(MineUser.user.username);
            if (imagreResponse != null) {
              MineUser.user.image =
                  imagreResponse.data.result.userimage.first.image;
            } else {
              MineUser.user.image =
              'http://139.159.154.117:8080/travel/upload/2020/05/09/ec73dbb0c70678f3eb13cdb2c2229d5e.jpg';
            }

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
        child: Container(
          alignment: Alignment.center,
          child: Text('即刻旅游',style: TextStyles.textBoldDark26,),
        ),
      ),
    );
  }
}
