import 'package:json_annotation/json_annotation.dart'; 
  
part 'comment_model.g.dart';


@JsonSerializable()
  class CommentModel extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'reason')
  String reason;

  CommentModel(this.result,this.reason,);

  factory CommentModel.fromJson(Map<String, dynamic> srcJson) => _$CommentModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'stat')
  String stat;

  @JsonKey(name: 'evaluate')
  List<Evaluate> evaluate;

  Result(this.stat,this.evaluate,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
@JsonSerializable()
  class Evaluate extends Object {

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'username')
  String username;

  Evaluate(this.image,this.id,this.time,this.content,this.username,);

  factory Evaluate.fromJson(Map<String, dynamic> srcJson) => _$EvaluateFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EvaluateToJson(this);

}

  
