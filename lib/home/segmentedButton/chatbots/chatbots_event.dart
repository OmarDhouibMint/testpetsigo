part of 'chatbots_bloc.dart';


abstract class ChatbotsEvent extends Equatable {
  const ChatbotsEvent();
  @override
  List<Object> get props => [];
}

class loadchatbots extends ChatbotsEvent {
  const loadchatbots();
}
