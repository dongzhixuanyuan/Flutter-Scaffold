// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['reason'] as String);
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{'result': instance.result, 'reason': instance.reason};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['stat'] as String,
      (json['orders'] as List)
          ?.map((e) =>
              e == null ? null : Orders.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResultToJson(Result instance) =>
    <String, dynamic>{'stat': instance.stat, 'orders': instance.orders};

Orders _$OrdersFromJson(Map<String, dynamic> json) {
  return Orders(
      json['seatnumber'] as String,
      json['price'] as String,
      json['count'] as int,
      json['endtime'] as String,
      json['id'] as int,
      json['trainclass'] as String,
      json['starttime'] as String,
      json['username'] as String);
}

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'seatnumber': instance.seatnumber,
      'price': instance.price,
      'count': instance.count,
      'endtime': instance.endtime,
      'id': instance.id,
      'trainclass': instance.trainclass,
      'starttime': instance.starttime,
      'username': instance.username
    };
