# (21) Flutter State Management (BLoC)
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### 1. Apa Itu Declarative UI
Declarative UI merupakan tren baru yang memungkinkan para pengembang merancang antarmuka pengguna berdasarkan data yang diterima . Ini di sisi lain berfokus pada Paradigma desain ini menggunakan satu bahasa pemrograman untuk membuat seluruh aplikasi.

### 2. SetState
setState adalah cara untuk mengubah UI secara dinamis.

### 3. Bloc
Bloc adalah pola desain yang dibuat oleh Google untuk membantu memisahkan logika bisnis dari lapisan presentasi dan memungkinkan pengembang untuk menggunakan kembali kode secara lebih efisien.

# Task
Pada task kali ini saya membuat aplikasi contact yang dapat melakukan penambahan contact dengan membuat state menggunakan **Bloc**.

[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/21_Flutter%20State%20Management%20(BLoC)/praktikum/praktikum_21)<br>
[View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/21_Flutter%20State%20Management%20(BLoC)/screenshot)

### Source Code :

```dart
/// NOTE : USER MODEL
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

/// NOTE : USER LIST
List<User> UserList = [
  User(
    name: "Kim Ji-soo",
    avatar:
        "https://i.pinimg.com/236x/a2/31/01/a2310147775da5802d3e2b5ba458bdd8.jpg",
    phone: "+821055570582",
    status: "Belum Menikah",
    gender: "Perempuan",
    hobi: 'Sing',
  ),
  User(
    name: "Lalisa Manoban",
    avatar:
        "https://i.pinimg.com/564x/67/1e/d0/671ed042fe28a90fbd61f7ce95d0ec6e.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Kim Jennie",
    avatar:
        "https://i.pinimg.com/564x/bf/34/e2/bf34e2cc7a7edb721120a54b3d29ccd0.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Rosé",
    avatar:
        "https://i.pinimg.com/564x/d6/81/b5/d681b52afbcdceb338d3f50f0b1debd2.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Shin Ryu-jin",
    avatar:
        "https://i.pinimg.com/564x/7e/b1/60/7eb16069cd22cdb218301764d2fdda73.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Tzuyu",
    avatar:
        "https://i.pinimg.com/564x/28/b0/da/28b0da3f959f295501e130685a08355f.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Joy",
    avatar:
        "https://i.pinimg.com/564x/01/2d/36/012d36cbab5da065ae98ba80f7ee2ba5.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Han So Hee",
    avatar:
        "https://i.pinimg.com/564x/5a/fc/c2/5afcc221287f364ce09b7852fe542e97.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Kim Da-mi",
    avatar:
        "https://i.pinimg.com/564x/5d/43/3b/5d433b62c2ae48071e37d0bee6936a60.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Im Yoon-ah",
    avatar:
        "https://i.pinimg.com/564x/f8/b7/b6/f8b7b68ed4c2db7ae7437c5383d0b2f3.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Lee Ji-eun",
    avatar:
        "https://i.pinimg.com/564x/34/98/11/34981181cda932bc5fabec9c2b8bac62.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Bae Suzy",
    avatar:
        "https://i.pinimg.com/564x/0e/a3/81/0ea381cdad7bdb6d332956885e01dc41.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
];

/// NOTE : BLOC

/// NOTE : CONTACT STATE
class ContactState extends Equatable {
  final List<User>? contact;

  const ContactState(
    this.contact,
  );

  @override
  List<Object?> get props => [contact];
}

/// NOTE CONTACT EVENT
abstract class ContactEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddContacts extends ContactEvent {
  final User contact;

  AddContacts(this.contact);
}

/// NOTE : CONTACT BLOC
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactState(UserList)) {
    on<AddContacts>(
      (AddContacts event, emit) => emit(
        ContactState(
          List.from(UserList)..insert(0, event.contact),
        ),
      ),
    );
  }
}

/// NOTE : ADD BLOC IN MAIN FILE (GLOBAL STATE)
@override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (context) => ContactBloc(),
      child: MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Contact App',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/add-contact': (context) => const AddContact(),
        },
      ),
    );
}

/// NOTE : USE BLOC STATE IN ADD CONTACT CLASS
BlocBuilder<ContactBloc, ContactState>(
      builder: (BuildContext context, state) {
          return // Widget
      }

/// NOTE : CALL ADD CONTACT FROM BLOC IN BUTTON FORM
 context.read<ContactBloc>().add(
        AddContacts(
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
            ),
        );
    Navigator.pop(context);

/// NOTE : USE LIST IN LISTVIEW BUILDER
ListView.builder(
                itemCount: state.contact!.length,
                itemBuilder: (context, index) {
                return ContactCard(
                        imageURL: state.contact![index].avatar,
                        name: state.contact![index].name,
                        phone: state.contact![index].phone,
                ),
            }
)
```

### Output :
<img src="https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/21_Flutter%20State%20Management%20(BLoC)/screenshot/Screenshot_1648806394.png" width="400">   <img src="https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/21_Flutter%20State%20Management%20(BLoC)/screenshot/Screenshot_1648806409.png" width="400">
