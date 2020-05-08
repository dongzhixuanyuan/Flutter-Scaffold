import 'package:travelflutter/bloc/bloc.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/net/common_net_response.dart';
import 'package:travelflutter/tickets/flight_ticket_model.dart';
import 'package:travelflutter/tickets/train_ticket_model.dart';

class TrainBloc extends CommonBloc<CommonEvent, CommonState, TrainTicketModel> {
  @override
  Future<NetResponse<TrainTicketModel>> reloadData(CommonEvent event) {
    return ApiRepository.getTrainTickets();
  }
}

class FlightBloc
    extends CommonBloc<CommonEvent, CommonState, FlightTicketModel> {
  @override
  Future<NetResponse<FlightTicketModel>> reloadData(CommonEvent event) {
    return ApiRepository.getFlightTickets();
  }
}
