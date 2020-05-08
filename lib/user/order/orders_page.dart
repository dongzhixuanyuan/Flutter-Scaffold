import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelflutter/bloc/bloc.dart';
import 'package:travelflutter/user/order/oder_bloc.dart';
import 'package:travelflutter/user/order/order_model.dart';
import 'package:travelflutter/user/user.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  OrderBloc orderBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderBloc = OrderBloc();
    orderBloc.add(OrderLoadEvent(MineUser.user.username));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('订单中心')),
        body: BlocBuilder(
            bloc: orderBloc,
            builder: (context, state) {
              if (state is Loading) {
                return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator());
              } else if (state is Loaded) {
                var orderList = (state.data as OrderModel).result.orders;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return OrderItem(orderList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 3,
                        color: Colors.grey,
                      );
                    },
                    itemCount: orderList.length);
              }
              return Container(
                alignment: Alignment.center,
                child: Text('加载失败'),
              );
            }));
  }
}

class OrderItem extends StatelessWidget {
  Orders orders;

  OrderItem(this.orders);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 10,
            child: Row(
              children: <Widget>[
                Text(orders.starttime),
                SizedBox(
                  width: 20,
                ),
                Text(orders.endtime)
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 35,
            child: Text(orders.trainclass),
          ),
          Positioned(
            top: 37,
            left: 90,
            child: Text(orders.seatnumber),
          ),
          Positioned(
            left: 10,
            top: 70,
            child: Text(orders.username),
          ),
          Positioned(right: 10, top: 10, child: Text(orders.count.toString())),
          Positioned(right: 10, bottom: 10, child: Text(orders.price)),
        ],
      ),
    );
  }
}
