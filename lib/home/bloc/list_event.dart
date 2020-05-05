import 'package:equatable/equatable.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

//初次加载事件，获取切换Grade的事件。
class ReloadEvent extends ListEvent {
  final String grade;
  const ReloadEvent(this.grade);

  @override
  List<Object> get props => [grade];
}

//上拉加载更多的事件
class LoadMoreEvent extends ListEvent {

}

//滑动滚动条加载指定页的事件
class LoadPageEvent extends ListEvent {
  final int page;
  const LoadPageEvent(this.page);
  @override
  List<Object> get props => [page];
}

