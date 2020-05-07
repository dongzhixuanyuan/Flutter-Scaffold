import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelflutter/common/customToast.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/res/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/router/routers.dart';
import 'package:travelflutter/user/user.dart';

typedef bool CommitCallback(String);

class CommonCommentView extends StatefulWidget {
  final String title;

  CommonCommentView(this.title);

  @override
  _CommonCommentViewState createState() => _CommonCommentViewState();
}

class _CommonCommentViewState extends State<CommonCommentView> {
  TextEditingController commentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    TravelRouter.srouter.pop(context);
                  },
                  child: Text('取消'),
                ),
                Text(widget.title),
                MaterialButton(
                  onPressed: () async {
                    if (commentController?.text.isNotEmpty) {
                      var success = await ApiRepository.addComments(
                          MineUser.user.username, MineUser.user.image,
                          commentController?.text, widget.title);
                      if (!success.data) {
                        Toast.show('评论失败', context);
                      }
                      TravelRouter.srouter.pop(context);
                    } else {
                      Toast.show('输入不能为空', context);
                    }
                  },
                  child: Text('发布'),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.topCenter,
                child: TextField(
                  decoration: InputDecoration(hintText: '输入评论内容'),
                  controller: commentController,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
