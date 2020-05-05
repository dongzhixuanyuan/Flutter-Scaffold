import 'package:equatable/equatable.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class Loading extends ListState {}

class Loaded extends ListState {
  final Object result;
  final int page,totalPage,totalCount;
  const Loaded(this.result,this.page,this.totalPage,this.totalCount);

  @override
  List<Object> get props => [result,page,totalPage,totalCount];

  @override
  String toString() => 'Loaded { items: ${result.toString()} }';
}

//上拉加载，发现已经到达最后一页
class NoMoreWord extends ListState{

}

class Failure extends ListState {}
