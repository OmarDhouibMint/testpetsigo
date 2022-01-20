import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(const ContactsState()) {
    on<loadcontacts>(_loadcontacts);
  }
  void _loadcontacts(
      loadcontacts event,
      Emitter<ContactsState> emit,
      ) async {
    if (state.success.isValidated) {
      emit(const ContactsState(isLoading:true));
      emit(const ContactsState(index: 0));
    }
    emit(const ContactsState(isFailed:true));
  }


}

