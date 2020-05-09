import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelflutter/bloc/bloc.dart';
import 'package:travelflutter/common/comment_view.dart';
import 'package:travelflutter/home/model/strategy_model.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/res/resources.dart';
import 'package:travelflutter/router/routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/user/user.dart';

import 'comment_model.dart';
import 'detail_bloc.dart';

class StrategyDetailPage extends StatefulWidget {
  final String beanJson;
  Strategy bean;

  StrategyDetailPage(this.beanJson)
      : bean = Strategy.fromJson(jsonDecode(beanJson));

  @override
  _StrategyDetailPageState createState() => _StrategyDetailPageState();
}

class _StrategyDetailPageState extends State<StrategyDetailPage> {
  CommentBloc commentBloc;
  TextEditingController commentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentController = TextEditingController();

    commentBloc = CommentBloc();
    commentBloc.add(ReloadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.bean.title,
            textAlign: TextAlign.center,
          ),
        ),
        body: ListView(children: <Widget>[
          Image.network(widget.bean.image),
          Text(
            widget.bean.title,
            textAlign: TextAlign.center,
            style: TextStyles.textBoldDark24,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(

              widget.bean.characteristic,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0,bottom: 20,top: 20),
            child: Text(
              '热门评论',style: TextStyles.textBoldDark24,
            ),
          ),
          BlocBuilder(
            bloc: commentBloc,
            builder: (context, state) {
              if (state is Failure) {
                return Center(child: Text("加载失败"));
              } else if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is Loaded) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return CommentItem(
                        (state.data as CommentModel).result.evaluate[index]);
                  },
                  itemCount:
                      (state.data as CommentModel).result.evaluate.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                );
              }
              return Center(child: Text("加载失败"));
            },
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.comment),
          onPressed: () => TravelRouter.navigateTo(
                  context, TravelRouter.comment,
                  params: {'title': widget.bean.title},
                  transition: TransitionType.inFromBottom)
              .then((value) {
            commentBloc.add(ReloadEvent());
          }),
        ));
  }
}

class CommentItem extends StatelessWidget {
  final Evaluate bean;

  CommentItem(this.bean);

  @override
  Widget build(BuildContext context) {
    Widget profile = ClipOval(
      child: Image.asset(
        'images/portrait.jpg',
        fit: BoxFit.fill,
        width: 60,
        height: 60,
      ),
    );
    if (bean.image != null) {
      profile = ClipOval(
        child: Image.network(
          bean.image,
          fit: BoxFit.fill,
          width: 60,
          height: 60,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
//        TravelRouter.navigateTo(context, TravelRouter.detail, params: {
//          'data': jsonEncode(bean.toJson())
//        });
      },
      child: Container(
        height: 110.h,
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Positioned(left: 10.w, top: 5, child: profile),
            Positioned(
              top: 10.h,
              left: 100.w,
              child: Text(bean.username, style: TextStyles.textDark17),
            ),
            Positioned(
              top: 65.h,
              left: 10.w,
              child: Text(
                bean.content ?? '',
                style: TextStyles.textDark15,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Positioned(
              left: 10.w,
              bottom: 10.h,
              child: Text(
                bean.time
              ),
            ),
            Positioned(
              bottom: 10.h,
              right: 10.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
//                  Text(bean.time, style: TextStyles.textDark15),

                  Container(
                    width: 40.w,
                    child: Image.asset(
                      'images/coment.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Container(
                    width: 40.w,
                    child: Image.asset(
                      'images/good.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Container(
                    width: 40.w,
                    child: Image.asset(
                      'images/share.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
