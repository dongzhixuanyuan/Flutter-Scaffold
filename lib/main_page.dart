import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelflutter/home_page.dart';
import 'package:travelflutter/res/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          //上部填充区域
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (page) {
                print('page = $page');
              },
              children: <Widget>[
                HomePage(),
                Container(
                  child: Text('购票'),
                ),
                Container(
                  child: Text('我的'),
                )
              ],
            ),
          ),
          TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_bike),
                text: '推荐',
              ),
              Tab(icon: Icon(Icons.directions_car), text: '购票'),
              Tab(icon: Icon(Icons.directions_bus), text: '我的'),
            ],
            controller: _tabController,
            labelPadding: EdgeInsets.only(left: 14.0, right: 14.0),
            unselectedLabelColor: Colours.text_dark,
            unselectedLabelStyle: TextStyles.textGray12,
            labelStyle: TextStyles.textBlueC15,
            labelColor: Colours.text_blue,
            onTap: (int index) {
              _pageController.jumpToPage(index);
            },
            indicatorColor: Colors.transparent,
          )

          // 底部tabbar
        ],
      ),
    ));
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
