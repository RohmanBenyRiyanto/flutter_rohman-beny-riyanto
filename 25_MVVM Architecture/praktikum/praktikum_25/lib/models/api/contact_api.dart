import 'package:dio/dio.dart';

import '../contact_model.dart';

class ContactService {
  String baseUrl =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';

  Future<List<ContactModel>> getContacts() async {
    Response<List<dynamic>> response = await Dio().get(baseUrl);
    if (response.statusCode == 200) {
      List<ContactModel>? contactList =
          response.data?.map((items) => ContactModel.fromJson(items)).toList();
      print('Contact: ${response.data}');
      return contactList ?? [];
    }
    return [];
  }

  Future<ContactModel?> createContact(ContactModel contact) async {
    ContactModel? contactData;
    Response response =
        await Dio().post(baseUrl, data: ContactModel.toJson(contact));

    if (response.statusCode == 201) {
      contactData = ContactModel.fromJson(response.data);
    } else {
      print(
          'Response Post : ${response.data} Status Code: ${response.statusCode}');
    }
    return contactData;
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
