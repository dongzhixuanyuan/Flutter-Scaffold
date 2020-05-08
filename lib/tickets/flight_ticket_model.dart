import 'package:json_annotation/json_annotation.dart'; 
  
part 'flight_ticket_model.g.dart';


@JsonSerializable()
  class FlightTicketModel extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'reason')
  String reason;

  FlightTicketModel(this.result,this.reason,);

  factory FlightTicketModel.fromJson(Map<String, dynamic> srcJson) => _$FlightTicketModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FlightTicketModelToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'stat')
  String stat;

  @JsonKey(name: 'train')
  List<Flight> train;

  Result(this.stat,this.train,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
@JsonSerializable()
  class Flight extends Object {

  @JsonKey(name: 'firstprice')
  String firstprice;

  @JsonKey(name: 'seatcount')
  String seatcount;

  @JsonKey(name: 'economyprice')
  String economyprice;

  @JsonKey(name: 'startplace')
  String startplace;

  @JsonKey(name: 'flightnumber')
  String flightnumber;

  @JsonKey(name: 'endplace')
  String endplace;

  @JsonKey(name: 'endtime')
  String endtime;

  @JsonKey(name: 'economyclass')
  String economyclass;

  @JsonKey(name: 'flightplace')
  String flightplace;

  @JsonKey(name: 'starttime')
  String starttime;

  @JsonKey(name: 'startdate')
  String startdate;

  @JsonKey(name: 'firstclass')
  String firstclass;

  @JsonKey(name: 'id')
  int id;

  Flight(this.firstprice,this.seatcount,this.economyprice,this.startplace,this.flightnumber,this.endplace,this.endtime,this.economyclass,this.flightplace,this.starttime,this.startdate,this.firstclass,this.id,);

  factory Flight.fromJson(Map<String, dynamic> srcJson) => _$TrainFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TrainToJson(this);

}

  
