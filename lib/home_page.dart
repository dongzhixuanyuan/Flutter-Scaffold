
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelflutter/res/resources.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
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
            itemBuilder: (BuildContext context,int index){
              return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
            },
            itemCount: 3,
            pagination: new SwiperPagination(),
            autoplay: true,
            duration: 1000,
          ),
        ),
        Text('旅游攻略',style: TextStyles.textBoldDark26),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Text('第$index条攻略', style: TextStyles.textDark14);
            }, itemCount: 60,),
        )

      ],
      //文字提示
      //list内容展示
    );
  }

  @override
  bool get wantKeepAlive => true;
}
