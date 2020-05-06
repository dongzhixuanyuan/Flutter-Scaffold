import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelflutter/common/customToast.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/res/colors.dart';
import 'package:travelflutter/res/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/user/user.dart';

class ModifyPasswordPage extends StatefulWidget {
  @override
  _ModifyPasswordPageState createState() => _ModifyPasswordPageState();
}

class _ModifyPasswordPageState extends State<ModifyPasswordPage> {
  TextEditingController passWordController;

  @override
  void initState() {
    super.initState();
    passWordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('修改密码')),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 80.w,
                child: Text(
                  '新密码:',
                  style: TextStyles.textDark15,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: '请输入修改密码'),
                  controller: passWordController,
                  maxLines: 1,
                  autocorrect: true,
                  autofocus: true,
                  obscureText: true,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyles.textDark17,
                  onChanged: (text) {
                    print('change $text');
                  },
                  onSubmitted: (text) {
                    print('submit $text');
                  },
                  enabled: true, //是否禁用
                ),
              )
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          GestureDetector(
            onTap: () {
              //跳转到注册页面
              Future(() {
                ApiRepository.updatePassword(
                    MineUser.user.username, passWordController?.text, (e) {
                  Toast.show('密码修改失败', context);
                });
              }).then((success) {
                if (success) {
                  Navigator.pop(context);
                } else {
                  Toast.show('密码修改失败', context);
                }
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
                  '修改密码',
                  style: TextStyles.textDark17,
                )),
          ),
        ],
      ),
    );
  }
}
