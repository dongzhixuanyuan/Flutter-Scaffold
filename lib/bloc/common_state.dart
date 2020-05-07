import 'package:equatable/equatable.dart';

abstract class CommonState<R> extends Equatable {
  const CommonState();

  @override
  List<Object> get props => [];
}

class Loading extends CommonState {}

class Failure extends CommonState {}

class Loaded<R> extends CommonState<R> {
   R data;

   Loaded(this.data);
}


