import 'package:equatable/equatable.dart';

import '../../models/users.dart';

abstract class DeleteContactEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeleteContacts extends DeleteContactEvent {
  final User contacts;

  DeleteContacts(this.contacts);
}
