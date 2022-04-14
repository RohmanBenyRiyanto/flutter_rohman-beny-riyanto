# (23) Flutter Animation
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### 1. Apa itu local storage
Pada framework flutter, local storage adalah sebuah penyimpanan yang menyimpan data dari aplikasi flutter pada device pengguna (memory internal).
Salah satu contoh penggunaanya adalah : local storage menyimpan token login user saat user melakukan login pada aplikasi flutter, token tersebut disimpan di dalam memory internal pengguna yang dapat bermanfaat agar pengguna tidak selalu melakukan login setiap masuk pada aplikasi flutter.

### 2. Shared Preferences
Shared Preferences adalah cara yang dapat menyimpan dan mengambil sejumlah kecil data primitif sebagai pasangan key/value ke file di penyimpanan perangkat seperti String, int, float, Boolean yang membentuk preferensi Anda dalam file XML di dalam aplikasi pada penyimpanan perangkat.

### Local Database (SQL Lite)
SQLite adalah database SQL opensource yang menyimpan data ke file teks pada perangkat . Android hadir dengan implementasi database SQLite bawaan. SQLite mendukung semua fitur database relasional. Untuk mengakses database ini, Anda tidak perlu membuat koneksi apa pun seperti JDBC, ODBC, dll.

# Task 
Pada task 23 ini, saya membuat 2 buah aplikasi yang menerapkan shared preferences. Kedua aplikasi tersebut di bedakan berdasarkan package state management yang digunakan, untuk aplikasi pertama menggunakan BLOC, dan untuk aplikasi kedua menggunakan package Provider.

## Task 1
```dart
/// NOTE : USER CONTACT MODEL
import 'dart:convert';

class User {
  final String? name;
  final String? avatar;
  final String? phone;
  final String? status;
  final String? gender;
  final String? hobi;

  User({
    this.name,
    this.avatar,
    this.phone,
    this.status,
    this.gender,
    this.hobi,
  });

/// Merubah Object user menjadi json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      avatar: json['avatar'],
      phone: json['phone'],
      status: json['status'],
      gender: json['gender'],
      hobi: json['hobi'],
    );
  }

/// Merubah Object user json menjadi Map String , Dyaminc.
  static Map<String, dynamic> toMap(User user) => {
        "name": user.name,
        "avatar": user.avatar,
        "phone": user.phone,
        "status": user.status,
        "gender": user.gender,
        "hobi": user.hobi,
      };

/// NOTE : Encode Data
  static String encode(List<User> UserList) => json.encode(
        UserList.map<Map<String, dynamic>>((us) => User.toMap(us)).toList(),
      );

/// NOTE : Decode Data
  static List<User> decode(String UserList) =>
      (json.decode(UserList) as List<dynamic>)
          .map<User>((item) => User.fromJson(item))
          .toList();
}
/// NOTE : Provider

/// NOTE : Properti usersave mengambil data list yang sudah ada
  List<User> userSave = userList;

/// NOTE : Properti _userload berisi list kosong (di awal)
  List<User> _userLoad = [];
  List<User> get userLoad => _userLoad;

/// NOTE : Method Add Contact
  void addContact(User users) {
/// NOTE : Menambahkan data pada usersave pada element 0
    userSave.insert(0, users);
/// NOTE : Memanggil Method saveData (Shared Preferences)
    saveData();
/// NOTE : Memanggil Method loadData (Shared Preferences)
    loadData();
    notifyListeners();
  }

/// NOTE : Method SaveData (Shared Preferences)
  void saveData() async {
/// NOTE : Memanggil Shared Preferences, dinamain dengan prefs
    SharedPreferences prefs = await SharedPreferences.getInstance();

/// NOTE : Melakukan jsonEncose to String (data UserSave)
    String json = jsonEncode(userSave.toString());
/// NOTE : encodeData menggunakan method dari class User
    final String encodeData = User.encode(
      userSave,
    );
/// NOTE : menyimpan data encodeData ke Shared Preferences
    prefs.setString('MyUser_Key', encodeData);
    notifyListeners();

/// NOTE : Method Load data (Shared Preferences)
  void loadData() async {
/// NOTE : Memanggil Shared Preferences, dinamain dengan prefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String? contactString = await prefs.getString('MyUser_Key');
      final List<User> usersSp = User.decode(contactString!).toList();
      String? json = prefs.getString('MyUser_Key');
      print(json);
      _userLoad = usersSp;
    } catch (Excepetion) {
      print('Data Null');
    }

    notifyListeners();
  }

/// NOTE : Penggunaan method addContact (Provider) pada halaman add contact
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

/// NOTE : Penggunaan pada halaman Contact

/// NOTE : menggunakan function initsate di isi dengan method loadData
  @override
  void initState() {
    super.initState();
    Provider.of<Contact>(context, listen: false).loadData();
  }

/// Data Ditampilkan dalam listview
ListView.builder(
                    itemCount: contactProvider.userLoad.length,
                    itemBuilder: (ctx, index) {
                      final user = contactProvider.userLoad[index];
                      return ContactCard(
                            imageURL: user.avatar!,
                            name: user.name!,
                            phone: user.phone!,
                          ), 
                        ),
```

