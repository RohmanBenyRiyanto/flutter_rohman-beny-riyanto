import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_16/models/users.dart';

import 'delete_contact_event.dart';
import 'delete_contact_state.dart';

class DeleteContactBloc extends Bloc<DeleteContactEvent, DeleteContactState> {
  DeleteContactBloc() : super(DeleteContactState(UserList)) {
    on<DeleteContacts>(
      (DeleteContacts event, emit) => emit(
        DeleteContactState(
          // UserList.removeAt(UserList.indexOf(event.contacts)),
          List.from(UserList)..remove(event.contacts),
        ),
      ),
    );
  }
}
