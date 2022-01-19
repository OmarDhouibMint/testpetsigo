import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'chatbots_event.dart';
part 'chatbots_state.dart';

class ChatbotsBloc extends Bloc<ChatbotsEvent, ChatbotsState> {
  ChatbotsBloc() : super(const ChatbotsState()) {
    on<loadchatbots>(_loadchatbots);
  }
}
void _loadchatbots(
    loadchatbots event,
    Emitter<ChatbotsState> emit,
    ) async {
  emit(const ChatbotsState(isLoading:true));
  try {
    emit(const ChatbotsState(isFailed:false));
    emit(const ChatbotsState(success:true));
    } catch (e) {
    print(e);
    emit(const ChatbotsState(isFailed:true));
    emit(const ChatbotsState(success:false));
    }

}