### Output Task 1 :
[Click Me](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/23_Storage/screenshot/Demo%20Provider.mkv)

## Task 1
```dart
/// NOTE : USER CONTACT MODEL
import 'dart:convert';

class User {
  final String? name;
  final String? avatar;
  final String? phone;
  final String? status;
  final String? gender;
  final String? hobi;

  User({
    this.name,
    this.avatar,
    this.phone,
    this.status,
    this.gender,
    this.hobi,
  });

/// Merubah Object user menjadi json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      avatar: json['avatar'],
      phone: json['phone'],
      status: json['status'],
      gender: json['gender'],
      hobi: json['hobi'],
    );
  }

/// Merubah Object user json menjadi Map String , Dyaminc.
  static Map<String, dynamic> toMap(User user) => {
        "name": user.name,
        "avatar": user.avatar,
        "phone": user.phone,
        "status": user.status,
        "gender": user.gender,
        "hobi": user.hobi,
      };

/// NOTE : Encode Data
  static String encode(List<User> UserList) => json.encode(
        UserList.map<Map<String, dynamic>>((us) => User.toMap(us)).toList(),
      );

/// NOTE : Decode Data
  static List<User> decode(String UserList) =>
      (json.decode(UserList) as List<dynamic>)
          .map<User>((item) => User.fromJson(item))
          .toList();
}
/// NOTE : BLOC
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc()
      : super(
          ContactState(
            [
              User(
                name: "Kim Ji-soo",
                avatar:
                    "https://i.pinimg.com/236x/a2/31/01/a2310147775da5802d3e2b5ba458bdd8.jpg",
                phone: "+821055570582",
                status: "Belum Menikah",
                gender: "Perempuan",
                hobi: 'Sing',
              ),
            ],
          ),
        ) {
    on<AddContacts>(
      (event, emit) async {
        List<User> newList = List.from(state.contact)
          ..add(
            User(
              name: event.name!,
              avatar: event.avatar!,
              phone: event.phone!,
              status: event.status!,
              gender: event.gender,
              hobi: event.hobi,
            ),
          );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String listContact = User.encode(newList);
        await prefs.setString('contactsBLOC', listContact);
        emit(ContactState(newList));
        print('Add Contacts : $newList');
      },
    );
    on<LoadContact>(
      (event, emit) async {
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final String? dataContactString = prefs.getString('contactsBLOC');
          List<User> datas = User.decode(dataContactString!);
          print('Load : $datas');
          emit(ContactState(datas));
        } catch (Excepetion) {
          print('Load Kosong');
        }
      },
    );

    on<ClearContact>(
      (event, emit) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        print('Data Clear');
        emit(ContactState(state.contact));
      },
    );
  }
}
```

### Output Task 2 :
[Click Me](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/23_Storage/screenshot/Demo%20Block.mkv)