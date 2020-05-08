// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightTicketModel _$FlightTicketModelFromJson(Map<String, dynamic> json) {
  return FlightTicketModel(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['reason'] as String);
}

Map<String, dynamic> _$FlightTicketModelToJson(FlightTicketModel instance) =>
    <String, dynamic>{'result': instance.result, 'reason': instance.reason};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['stat'] as String,
      (json['train'] as List)
          ?.map((e) =>
              e == null ? null : Flight.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResultToJson(Result instance) =>
    <String, dynamic>{'stat': instance.stat, 'train': instance.train};

Flight _$TrainFromJson(Map<String, dynamic> json) {
  return Flight(
      json['firstprice'] as String,
      json['seatcount'] as String,
      json['economyprice'] as String,
      json['startplace'] as String,
      json['flightnumber'] as String,
      json['endplace'] as String,
      json['endtime'] as String,
      json['economyclass'] as String,
      json['flightplace'] as String,
      json['starttime'] as String,
      json['startdate'] as String,
      json['firstclass'] as String,
      json['id'] as int);
}

Map<String, dynamic> _$TrainToJson(Flight instance) => <String, dynamic>{
      'firstprice': instance.firstprice,
      'seatcount': instance.seatcount,
      'economyprice': instance.economyprice,
      'startplace': instance.startplace,
      'flightnumber': instance.flightnumber,
      'endplace': instance.endplace,
      'endtime': instance.endtime,
      'economyclass': instance.economyclass,
      'flightplace': instance.flightplace,
      'starttime': instance.starttime,
      'startdate': instance.startdate,
      'firstclass': instance.firstclass,
      'id': instance.id
    };
