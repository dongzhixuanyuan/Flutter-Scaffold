import 'package:equatable/equatable.dart';

abstract class CommonEvent extends Equatable {
  const CommonEvent();

  @override
  List<Object> get props => [];
}

//初次加载事件，获取切换Grade的事件。
class ReloadEvent extends CommonEvent {
  const ReloadEvent();

  @override
  List<Object> get props => [];
}




