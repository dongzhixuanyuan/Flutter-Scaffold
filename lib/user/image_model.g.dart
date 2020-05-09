// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return ImageModel(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['reason'] as String);
}

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{'result': instance.result, 'reason': instance.reason};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      json['stat'] as String,
      (json['userimage'] as List)
          ?.map((e) =>
              e == null ? null : Userimage.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResultToJson(Result instance) =>
    <String, dynamic>{'stat': instance.stat, 'userimage': instance.userimage};

Userimage _$UserimageFromJson(Map<String, dynamic> json) {
  return Userimage(json['image'] as String);
}

Map<String, dynamic> _$UserimageToJson(Userimage instance) =>
    <String, dynamic>{'image': instance.image};
