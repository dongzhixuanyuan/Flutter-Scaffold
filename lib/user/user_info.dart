import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/application.dart';
import 'package:travelflutter/common/shared_preference_key.dart';
import 'package:travelflutter/res/colors.dart';
import 'package:travelflutter/res/resources.dart';
import 'package:travelflutter/router/routers.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var topInsets = MediaQuery.of(context).padding.top;
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: topInsets,
        ),

        Container(
          alignment: Alignment.center,
          height: 30.h,
          child: Text(
            '个人中心',
            style: TextStyles.textWhite20,
            textAlign: TextAlign.center,
          ),
          color: Colors.blue,
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                title: Text('修改密码'),
                onTap: (){
                  TravelRouter.navigateTo(context,TravelRouter.modifyPassword);
                },
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                title: Text('我的订单'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: ()=>TravelRouter.navigateTo(context, TravelRouter.orders),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                title: Text('关于我们'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                title: Text('联系客户'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                title: Text('检查更新'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
                child: GestureDetector(
                  onTap: () {
                    //todo 退出登录的操作。
                    Application.sharedPreference().then((sp){
                      sp.remove(SharedPreferenceKeys.KEY_USER_NAME);
                      sp.remove(SharedPreferenceKeys.KEY_PASS_WORD);
                    }).then((success){
                      Application.router.navigateTo(context, TravelRouter.login);
                    });
                  },
                  child: Container(
                      width: 300.w,
                      height: 30.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colours.app_main,
                          borderRadius: BorderRadiusDirectional.circular(5)),
                      child: Text(
                        '退出登录',
                        style: TextStyles.textDark17,
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
