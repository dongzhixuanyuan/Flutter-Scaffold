import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/home/bloc/bloc.dart';
import 'package:travelflutter/res/resources.dart';
import 'package:bloc/bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {

  ListBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ListBloc();
    bloc.add(ReloadEvent("fff"));
  }

  @override
  Widget build(BuildContext context) {
    var topInsets = MediaQuery.of(context).padding.top;
    return Column(
      //banner
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: topInsets,
        ),
        Container(
          height: 150.h,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                "http://via.placeholder.com/350x150",
                fit: BoxFit.fill,
              );
            },
            itemCount: 3,
            pagination: new SwiperPagination(),
            autoplay: true,
            duration: 1000,
          ),
        ),
        Text('旅游攻略', style: TextStyles.textBoldDark26),
        Expanded(
          child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is Loaded) {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Text('第$index条攻略', style: TextStyles.textDark14);
                  },
                  itemCount: 60,
                );
              }
              return Center(child: Text("加载失败"));
            },
          ),
        )
      ],
      //文字提示
      //list内容展示
    );
  }

  @override
  bool get wantKeepAlive => true;
}
