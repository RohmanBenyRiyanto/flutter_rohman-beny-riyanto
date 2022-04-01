# (19) Flutter Navigation
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### 1. Pengertian Flutter Navigation
Flutter Navigation adalah sebuah class yang dapat di panggil guna untuk melakukan perpindahan dari halaman satu ke halaman lainya, Flutter Navigation digunakan dengan cara memanggil class Navigator yang mengelola stack objek Route dan menyediakan dua cara untuk mengelola stack, Navigator API deklaratif. halaman atau Navigator API imperatif. mendorong dan Navigator .

### 2. Navigation Dasar
Navigation Dasar dapat digunakan dengan cara sebagai berikut :
```dart
// Perpindahan halaman yang di tentukan
Navigator.push();

// Kembali ke halaman sebelumnya
Navigator.pop();
```

### 2. Navigation Dengan Named Routes
Jenis Navigation yang kedua ini, untuk menggunakanya kita harus mendaftarkan terlebih dahulu di dalam (MaterialAPP) seperti contoh berikut :
```dart
// initialRoute digunakan untuk menentukan halaman pertama yang akan di tampikan
initialRoute: '/',
// routes berisi nama - nama class dari halaman yang akan digunakna
//routes memiliki type data yaitu map.
routes: {
        '/': (context) => const HomePage(),
        '/add-contact': (context) => const AddContact(),
},
```

Cara penggunaanya pun lebih simple di bandingkan menggunakan MaterialPageRoute. Beriktu cara penggunaan routes :
```dart
Navigator.pushNamed(context, namaRoutes);
```

# Task
Pada task kali ini saya membuat aplikasi contact yang dapat melakukan perpindahan halaman ke halaman add_contact, perpindahan halaman tersebut menggunakan perintah Navigator.pushnamed.

Berikut Hasil dari praktikum ini :

[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/19_Flutter%20Navigation/praktikum/praktikum_19)<br>
[View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/19_Flutter%20Navigation/screenshot)

## Penyelesaian
Pada task ini saya menampilkan halaman contact berisi listview dengan data dari list UserModel, apabila list di tekan akan berpindah pada halaman AddContact(). Berikut code cara penggunanan Navigator.push named

### Source Code :

```dart
// Mendagtarkan route pada class main di dalam MaterialApp
return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Contact App',
      initialRoute: '/', // Yang pertama ditampilkan adalah halaman HomePAge().
      routes: {
        '/': (context) => const HomePage(),
        '/add-contact': (context) => const AddContact(),
      },
    );

// Penggunaan routes AddContact()
Navigator.pushNamed(context, '/add-contact').then(_perbaruiData);
```

### Output :
<img src="https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/19_Flutter%20Navigation/screenshot/Screenshot_1648806394.png" width="400">   <img src="https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/19_Flutter%20Navigation/screenshot/Screenshot_1648806409.png" width="400">