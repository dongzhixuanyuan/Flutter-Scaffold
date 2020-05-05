import 'package:json_annotation/json_annotation.dart'; 
  
part 'train_ticket_model.g.dart';


@JsonSerializable()
  class TrainTicketModel extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'reason')
  String reason;

  TrainTicketModel(this.result,this.reason,);

  factory TrainTicketModel.fromJson(Map<String, dynamic> srcJson) => _$TrainTicketModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TrainTicketModelToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'stat')
  String stat;

  @JsonKey(name: 'train')
  List<Train> train;

  Result(this.stat,this.train,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
@JsonSerializable()
  class Train extends Object {

  @JsonKey(name: 'firstprice')
  String firstprice;

  @JsonKey(name: 'startplace')
  String startplace;

  @JsonKey(name: 'endplace')
  String endplace;

  @JsonKey(name: 'endtime')
  String endtime;

  @JsonKey(name: 'secendprice')
  String secendprice;

  @JsonKey(name: 'noclass')
  String noclass;

  @JsonKey(name: 'starttime')
  String starttime;

  @JsonKey(name: 'startdate')
  String startdate;

  @JsonKey(name: 'enddate')
  String enddate;

  @JsonKey(name: 'trainnumber')
  String trainnumber;

  @JsonKey(name: 'secendclass')
  String secendclass;

  @JsonKey(name: 'firstclass')
  String firstclass;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'noprice')
  String noprice;

  Train(this.firstprice,this.startplace,this.endplace,this.endtime,this.secendprice,this.noclass,this.starttime,this.startdate,this.enddate,this.trainnumber,this.secendclass,this.firstclass,this.id,this.noprice,);

  factory Train.fromJson(Map<String, dynamic> srcJson) => _$TrainFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TrainToJson(this);

}

  
