import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/res/colors.dart';
import 'package:travelflutter/res/resources.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 30.h,
          child: Text(
            '个人中心',
            style: TextStyles.textWhite20,
            textAlign: TextAlign.center,
          ),
          color: Colours.text_blue,
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                title: Text('修改密码'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                title: Text('我的订单'),
                trailing: Icon(Icons.arrow_forward_ios),
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