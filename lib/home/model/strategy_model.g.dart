// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strategy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StrategyModel _$StrategyModelFromJson(Map<String, dynamic> json) {
  return StrategyModel(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['reason'] as String);
}

Map<String, dynamic> _$StrategyModelToJson(StrategyModel instance) =>
    <String, dynamic>{'result': instance.result, 'reason': instance.reason};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['stat'] as String,
      (json['strategy'] as List)
          ?.map((e) =>
              e == null ? null : Strategy.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResultToJson(Result instance) =>
    <String, dynamic>{'stat': instance.stat, 'strategy': instance.strategy};

Strategy _$StrategyFromJson(Map<String, dynamic> json) {
  return Strategy(
      json['image'] as String,
      json['introduce'] as String,
      json['id'] as int,
      json['place'] as String,
      json['time'] as String,
      json['title'] as String,
      json['characteristic'] as String);
}

Map<String, dynamic> _$StrategyToJson(Strategy instance) => <String, dynamic>{
      'image': instance.image,
      'introduce': instance.introduce,
      'id': instance.id,
      'place': instance.place,
      'time': instance.time,
      'title': instance.title,
      'characteristic': instance.characteristic
    };
