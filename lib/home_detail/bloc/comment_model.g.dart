// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['reason'] as String);
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{'result': instance.result, 'reason': instance.reason};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['stat'] as String,
      (json['evaluate'] as List)
          ?.map((e) =>
              e == null ? null : Evaluate.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResultToJson(Result instance) =>
    <String, dynamic>{'stat': instance.stat, 'evaluate': instance.evaluate};

Evaluate _$EvaluateFromJson(Map<String, dynamic> json) {
  return Evaluate(
      json['image'] as String,
      json['id'] as int,
      json['time'] as String,
      json['content'] as String,
      json['username'] as String);
}

Map<String, dynamic> _$EvaluateToJson(Evaluate instance) => <String, dynamic>{
      'image': instance.image,
      'id': instance.id,
      'time': instance.time,
      'content': instance.content,
      'username': instance.username
    };
