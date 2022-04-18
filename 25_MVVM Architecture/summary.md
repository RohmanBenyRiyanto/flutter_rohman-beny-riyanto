# (25) MVVM Architecture
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :
### 1. Apa itu MVVM
Model-View-ViewModel adalah pola arsitektur perangkat lunak yang memfasilitasi pemisahan pengembangan antarmuka pengguna grafis – baik melalui bahasa markup atau kode GUI – dari pengembangan logika bisnis atau logika back-end sehingga tampilan tidak tergantung pada platform model tertentu.

### 2. Kenapa harus MVVP
Tujuan penggunaan MVVM sendiri adalah menjaga kode UI agar tetap sederhana dan tanpa mengandung app logic agar mudah untuk dikelola. Model adalah representasi dari data dan business logic dari aplikasi.

### Rules MVVP
Harus terdapat :
1. Model<br>
   Model adalah representasi dari data dan business logic dari aplikasi. Salah satu dari strategi implementasi model adalah membuat model dapat terbuka melalui observables agar terpisah antara ViewModel atau observer/ consumer.
2. ViewModel<br>
   ViewModel berinteraksi dengan model dan juga menyiapkan observables yang akan diobservasi oleh View. ViewModel dapat menyediakan hooks untuk view dan mem-pass events kepada model.
Salah satu implementasi strategi dari ViewModel adalah untuk memisahkannya dengan View. Contohnya ViewModel tidak seharusnya mengetahui View berinteraksi dengan siapa.
3. View<br>
   Tugas dari view pada MVVM adalah untuk observe sebuah ViewModel observable untuk mendapatkan data yang akan mengupdate UI/ tampilan.

# Task
Pada task ini saya membuat sebuah aplikasi yang terhubung dengan API, dalam aplikasi tersebut terdapat fitur create contact yang menggunakan package DIO dengan perintah post. Selain melakukan get dan post, saya juga melakukan perubahan data dari format json menjadi object dan juga sebaliknya. Aplikasi ini menggunakan MVVM Architecture

Berikut Hasil dari Praktikum ini : 

[View Code](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/25_MVVM%20Architecture/praktikum/praktikum_25)<br>
[View Secreenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/25_MVVM%20Architecture/screenshot)

## Task 1

### Source Code :

```dart
// NOTE : USER MODEL

class ContactModel {
  int? id;
  String? name;
  String? phone;

  ContactModel({
    this.id,
    this.name,
    this.phone,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  static Map<String, dynamic> toJson(ContactModel user) => {
        'id': user.id,
        'name': user.name,
        'phone': user.phone,
      };

  static String encode(List<ContactModel> userList) => json.encode(
        userList
            .map<Map<String, dynamic>>((us) => ContactModel.toJson(us))
            .toList(),
      );

  static List<ContactModel> decode(String userList) =>
      (json.decode(userList) as List<dynamic>)
          .map<ContactModel>((item) => ContactModel.fromJson(item))
          .toList();
}

// NOTE : Properti base URL (STRING), Menyimpan data url API
  String baseUrl =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';

// NOTE : GET data from api with DIO package
  Future<List<ContactModel>> getContacts() async {
    Response<List<dynamic>> response = await Dio().get(baseUrl);
    if (response.statusCode == 200) {
      List<ContactModel>? contactList =
          response.data?.map((items) => ContactModel.fromJson(items)).toList();
      return contactList ?? [];
    }
    return [];
  }

// NOTE : Post data from object to json ke dalam API
  Future<ContactModel?> createContact(ContactModel contact) async {
    ContactModel? contactData;
    Response response =
        await Dio().post(baseUrl, data: ContactModel.toJson(contact));

    if (response.statusCode == 200) {
      contactData = ContactModel.fromJson(response.data);
    } else {
      print(
          'Response Post : ${response.data} Status Code: ${response.statusCode}');
    }
    return contactData;
  }

// NOTE : Provider

// NOTE : List untuk menampung data dari api
  List<ContactModel> _contacts = [];

// NOTE : GET list untuk dapat di gunakan dalam widget
  List<ContactModel> get contacts => _contacts;

// NOTE : SET isi dari data list
  set contact(List<ContactModel> contacts) {
    _contacts = contacts;
    notifyListeners();
  }

// NOTE : Method getContact
  Future<List<ContactModel>> getContacts() async {
    List<ContactModel> contactsData = await ContactService().getContacts();
    contact = contactsData;
    notifyListeners();
    return contacts;
  }

// Note : Method Create Contact (Post)
  Future<bool> createContact(ContactModel contactAdd) async {
    try {
      await ContactService().createContact(contactAdd);

      print(
        'Contact created : \nId :   ${contactAdd.id}\nName : ${contactAdd.name}\nPhone : ${contactAdd.phone}',
      );
      _contacts.add(contactAdd);
      notifyListeners();
      return true;
    } catch (e) {
      print('Create Contact Error: $e');
      return false;
    }
  }
```



## Task 2

```dart
// NOTE : USER MODEL

class ContactModel {
  int? id;
  String? name;
  String? phone;

  ContactModel({
    this.id,
    this.name,
    this.phone,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  static Map<String, dynamic> toJson(ContactModel user) => {
        'id': user.id,
        'name': user.name,
        'phone': user.phone,
      };

  static String encode(List<ContactModel> userList) => json.encode(
        userList
            .map<Map<String, dynamic>>((us) => ContactModel.toJson(us))
            .toList(),
      );

  static List<ContactModel> decode(String userList) =>
      (json.decode(userList) as List<dynamic>)
          .map<ContactModel>((item) => ContactModel.fromJson(item))
          .toList();
}

  Future<List<ContactModel>> getContacts() async {
    Response<List<dynamic>> response = await Dio().get(baseUrl);
    if (response.statusCode == 200) {
// NOTE : Merubah hasil response (json) to List
      List<ContactModel>? contactList =
          response.data?.map((items) => ContactModel.fromJson(items)).toList();
      return contactList ?? [];
    }
    return [];
  }
```

## Output :

[View Demo](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/25_MVVM%20Architecture/screenshot/Demo.mp4)

Struktur Folder : <br>
<img src="screenshot/Struktur%20Folder.png" width="400">

