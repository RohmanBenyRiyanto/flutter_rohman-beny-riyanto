# Basic Dart Programming
Pada task ini, membuat sebuah program menggunakan bahasa dart untuk menghitung luas lingkarang dan membuat 3 variabel string dan di tampilkan.

Berikut hasil dari praktikum ini.<br>
[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/04_Introduction%20to%20Algorithm%20and%20Dart%20Programming/praktikum/praktikum_introduction_to_algorithm_and_dart_programming/bin)<br>
[View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/04_Introduction%20to%20Algorithm%20and%20Dart%20Programming/screenshot)<br>
[Live Run](https://replit.com/@ROHMANBENYRIYAN/Luas-Lingkarang#main.dart)

## 1. Soal Nomor 1

### a. Cara 1 Menggunakan Input Console

#### Source Code :

```dart
  import 'dart:io';
  // Mathematical library
  import 'dart:math' show pi;

  //Value berdasarkan Inputan dari console
  void main() {
  // Deklarasi variable area mengguanakn tipe data double
  double area;

  // Menampilkan data string
  print('Masukkan panjang jari-jari lingkaran: ');
  // Membaca inputan dari console
  var num1 = stdin.readLineSync();
  // merubah num1 (inputan dari console) menjadi bertipe data double 
  var num2 = double.parse(num1!);

  // Melakukan perkalian 3.14 * value * value
  area = pi * num2 * num2;
  // Menjadikan hasil perkalian dari double menjadi string dengan nilai di belakang koma 2 digit
  String number = area.toStringAsFixed(2);
  
  // Menampilkan hasil luas lingkaran
  print('Luas lingkaran adalah $number')
}
```

#### Output :
```PowerShell
  PS D:\Kampus Merdeka\Alterra Academy\Tugas\flutter_rohman-beny-riyanto\04_Introduction to Algorithm and Dart Programming\praktikum\praktikum_introduction_to_algorithm_and_dart_programming\bin> dart main.dart
  Masukkan panjang jari-jari lingkaran:
  20.0
  Luas lingkaran adalah 1256.63
```

### b. Cara 2 menggunakan Value Yang Sudah Di Deklarasikan


```dart
//Value berdasarkan value yang sudah di deklarasikan
void main() {
  // Deklarasi variable value dan area mengguanakn tipe data double
  double value, area;
  // Menambahkan expression pada variable value bertype double dengan nilai 10.0
  value = 10.0;

  // Melakukan perkalian 3.14 * value * value
  area = pi * value * value;
  // Menjadikan hasil perkalian dari double menjadi string dengan nilai di belakang koma 2 digit
  String number = area.toStringAsFixed(2);
  
  // Menampilkan hasil luas lingkaran
  print('Luas lingkaran adalah $number');
}
```

#### Output :
```PowerShell
  Connecting to VM Service at http://127.0.0.1:59497/IwTcWAPBeeQ=/
  Luas lingkaran adalah 314.15
  Exited
```

## 2. Soal Nomor 2

#### Source Code
```dart
void main() {
  // Deklarasi variable firstName menggunakan tipe data String
  String? firstName = 'Rohman';
  // Deklarasi variable lastName menggunakan tipe data String
  String? lastName = 'Beny';
  // Deklarasi variable belajar menggunakan tipe data String
  String? belajar = 'Flutter';
  
  // Menggabungkan String dan menampilkan pada layar
  print('Hello nama saya adalah $firstName $lastName dan saya sedang belajar $belajar');
}
```

#### Output :
```PowerShell
  Connecting to VM Service at http://127.0.0.1:54234/QkASLf5_w_I=/
  Hello nama saya adalah Rohman Beny dan saya sedang belajar Flutter
  Exited
```
