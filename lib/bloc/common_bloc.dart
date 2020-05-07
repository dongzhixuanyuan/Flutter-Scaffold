import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelflutter/bloc/common_event.dart';
import 'package:travelflutter/bloc/common_state.dart';
import 'package:travelflutter/net/common_net_response.dart';

//R代表的请求返回的实际数据类型
abstract class CommonBloc<E extends CommonEvent, S extends CommonState, R>
    extends Bloc<CommonEvent, CommonState> {
  CommonBloc();

  @override
  CommonState get initialState => Loading();

  @override
  Stream<CommonState> mapEventToState(CommonEvent event) async* {
    if (event is ReloadEvent) {
      yield Loading();
      final response = await reloadData();
      if (response == null) {
        yield Failure();
      } else {
        var tmp = parseResult(response);
        if(tmp != null){
          yield tmp;
        } else {
          yield Loaded<R>(response.data);
        }
      }
    } else {
      yield await mapStateToEventImp(event);
    }
  }

  //子类去实现加载数据的具体实现
  Future<NetResponse<R>> reloadData();

  //子类负责解析网络返回数据
  CommonState parseResult(NetResponse<R> reponse) {
    return null;
  }

  //子类扩展的event和state
  Future<S> mapStateToEventImp(E event){
    return null;
  }
}
