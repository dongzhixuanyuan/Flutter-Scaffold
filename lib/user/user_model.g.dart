// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['reason'] as String);
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) =>
    <String, dynamic>{'result': instance.result, 'reason': instance.reason};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['stat'] as String,
      (json['login'] as List)
          ?.map((e) =>
              e == null ? null : Login.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResultToJson(Result instance) =>
    <String, dynamic>{'stat': instance.stat, 'login': instance.login};

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(json['image'] as String, json['password'] as String,
      json['phone'] as String, json['id'] as int, json['username'] as String);
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'image': instance.image,
      'password': instance.password,
      'phone': instance.phone,
      'id': instance.id,
      'username': instance.username
    };
