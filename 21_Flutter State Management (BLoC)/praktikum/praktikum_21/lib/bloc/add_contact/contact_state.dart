import 'package:equatable/equatable.dart';

import '../../models/users.dart';


class ContactState extends Equatable {
  final List<User>? contact;

  const ContactState(
    this.contact,
  );

  @override
  List<Object?> get props => [contact];

  get contacts => null;
}
