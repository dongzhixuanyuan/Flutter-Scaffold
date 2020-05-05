// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainTicketModel _$TrainTicketModelFromJson(Map<String, dynamic> json) {
  return TrainTicketModel(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['reason'] as String);
}

Map<String, dynamic> _$TrainTicketModelToJson(TrainTicketModel instance) =>
    <String, dynamic>{'result': instance.result, 'reason': instance.reason};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['stat'] as String,
      (json['train'] as List)
          ?.map((e) =>
              e == null ? null : Train.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResultToJson(Result instance) =>
    <String, dynamic>{'stat': instance.stat, 'train': instance.train};

Train _$TrainFromJson(Map<String, dynamic> json) {
  return Train(
      json['firstprice'] as String,
      json['startplace'] as String,
      json['endplace'] as String,
      json['endtime'] as String,
      json['secendprice'] as String,
      json['noclass'] as String,
      json['starttime'] as String,
      json['startdate'] as String,
      json['enddate'] as String,
      json['trainnumber'] as String,
      json['secendclass'] as String,
      json['firstclass'] as String,
      json['id'] as int,
      json['noprice'] as String);
}

Map<String, dynamic> _$TrainToJson(Train instance) => <String, dynamic>{
      'firstprice': instance.firstprice,
      'startplace': instance.startplace,
      'endplace': instance.endplace,
      'endtime': instance.endtime,
      'secendprice': instance.secendprice,
      'noclass': instance.noclass,
      'starttime': instance.starttime,
      'startdate': instance.startdate,
      'enddate': instance.enddate,
      'trainnumber': instance.trainnumber,
      'secendclass': instance.secendclass,
      'firstclass': instance.firstclass,
      'id': instance.id,
      'noprice': instance.noprice
    };
