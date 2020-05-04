import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelflutter/res/colors.dart';
import 'package:travelflutter/res/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              onTap: () {
                //todo 登录到服务器
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
                //todo 注册操作
                userNameController?.text;
              },
              child: Text(
                '注册',
                style: TextStyles.textDark17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
