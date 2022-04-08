import 'package:equatable/equatable.dart';

import '../models/users.dart';

abstract class ContactEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// class Increment extends ContactEvent {}

// class Decrement extends ContactEvent {}

class AddContacts extends ContactEvent {
  final User contact;

  AddContacts(this.contact);
}
