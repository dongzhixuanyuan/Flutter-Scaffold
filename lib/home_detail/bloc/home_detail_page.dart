import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelflutter/home/model/strategy_model.dart';

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
      body: Column(
        children: <Widget>[
          Image.network(bean.image),
          Text(
            bean.title,
            textAlign: TextAlign.center,
          ),
          Text(
            bean.characteristic,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
