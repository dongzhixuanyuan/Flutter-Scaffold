import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelflutter/application.dart';
import 'package:travelflutter/common/customToast.dart';
import 'package:travelflutter/common/shared_preference_key.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/res/colors.dart';
import 'package:travelflutter/res/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/router/routers.dart';
import 'package:travelflutter/user/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController;
  TextEditingController passWordController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passWordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
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
                    //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                    maxLines: 1,
                    //最大行数
                    autocorrect: true,
                    //是否自动更正
                    autofocus: true,
                    //是否自动对焦
                    obscureText: true,
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
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () async {
                if (userNameController?.text.isNotEmpty &&
                    passWordController?.text.isNotEmpty) {
                  Future(() {
                    return ApiRepository.loginPost(
                        userNameController?.text, passWordController?.text);
                  }).then((success) async {
                    if (!success) {
                      Toast.show('登录失败，请检查用户名和密码', context);
                      return;
                    }
                    var response = await ApiRepository.login(
                        userNameController?.text, passWordController?.text, () {
                      Toast.show('登录失败，请检查用户名和密码', context);
                    });
                    if (response.code == 200 &&
                        response.data.result.stat == '1') {
                      Toast.show('登录成功', context);
                      MineUser.user = response.data.result.login.first;
                      var sp = await Application.sharedPreference();
                      sp.setString(SharedPreferenceKeys.KEY_USER_NAME, MineUser.user.username);
                      sp.setString(SharedPreferenceKeys.KEY_PASS_WORD, MineUser.user.password);
                      TravelRouter.navigateTo(context, TravelRouter.main);
                    } else {
                      Toast.show('登录失败，请检查用户名和密码', context);
                    }
                  });
                } else {
                  Toast.show('用户名和密码不能为空', context);
                }
              },
              child: Container(
                  width: 300.w,
                  height: 30.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colours.app_main,
                      borderRadius: BorderRadiusDirectional.circular(5)),
                  child: Text(
                    '登录',
                    style: TextStyles.textDark17,
                  )),
            ),
            Divider(
              height: 5.h,
            ),
            GestureDetector(
              onTap: () {
                //跳转到注册页面
                TravelRouter.navigateTo(context, TravelRouter.register)
                    .then((value) {
                  var name = (value as Map)['name'];
                  var password = (value as Map)['password'];
                  userNameController?.text = name;
                  passWordController?.text = password;
                });
              },
              child: Text(
                '注册',
                style: TextStyles.textDark17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
