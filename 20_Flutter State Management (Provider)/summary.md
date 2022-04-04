# (20) Flutter State Management (Provider)
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### 1. Apa itu state
State adalah data yang dapat dibaca saat pembuatan widget, state dapat merubah widget saat sedang aktif. Flutter state pada dasarnya hanya dimiliki oleh stateful widget.
### 2. Navigation Dasar
Navigation Dasar dapat digunakan dengan cara sebagai berikut :
```dart
// Perpindahan halaman yang di tentukan
Navigator.push();

// Kembali ke halaman sebelumnya
Navigator.pop();
```

### 2. Global State
Global State memungkinkan user memasukkan data ke dalam objek global yang dapat diakses dari widget apa pun . Tidak perlu melewati keadaan antara widget yang berbeda. Meskipun global state memungkinkan data untuk dibagikan dan diakses dengan mudah dari widget yang berbeda, state tersebut tidak menggantikan state lokal.

### 3. Provider
Package provider adalah package yang mudah digunakan dan pada dasarnya merupakan pembungkus di sekitar InheritedWidgets yang membuatnya lebih mudah untuk digunakan dan dikelola.

# Task
Pada task kali ini saya membuat aplikasi contact yang dapat melakukan penambahan contact dengan membuat state menggunakan provider.

Berikut Hasil dari praktikum ini :

[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/20_Flutter%20State%20Management%20(Provider)/praktikum/praktikum_20)<br>
[View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/20_Flutter%20State%20Management%20(Provider)/screenshot)

### Source Code :

```dart
// Users model
class User {
  final String name;
  final String avatar;
  final String phone;
  final String? status;
  final String? gender;
  final String? hobi;

  User({
    required this.name,
    required this.avatar,
    required this.phone,
    this.status,
    this.gender,
    this.hobi,
  });
}

// State Provider add contact
import 'package:flutter/widgets.dart';
import '../models/users.dart';

class Contact with ChangeNotifier {
  final List<User> _users = UserList;
  List<User> get users => _users;

  List<User> _usersOnSearch = [];
  List<User> get usersOnSearch => _usersOnSearch;

  void addContact(User users) {
    _users.insert(0, users);
    notifyListeners();
  }
}

// Mendaftarkan provider pada main.dart
MultiProvider(
    providers: [
    ChangeNotifierProvider(
        create: (context) => Contact(),
     ),
    ],
    child: const MyApp(),
),

//Penggunaan pada widget widget
  final contactProvider = Provider.of<Contact>(context);
   ListView.builder(
                    itemCount: contactProvider.users.length,
                    itemBuilder: (context, index) {
                      final user = contactProvider.users[index];
                      return ContactCard(
                            imageURL:user.avatar,
                            imageURL:user.avatar,
                            phone: user.phone,
                          ),
// Penggunaan pada add contact
contactProvider.addContact(
                    User(
                      name: _nameController.text,
                      avatar: _avatarController.text,
                      phone: _phoneController.text,
                      status: _value,
                      gender: _selectedGender == 'Laki - Laki'
                          ? 'Laki - Laki'
                          : 'Perempuan',
                      hobi: multipleSelected.join('').toString(),
                    ),
                  );
```

### Output :
<img src="https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/20_Flutter%20State%20Management%20(Provider)/screenshot/Screenshot_1648806394.png" width="400">   <img src="https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/20_Flutter%20State%20Management%20(Provider)/screenshot/Screenshot_1648806409.png" width="400">