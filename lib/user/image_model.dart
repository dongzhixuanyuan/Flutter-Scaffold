import 'package:json_annotation/json_annotation.dart'; 
  
part 'image_model.g.dart';


@JsonSerializable()
  class ImageModel extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'reason')
  String reason;

  ImageModel(this.result,this.reason,);

  factory ImageModel.fromJson(Map<String, dynamic> srcJson) => _$ImageModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'stat')
  String stat;

  @JsonKey(name: 'userimage')
  List<Userimage> userimage;

  Result(this.stat,this.userimage,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
@JsonSerializable()
  class Userimage extends Object {

  @JsonKey(name: 'image')
  String image;

  Userimage(this.image,);

  factory Userimage.fromJson(Map<String, dynamic> srcJson) => _$UserimageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserimageToJson(this);

}

  
