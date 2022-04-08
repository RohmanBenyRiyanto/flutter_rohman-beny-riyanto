import 'package:equatable/equatable.dart';

import '../../models/users.dart';


class DeleteContactState extends Equatable {
  final List<User> contacts;

  const DeleteContactState(
    this.contacts,
  );

  @override
  List<Object?> get props => [contacts];
}
