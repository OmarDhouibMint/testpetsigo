
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';


part 'chatbots_event.dart';
part 'chatbots_state.dart';

class ChatbotsBloc extends Bloc<ChatbotsEvent, ChatbotsState> {
  ChatbotsBloc() : super(const ChatbotsState()) {
    on<loadchatbots>(_loadchatbots);
  }
  void _loadchatbots(
      loadchatbots event,
      Emitter<ChatbotsState> emit,
      ) async {
    if (state.success.isValidated) {
      emit(const ChatbotsState(isLoading:true));
      emit(const ChatbotsState(index: 1));
    }
      emit(const ChatbotsState(isFailed:true));
    }

  }

