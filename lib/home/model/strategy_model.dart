import 'package:json_annotation/json_annotation.dart'; 
  
part 'strategy_model.g.dart';


@JsonSerializable()
  class StrategyModel extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'reason')
  String reason;

  StrategyModel(this.result,this.reason,);

  factory StrategyModel.fromJson(Map<String, dynamic> srcJson) => _$StrategyModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StrategyModelToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'stat')
  String stat;

  @JsonKey(name: 'strategy')
  List<Strategy> strategy;

  Result(this.stat,this.strategy,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
@JsonSerializable()
  class Strategy extends Object {

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'introduce')
  String introduce;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'place')
  String place;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'characteristic')
  String characteristic;

  Strategy(this.image,this.introduce,this.id,this.place,this.time,this.title,this.characteristic,);

  factory Strategy.fromJson(Map<String, dynamic> srcJson) => _$StrategyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StrategyToJson(this);

}

  
