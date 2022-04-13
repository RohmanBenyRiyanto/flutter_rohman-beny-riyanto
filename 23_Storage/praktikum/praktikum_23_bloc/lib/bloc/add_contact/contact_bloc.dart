import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_16/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc()
      : super(
          ContactState(
            [
              User(
                name: "Kim Ji-soo",
                avatar:
                    "https://i.pinimg.com/236x/a2/31/01/a2310147775da5802d3e2b5ba458bdd8.jpg",
                phone: "+821055570582",
                status: "Belum Menikah",
                gender: "Perempuan",
                hobi: 'Sing',
              ),
            ],
          ),
        ) {
    on<AddContacts>(
      (event, emit) async {
        List<User> newList = List.from(state.contact)
          ..add(
            User(
              name: event.name!,
              avatar: event.avatar!,
              phone: event.phone!,
              status: event.status!,
              gender: event.gender,
              hobi: event.hobi,
            ),
          );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String listContact = User.encode(newList);
        await prefs.setString('contactsBLOC', listContact);
        emit(ContactState(newList));
        print('Add Contacts : $newList');
      },
    );
    on<LoadContact>(
      (event, emit) async {
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final String? dataContactString = prefs.getString('contactsBLOC');
          List<User> datas = User.decode(dataContactString!);
          print('Load : $datas');
          emit(ContactState(datas));
        } catch (Excepetion) {
          print('Load Kosong');
        }
      },
    );

    on<ClearContact>(
      (event, emit) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        print('Data Clear');
        emit(ContactState(state.contact));
      },
    );
  }
}
