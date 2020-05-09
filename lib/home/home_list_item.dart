import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/widgets.dart';
import 'package:travelflutter/application.dart';
import 'package:travelflutter/res/resources.dart';
import 'package:travelflutter/router/routers.dart';

import 'model/strategy_model.dart';

class HomeItem extends StatelessWidget {
  final Strategy bean;

  HomeItem(this.bean);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TravelRouter.navigateTo(context, TravelRouter.detail, params: {
          'data': jsonEncode(bean.toJson())
        });
      },
      child: Container(
        height: 140.h,
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            Positioned(
                left: 10.w,
                top: 25.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    bean.image,
                    fit: BoxFit.fill,
                    width: 90.w,
                    height: 70.h,
                  ),
                )),
            Positioned(
              top: 15.h,
              left: 120.w,
              child: Text(bean.title, style: TextStyles.textDark17),
            ),
            Positioned(
              top: 40.h,
              left: 120.w,
              width: 240.w,
              child: Text(
                bean.introduce,
                style: TextStyles.textDark15,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Positioned(
              bottom: 32.h  ,
              left: 120.w,
              child:Text(bean.place, style: TextStyles.textDark15),
            ),
            Positioned(
              top: 12.h,
              right: 8.w  ,
              child:Text(bean.time, style: TextStyles.textDark15),
            ),
          ],
        ),
      ),
    );

  }
}
