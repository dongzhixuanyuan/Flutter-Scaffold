import 'package:equatable/equatable.dart';
import 'package:travelflutter/net/common_net_response.dart';

abstract class CommonState extends Equatable {
  const CommonState();

  @override
  List<Object> get props => [];
}

class Loading extends CommonState {}

class Failure extends CommonState {}


