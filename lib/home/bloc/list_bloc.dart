import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelflutter/bloc/bloc.dart';
import 'package:travelflutter/bloc/common_state.dart';
import 'package:travelflutter/net/common_net_response.dart';

import 'list_event.dart';
import 'list_state.dart';

class ListResultModel {
  final List<int> content;

  const ListResultModel(this.content);
}

class ListBloc extends CommonBloc<ListEvent, ListState,ListResultModel> {
  int currentPage = 0;
  static int patchSize = 50;
  int totalPage = 0;

  ListBloc();

  @override
  CommonState get initialState => Loading();

  @override
  ListState parseResult(NetResponse) {
    return null;
  }

  @override
  Future<NetResponse<ListResultModel>> reloadData() async {
    // TODO: implement reloadData
    return null;
  }

  @override
  Future<ListState> mapStateToEventImp(ListEvent event) async {
    if (event is LoadMoreEvent) {
      var tmp = currentPage + 1;
      if (tmp >= totalPage) {
        //最后一页了
        return NoMoreWord();
      } else {
        currentPage++;
        List<int> preloaded =
            List<int>.from((state as ListLoaded).data).toList();
        final responseModel = await reloadData();
        preloaded.addAll(responseModel.data.content);
        return ListLoaded(preloaded,0,10,100);
      }
    }
  }
}
