import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(const ContactsState()) {
    on<loadcontacts>(_loadcontacts);
  }
}
void _loadcontacts(
    loadcontacts event,
    Emitter<ContactsState> emit,
    ) async {
  emit(const ContactsState(isLoading:true));
  try {
    emit(const ContactsState(isFailed:false));
    emit(const ContactsState(success:true));
  } catch (e) {
    print(e);
    emit(const ContactsState(isFailed:true));
    emit(const ContactsState(success:false));
  }

}
