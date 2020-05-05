import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  int currentPage = 0;
  static int patchSize = 50;
  int totalPage = 0;

  ListBloc();

  @override
  ListState get initialState => Loading();

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
//    if (event is ReloadEvent) {
//      currentPage = 0;
//      yield Loading();
//      final responseModel =
//          await repository.fetchData(grade, domain, currentPage, patchSize);
//      if (responseModel == null || responseModel.code != 200) {
//        yield Failure();
//      } else {
//        totalCount = responseModel.data.total;
//        totalPage = responseModel.data.totalPage;
//        eventBus.fire(LexileBottomSliderEvent(domain, totalCount,
//            responseModel.data.page, responseModel.data.totalPage));
//        yield Loaded(responseModel.data, responseModel.data.page,
//            responseModel.data.totalPage, totalCount);
//      }
//    } else if (event is LoadMoreEvent) {
//      var tmp = currentPage + 1;
//      if (tmp >= totalPage) {
//        //最后一页了
//        yield NoMoreWord();
//      } else {
//        currentPage++;
//        List<WordDetail> preloaded =
//            List<WordDetail>.from((state as Loaded).result.data).toList();
//        final responseModel =
//            await repository.fetchData(grade, domain, currentPage, patchSize);
//        if (responseModel == null || responseModel.code != 200) {
//          yield Loaded((state as Loaded).result, --currentPage,
//              (state as Loaded).totalPage, totalCount);
//        } else {
//          var result = preloaded + responseModel.data.data;
//          responseModel.data.data = result;
//          eventBus.fire(LexileBottomSliderEvent(domain, totalCount,
//              responseModel.data.page, responseModel.data.totalPage));
//          yield Loaded(responseModel.data, responseModel.data.page,
//              responseModel.data.totalPage, totalCount);
//        }
//      }
//    } else if (event is LoadPageEvent) {
//      if (event.page == currentPage) {
//        yield NoNeedRefresh();
//      } else {
//        yield Loading();
//        currentPage = event.page;
//        final responseModel =
//            await repository.fetchData(grade, domain, currentPage, patchSize);
//        if (responseModel == null || responseModel.code != 200) {
//          yield Failure();
//        } else {
//          yield Loaded(responseModel.data, responseModel.data.page,
//              responseModel.data.totalPage, totalCount);
//        }
//      }
//    }
  }
}
