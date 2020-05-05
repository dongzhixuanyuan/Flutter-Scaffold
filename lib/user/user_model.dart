import 'package:json_annotation/json_annotation.dart'; 
  
part 'user_model.g.dart';


@JsonSerializable()
  class UserModel extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'reason')
  String reason;

  UserModel(this.result,this.reason,);

  factory UserModel.fromJson(Map<String, dynamic> srcJson) => _$UserModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'stat')
  String stat;

  @JsonKey(name: 'login')
  List<Login> login;

  Result(this.stat,this.login,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
@JsonSerializable()
  class Login extends Object {

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'username')
  String username;

  Login(this.image,this.password,this.phone,this.id,this.username,);

  factory Login.fromJson(Map<String, dynamic> srcJson) => _$LoginFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginToJson(this);

}

  
