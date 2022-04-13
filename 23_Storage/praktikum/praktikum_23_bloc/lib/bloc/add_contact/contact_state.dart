import 'package:equatable/equatable.dart';

import '../../models/users.dart';

class ContactState extends Equatable {
  List<User> contact;

  ContactState(
    this.contact,
  );

  @override
  List<Object?> get props => [contact];
}
