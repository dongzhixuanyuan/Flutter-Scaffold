


import 'package:travelflutter/bloc/bloc.dart';
import 'package:travelflutter/net/api_repository.dart';
import 'package:travelflutter/net/common_net_response.dart';

import 'comment_model.dart';

class CommentBloc extends CommonBloc<CommonEvent,CommonState,CommentModel>{


  @override
  Future<NetResponse<CommentModel>> reloadData() {

    return ApiRepository.getComments();
  }

}