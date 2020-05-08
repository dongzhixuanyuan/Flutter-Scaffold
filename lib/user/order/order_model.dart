import 'package:json_annotation/json_annotation.dart'; 
  
part 'order_model.g.dart';


@JsonSerializable()
  class OrderModel extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'reason')
  String reason;

  OrderModel(this.result,this.reason,);

  factory OrderModel.fromJson(Map<String, dynamic> srcJson) => _$OrderModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'stat')
  String stat;

  @JsonKey(name: 'orders')
  List<Orders> orders;

  Result(this.stat,this.orders,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
@JsonSerializable()
  class Orders extends Object {

  @JsonKey(name: 'seatnumber')
  String seatnumber;

  @JsonKey(name: 'price')
  String price;

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'endtime')
  String endtime;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'trainclass')
  String trainclass;

  @JsonKey(name: 'starttime')
  String starttime;

  @JsonKey(name: 'username')
  String username;

  Orders(this.seatnumber,this.price,this.count,this.endtime,this.id,this.trainclass,this.starttime,this.username,);

  factory Orders.fromJson(Map<String, dynamic> srcJson) => _$OrdersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);

}

  
