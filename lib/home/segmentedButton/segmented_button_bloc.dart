import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'segmented_button_event.dart';
part 'segmented_button_state.dart';

class SegmentedButtonBloc extends Bloc<SegmentedButtonEvent, SegmentedButtonState> {
  SegmentedButtonBloc() : super(const SegmentedButtonState()) {
    on<loadindex>(_loadindex);
  }
  void _loadindex(
      loadindex event,
      Emitter<SegmentedButtonState> emit,
      ) async {
    if (state.index == 0) {
      emit(const SegmentedButtonState(isLoading:true));
      emit(const SegmentedButtonState(index: 0));
      print("loula"+state.index.toString());
    }
    else if (state.index == 1){
      emit(const SegmentedButtonState(isLoading:true));
      emit(const SegmentedButtonState(index: 1));
      print("theniya"+state.index.toString());
    }
    emit(const SegmentedButtonState(isFailed:true));
  }

}
