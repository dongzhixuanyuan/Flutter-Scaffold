import 'package:equatable/equatable.dart';
import 'package:travelflutter/bloc/common_state.dart';
import 'package:travelflutter/net/common_net_response.dart';

import 'list_bloc.dart';

class ListState extends CommonState {
  const ListState();

  @override
  List<Object> get props => [];
}

class ListLoaded extends ListState {
  final int page, totalPage, totalCount;
  final List<int> data;

  const ListLoaded(this.data, this.page, this.totalPage, this.totalCount);

  @override
  List<Object> get props => [data, page, totalPage, totalCount];

  @override
  String toString() {
    return super.toString() + 'ListLoaded { items: ${data.toString()} }';
  }
}

//上拉加载，发现已经到达最后一页
class NoMoreWord extends ListState {}
