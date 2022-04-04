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