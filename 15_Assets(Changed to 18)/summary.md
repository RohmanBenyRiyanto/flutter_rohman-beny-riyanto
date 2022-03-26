# (14) Assets (Change To Section 18)
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### 1. Apa itu Assets Flutter
Assets pada framework flutter adalah sebuah file yang digunakan dalam aplikasi flutter, jenis - jenis flutter assets pun sangat beragam. Jenis aset yang umum mencakup data statis (misalnya, file JSON), file konfigurasi, ikon, dan gambar (JPEG, WebP, GIF, WebP/GIF animasi, PNG, BMP, dan WBMP).

### 2. Cara menambahkan Assets
Flutter menggunakan pubspec.yaml file, terletak pada stuktur proyek flutter, untuk mengidentifikasi assets yang diperlukan oleh aplikasi.<br>
Berikut ini contohnya :

```dart
flutter:
  assets:
    - assets/my_icon.png
    - assets/background.png
```

Untuk memasukkan semua aset di bawah direktori, tentukan nama direktori dengan /karakter di akhir :

```dart
flutter:
  assets:
    - directory/
    - directory/subdirectory/
```

### 3. Cara menampikan assets
Cara menampilkan assets dalam flutter pun sangat beragam tergantung pada type - type filenya, salah satunya yang sering digunakan adalah file bertype jpg, png, svg dll.

Contoh penggunaan file gambar pada flutter : 

```dart
// Gambar dari assets lokal yang sudah di daftarkan pada pubspec.yaml
Image.asset('assets/images/nama_gambar.type file'),

// Gambar dari internet
Image.network('link gambar');
```

# Task 
Pada task ini saya membuat sebuah gallery aplikasi yang di dalamnya terdapat gambar - gambar dari internet, gambar tersebut saya tampilkan menggunakan GridView. Adapun ketentuan pada task ini seperti, apabila gambar ditekan akan berpindah pada halaman lain dan gambar akan di tampikan pada halaman baru tersebut.

Berikut hasil dari task ini :
[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/15_Assets(Changed%20to%2018)/praktikum/praktikum_15)<br>
[View Secreenshot]()