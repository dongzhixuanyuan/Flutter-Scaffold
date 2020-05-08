import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelflutter/bloc/bloc.dart';
import 'package:travelflutter/common/customToast.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/res/colors.dart';
import 'package:travelflutter/res/styles.dart';
import 'package:travelflutter/tickets/flight_ticket_model.dart';
import 'package:travelflutter/tickets/tickets_bloc.dart';
import 'package:travelflutter/tickets/train_ticket_model.dart';
import 'package:travelflutter/user/user.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  TrainBloc trainBloc;
  FlightBloc flightBloc;
  StreamController transportationType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    _pageController = PageController();
    trainBloc = TrainBloc();
    flightBloc = FlightBloc();
    transportationType = StreamController<bool>.broadcast()..add(true);
  }

  @override
  void dispose() {
    transportationType?.close();
    trainBloc.close();
    flightBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var topInsets = MediaQuery.of(context).padding.top;

    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: topInsets,
        ),
        TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_railway), text: '火车'),
            Tab(icon: Icon(Icons.local_airport), text: '飞机'),
          ],
          controller: _tabController,
          labelPadding: EdgeInsets.only(left: 14.0, right: 14.0),
          unselectedLabelColor: Colours.text_dark,
          unselectedLabelStyle: TextStyles.textGray12,
          labelStyle: TextStyles.textBlueC15,
          labelColor: Colours.text_blue,
          onTap: (int index) {
            transportationType.add(index == 0);
            setState(() {});
          },
          indicatorColor: Colors.transparent,
        ),
        _buildContentView()
      ],
    );
  }

  Widget _buildContentView() {
    return StreamBuilder<bool>(
      stream: transportationType.stream,
      builder: (context, snapShot) {
        if (snapShot == null || snapShot.data == null || snapShot.data) {
          //火车
          trainBloc.add(ReloadEvent());
          return Expanded(
            child: BlocBuilder(
                bloc: trainBloc,
                builder: (context, state) {
                  if (state is Loading) {
                    return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());
                  } else if (state is Failure) {
                    return Container(
                      child: Text('加载失败'),
                    );
                  } else if (state is Loaded) {
                    var trains = (state.data as TrainTicketModel).result.train;
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return TrainTicketItem(trains[index]);
                        },
                        itemCount: trains.length,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey,
                            thickness: 3,
                          );
                        });
                  }
                }),
          );
        } else {
          //飞机
          flightBloc.add(ReloadEvent());
          return Expanded(
            child: BlocBuilder(
                bloc: flightBloc,
                builder: (context, state) {
                  if (state is Loading) {
                    return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());
                  } else if (state is Failure) {
                    return Container(
                      child: Text('加载失败'),
                    );
                  } else if (state is Loaded) {
                    var trains = (state.data as FlightTicketModel).result.train;
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return FlightTicketItem(trains[index]);
                        },
                        itemCount: trains.length,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey,
                            thickness: 3,
                          );
                        });
                  }
                  return SizedBox();
                }),
          );
        }
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class TrainTicketItem extends StatelessWidget {
  final Train bean;

  TrainTicketItem(this.bean);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(bean.starttime),
                  Text(bean.startplace),
                  Text(bean.secendclass)
                ],
              ),
              Column(
                children: <Widget>[
                  Text(bean.trainnumber),
                  Text(bean.firstclass)
                ],
              ),
              Column(
                children: <Widget>[
                  Text(bean.endtime),
                  Text(bean.endplace),
                  Text(bean.noclass)
                ],
              ),
              Column(
                children: <Widget>[
                  Text(bean.secendprice),
                  MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('确认购买车票？'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('取消'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                FlatButton(
                                  child: Text('确认'),
                                  onPressed: () async {
                                    var result = await ApiRepository
                                        .buyTrainFlightTicket(
                                            bean.secendclass,
                                            bean.starttime,
                                            bean.endtime,
                                            bean.secendprice,
                                            1.toString(),
                                            MineUser.user.username,
                                            Random().nextInt(500).toString());
                                    if (result.data) {
                                      Toast.show('购买成功!', context);
                                    } else {
                                      Toast.show('购买失败!', context);
                                    }
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.amber,
                    child: Text('购票'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FlightTicketItem extends StatelessWidget {
  final Flight bean;

  FlightTicketItem(this.bean);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(bean.starttime),
                Text(bean.startplace),
                Text(bean.economyclass)
              ],
            ),
            Column(
              children: <Widget>[Text(bean.flightnumber)],
            ),
            Column(
              children: <Widget>[
                Text(bean.endtime),
                Text(bean.endplace),
                Text(bean.firstclass)
              ],
            ),
            Column(
              children: <Widget>[
                Text(bean.economyprice),
                MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('确认购买飞机票？'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('取消'),
                                onPressed: () => Navigator.pop(context),
                              ),
                              FlatButton(
                                child: Text('确认'),
                                onPressed: () async {
                                  var result = await ApiRepository
                                      .buyTrainFlightTicket(
                                      bean.economyclass,
                                      bean.starttime,
                                      bean.endtime,
                                      bean.economyprice,
                                      1.toString(),
                                      MineUser.user.username,
                                      Random().nextInt(500).toString());
                                  if (result.data) {
                                    Toast.show('购买成功!', context);
                                  } else {
                                    Toast.show('购买失败!', context);
                                  }
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.amber,
                  child: Text('购票'),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
