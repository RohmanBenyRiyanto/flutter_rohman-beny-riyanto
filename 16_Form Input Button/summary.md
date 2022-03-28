# (16)  Form Input Button

| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :


## 1. Form
Flutter menyediakan widget Form untuk membuat formulir . Widget form bertindak sebagai wadah, yang memungkinkan kita untuk mengelompokkan dan memvalidasi beberapa bidang formulir. Saat membuat formulir, juga perlu menyediakan GlobalKey. Kunci ini secara unik mengidentifikasi formulir dan memungkinkan untuk melakukan validasi apa pun dalam widget formulir tersebut.

## 2. Input
Widget ini pada dasarnya berguna untuk membaca inputand dari user, dapat inputanya pun dapat memilih untuk memakai type data apa saja yang di sediakan pada bahasa dart. Salah satu inputan yang ada dalam flutter adalaha widget TextFormField.

## 3. Button
Button adalah elemen kontrol grafis yang menyediakan pengguna untuk memicu suatu peristiwa seperti mengambil tindakan, membuat pilihan, mencari sesuatu, dan banyak lagi . Mereka dapat ditempatkan di mana saja di UI kami seperti dialog, formulir, kartu, bilah alat, dll. Dalam flutter terdapat benyak jenis dari button, salah satunya adalah ElevatedButton.

# Task
Pada task ini saya membuah sebuah aplikasi dengan 2 layar yang berbeda, pada layar pertama saya membuah sebuah *listview* untuk menampikan *daftar list* dari data *kontak*, dalam layar kedua saya membuat sebuah *input form* untuk membuat sebuah *kontak baru* yang nantinya akan di tampilkan dalam list view. Terdapat banyak improvisasi dalam task ini, seperti halnya saya menambahkan widget *Dismissible* yang berguna untuk *menghapus* data dari listview. Selain dismissible saya juga menambahkan List *filter* menggunakan properti dari list yaitu *where*, filter ini berguna untuk *mencari* atau *mensortir* data dari list apa yang akan di tampilkan sesuai inputan dari user.

Berikut hasil dari praktikum ini :

[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/16_Form%20Input%20Button/praktikum/praktikum_16)<br>
[View Secreenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/16_Form%20Input%20Button/screenshot)

## 1 Task Nomor 1
Pada task 1 ini saya akan menjelaskan bagaimana saya menampikan data list kedalam listview. 

### Source Code :
[Lihat Class User Model dan Data List](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/16_Form%20Input%20Button/praktikum/praktikum_16/lib/models/users.dart)<br>

```dart
/*Karena dalam task ini terlalu panjang, dalam summary ini hanya saya tampikan
kode kode yang menjadi inti dari task ini*/

//Memanggil data list dan user model dari class User Model
List<User> users = UserList;

// Method yang akan digunakan untuk mengholah data dari class AddContact
void _addUsersData(User user) {
    setState(() {
/* Melakukan penambahan data pada list UserList(dari class User Model)
data yang di tambahkan akan berada dalam element 0, maka akan di tampikan
data terbaru pada listview paling atas*/
      UserList.insert(0, user);
      // UserList.add(user);
    });
  }

/*Memanggil costum Button yang saya buat (terdapat pada folder
lib/component)*/
OutlineIconsButton(
    icons: 'assets/icons/add.svg',
    press: () {
// Memanggila Navigator.push untuk melakukan perpindahan halaman
        Navigator.push(
          context,
// Package Transition
          Transition(
          child: AddContact( // Memanggil class AddContact
// Membawa method _addUsersData yang nantinya akan di isi dengan data dari form
           addUser: _addUsersData,
          ),
// Menambahkan transition efek.
          transitionEffect: TransitionEffect.FADE,
          ),
        );
    },
),

// Menampikan data dari list user model ke dalam Listview
/*Terdapat properti dan function yang saya panggil seperti (usersOnSearch)
dan tidak saya tampikan properti dan method nya karena kode tersebut hanya 
imporvisasi dari saya sendiri dan tidak wajib dalam task ini. Untuk lebih 
lengkapnya dapat dilihat pada folder praktikum*/
ListView.builder(
    itemCount: _searchController!.text.isNotEmpty
        ? usersOnSearch.length
/* users.length berguna untuk menampilkan semua data yang berada
dalam data list user model*/
        : users.length,
    itemBuilder: (context, index) {
/* Membuat local variable yang menyatakan bahwa (users[index]) dirubah
namanya menjadi (user).*/
        final user = users[index];
// Memanggil class ContactCard yang saya berisi model ui dari card kotak tersebut.
    return ContactCard(
        imageURL: _searchController!.text.isNotEmpty
            ? usersOnSearch[index].avatar
// Menampilkan data avatar(link) pada constructor imageURL
            : user.avatar,
        name: _searchController!.text.isNotEmpty
            ? usersOnSearch[index].name
// Menampilkan data name pada constructor name
            : user.name,
        phone: _searchController!.text.isNotEmpty
            ? usersOnSearch[index].phone
// Menampilkan data phone pada constructor phone
            : user.phone,
        ),
```

## 2 Task Nomor 2
Pada task 1 ini saya akan menjelaskan bagaimana saya membuat sebuah form yang akan digunakan datanya pada Listview.

### Source Code :
```dart
// Membut Constructor yang tadi di isi dalam class home_page dengan method _addUsersData
final Function(User) addUser;

const AddContact({
 Key? key,
 required this.addUser,
 }) : super(key: key);

// Membuat Textfield controller untuk menampung data inputan user
TextEditingController _nameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _avatarController = TextEditingController();

// Clear Textfield
@override
void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _avatarController.dispose();
    super.dispose();
}

/*Memanggil costum widget textfield yang saya buat, terdapat pada folder lib/
component*/

// TextField Name
InputText(
// pengondisian bahwa value akan di tampung dalam properti _nameController
    controller: _nameController,
    hintText: 'Enter user name. . .',
    label: 'Username',
// Memilih type keyboard dengan name.
    keyboardType: TextInputType.name,
),

// TextField Phone
InputText(
// pengondisian bahwa value akan di tampung dalam properti _phoneController
    controller: _phoneController,
    hintText: 'Enter user number. . .',
    label: 'Photo Profile',
// Memilih type keyboard dengan number.
    keyboardType: TextInputType.number,
),

// TextField Phone
InputText(
// pengondisian bahwa value akan di tampung dalam properti _phoneController
    controller: _phoneController,
    hintText: 'Enter user number. . .',
    label: 'Photo Profile',
// Memilih type keyboard dengan number.
    keyboardType: TextInputType.number,
),

// Memanggil Costum button yang saya buat terdapat dalam folder(lib/component)
PrimaryButton(
    text: 'Submit',
    press: () {
// Membuat local properti dari class (User Model) dan di beri nama (user).
        final user = User(
// Menambahkan value _nameController kedalam constructor name
        name: _nameController.text.toString(),
// Menambahkan value _avatarController kedalam constructor avatar
        avatar: _avatarController.text.toString(),
// Menambahkan value _phoneController kedalam constructor phone
        phone: _phoneController.text.toString().toString(),
        );
/* Melakukan pemanggilan constructor yang sudah berisi method
 _addUsersData dengan value dari user yang sudah di isi dengan
  value dari controller*/
        widget.addUser(user);
        _showToast();
        },
    ),
```

## Output :
