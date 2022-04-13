import 'package:equatable/equatable.dart';

import '../../models/users.dart';

abstract class ContactEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddContacts extends ContactEvent {
  final String? name;
  final String? avatar;
  final String? phone;
  final String? status;
  final String? gender;
  final String? hobi;

  AddContacts(
    this.name,
    this.avatar,
    this.phone,
    this.status,
    this.gender,
    this.hobi,
  );
}

class SaveContact extends ContactEvent {}

class LoadContact extends ContactEvent {}

class ClearContact extends ContactEvent {}
