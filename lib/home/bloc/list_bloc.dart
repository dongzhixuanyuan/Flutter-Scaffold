import 'package:travelflutter/bloc/bloc.dart';
import 'package:travelflutter/bloc/common_state.dart';
import 'package:travelflutter/home/model/strategy_model.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/net/common_net_response.dart';

import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends CommonBloc<ListEvent, ListState, StrategyModel> {
  int currentPage = 0;
  static int patchSize = 50;
  int totalPage = 0;

  ListBloc();


  @override
  CommonState parseResult(NetResponse<StrategyModel> reponse) {
    if (reponse.data.result != null && reponse.data.result.stat == "1") {
      currentPage = 0;
      return ListLoaded(reponse.data.result.strategy);
    }
    return Failure();
  }

  @override
  Future<NetResponse<StrategyModel>> reloadData(CommonEvent event) async {
    return await ApiRepository.getStrategyData((e) {
      print("ListBloc:reloadData error");
    });
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
        List<Strategy> preloaded =
            List<Strategy>.from((state as ListLoaded).data).toList();
        final responseModel = await reloadData(event);
        preloaded.addAll(responseModel.data.result.strategy);
        return ListLoaded(preloaded);
      }
    }
  }
}
