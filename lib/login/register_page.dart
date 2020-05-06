import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelflutter/common/customToast.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/res/colors.dart';
import 'package:travelflutter/res/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/router/routers.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController;
  TextEditingController passWordController;
  TextEditingController confirmPassWordController, phoneNumController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passWordController = TextEditingController();
    confirmPassWordController = TextEditingController();
    phoneNumController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 50.w,
                  child: Text(
                    '用户名:',
                    style: TextStyles.textDark15,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: '请输入用户名'),
                    controller: userNameController,
                    //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                    maxLines: 1,
                    //最大行数
                    autocorrect: true,
                    //是否自动更正
                    autofocus: true,
                    //是否自动对焦
                    obscureText: false,
                    //是否是密码
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                    //文本对齐方式
                    style: TextStyles.textDark17,
                    //允许的输入格式
                    onChanged: (text) {
                      //内容改变的回调
                      print('change $text');
                    },
                    onSubmitted: (text) {
                      //内容提交(按回车)的回调
                      print('submit $text');
                    },
                    enabled: true, //是否禁用
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 50.w,
                  child: Text(
                    '密码:',
                    style: TextStyles.textDark15,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: '请输入密码'),
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
            Row(
              children: <Widget>[
                Container(
                  width: 50.w,
                  child: Text(
                    '确认密码:',
                    style: TextStyles.textDark15,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: '请输入确认密码'),
                    controller: confirmPassWordController,
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
            Row(
              children: <Widget>[
                Container(
                  width: 50.w,
                  child: Text(
                    '手机号:',
                    style: TextStyles.textDark15,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: '请输入手机号'),
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    controller: phoneNumController,
                    maxLines: 1,
                    autocorrect: true,
                    autofocus: true,
                    obscureText: false,
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
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                //进行注册操作。
                if (!_verifyInput()) {
                  Toast.show("输入不能为空，且密码要一致。", context);
                  return;
                }
                ApiRepository.register(userNameController?.text,
                    passWordController?.text, phoneNumController?.text, (e) {
                  Toast.show('注册失败', context);
                }).then((response) {
                  if (response.data) {
                    Navigator.pop(context,{'name':userNameController?.text,'password':passWordController?.text});
//                    TravelRouter.navigateTo(context, TravelRouter.login);
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
                    '注册',
                    style: TextStyles.textDark17,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  bool _verifyInput() {
    if (userNameController?.text.isNotEmpty &&
        passWordController?.text.isNotEmpty &&
        confirmPassWordController?.text.isNotEmpty &&
        phoneNumController?.text.isNotEmpty) {
      if (passWordController?.text == confirmPassWordController?.text) {
        return true;
      }
    }
    return false;
  }
}
