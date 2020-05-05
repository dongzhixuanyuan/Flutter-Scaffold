import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelflutter/home/model/strategy_model.dart';
import 'package:travelflutter/res/resources.dart';

class StrategyDetailPage extends StatelessWidget {
  final String beanJson;
  Strategy bean;

  StrategyDetailPage(this.beanJson)
      : bean = Strategy.fromJson(jsonDecode(beanJson));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            bean.title,
            textAlign: TextAlign.center,
          ),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          if (index == 0) {
            return Image.network(bean.image);
          } else if (index == 1) {
            return Text(
              bean.title,
              textAlign: TextAlign.center,
              style: TextStyles.textBoldDark24,
            );
          } else if (index == 2) {
            return Text(
              bean.characteristic,
              textAlign: TextAlign.center,
            );
          } else {

          }
        }));
  }
}
