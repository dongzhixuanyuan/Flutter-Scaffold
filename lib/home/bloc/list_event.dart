import 'package:equatable/equatable.dart';
import 'package:travelflutter/bloc/common_event.dart';

class ListEvent extends CommonEvent {
  const ListEvent();

  @override
  List<Object> get props => [];
}

//滑动滚动条加载指定页的事件
class LoadPageEvent extends ListEvent {
  final int page;

  const LoadPageEvent(this.page);

  @override
  List<Object> get props => [page];
}

//上拉加载更多的事件
class LoadMoreEvent extends CommonEvent {}
