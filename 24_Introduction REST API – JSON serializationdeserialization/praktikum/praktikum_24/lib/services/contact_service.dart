import 'package:dio/dio.dart';

import '../models/contact_model.dart';

class ContactService {
  String baseUrl =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';

  Future<List<ContactModel>> getContacts() async {
    Response<List<dynamic>> response = await Dio().get(baseUrl);
    if (response.statusCode == 200) {
      List<ContactModel>? contactList =
          response.data?.map((items) => ContactModel.fromJson(items)).toList();
      return contactList ?? [];
    }
    return [];
  }

  Future<ContactModel?> getContactById(int id) async {
    Response<ContactModel> response = await Dio().get('$baseUrl/$id');

    if (response.statusCode == 200) {
      return response.data;
    }
  }

  Future<bool> createContact(ContactModel contact) async {
    Response response =
        await Dio().post(baseUrl, data: ContactModel.toJson(contact));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updateContact(ContactModel contact) async {
    Response response = await Dio()
        .put('$baseUrl/${contact.id}', data: ContactModel.toJson(contact));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
