import 'package:travelflutter/bloc/bloc.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/net/common_net_response.dart';

import 'order_model.dart';

class OrderBloc extends CommonBloc<CommonEvent, CommonState, OrderModel> {
  @override
  Future<NetResponse<OrderModel>> reloadData(CommonEvent event) {
    return ApiRepository.getOrders((event as OrderLoadEvent).userName);
  }
}

class OrderLoadEvent extends ReloadEvent {
  final String userName;

  OrderLoadEvent(this.userName);
}
