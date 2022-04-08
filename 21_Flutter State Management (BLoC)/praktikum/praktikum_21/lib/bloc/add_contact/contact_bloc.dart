import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_16/models/users.dart';

import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactState(UserList)) {
    on<AddContacts>(
      (AddContacts event, emit) => emit(
        ContactState(
          List.from(UserList)..insert(0, event.contact),
        ),
      ),
    );
  }
}
