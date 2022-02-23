# (4) Introduction to Algorithm and Dart Programming

| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A


## Hasil Resume :

### 1. Pengertian dan kenapa harus dart.
Dart adalah bahasa pemrograman yang dikembangkan oleh Google dan merupakan bahasa pemrograman resmi yang digunakan Flutter, membuat software menggunakan dart dapat meringkas waktu pengerjaan dikarenakan dart dan flutter berbasis cross platform. Dart berjalan pada sisi klien (Front End)

#### Kenapa harus dart?
- Type Safe <br> Menjamin konsistensi tipe data.
- Null Safety <br> Memberikan keamanan dari data bernilai hampa(null).
- Rich Standart Library <br> Hadir dengan banyak dukungan library internal.
- Multiplatfrom <br> Mampu berjalan pada berbagai perangkat.

### 2. Dasar pemrograman dart.
Dart dijalankan menggunakan fungsi, yaitu fungsi main, berikut contohnya.
```dart
void main() {
  print('Hello, World!');
}
```
#### Penjelasan :

**Fungsi Main**

```dart
void main() {}
```

- Bagian pertama yang akan di jalankan dari program.
- Dapat memiliki tipe data berupa void atau int.
- Memiliki variabel bernama main.


**Print**
```dart
  print('Hello, World!');
```
<br> Program di atas terdapat code bertulisakan print yang digunakan untuk mencetak data ke layar, dapat dilihat terdapat juga "Hello, World!". Nantinya system akan menampilkan data bertipe String yang berisikan text Hello World!

### 2. Komentar, Varibel, Tipe Data, Operator

#### Komentar
Komentar digunakan untuk menonaktifkan suatu baris kode, komentarpun terkadang digunakan untuk memberikan penjelasan pada suatu code. Komentar dalam dart terdapat dua jenis yaitu singgle line ( // ) dan multi line( /**/ ).


##### Contoh Komenter Singgle Line
```dart
  //Bahasa Pemrograman Dart
```


##### Contoh Komenter Multi Line
```dart
  /*Line satu
  Line dua
  Line tiga*/
```

#### Variabel
 Variabel adalah "ruang bernama dalam memori" yang menyimpan nilai. Dengan kata lain, ia bertindak sebagai wadah untuk nilai-nilai dalam suatu program . Nama variabel disebut pengidentifikasi.
 
 ```dart
var <variable_name>;
//atau
var <name> = <expression>;
```
#### Tipe data
Tipe data adalah jenis nilai yang akan disimpan pada variabel.
- Tipe data Angka (Number): int, double
- Tipe data teks: String
- Tipe data boolean: bool

#### Operator
Dart memiliki operator yang sama seperti bahasa C++, C#, Java, dan Javascript.<br>
Ada 6 kelompok operator dalam dart :
1. Operator Aritmatika
2. Operator Relasi
3. Operator Penugasan
4. Operator Logika
5. Operator Bitwise
6. Operator Ternary (?)

# Task
Pada task ini, membuat sebuah program menggunakan bahasa dart untuk menghitung luas lingkarang.

Berikut hasil dari praktikum ini.<br>
[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/04_Introduction%20to%20Algorithm%20and%20Dart%20Programming/praktikum/praktikum_introduction_to_algorithm_and_dart_programming/bin/main.dart)<br>
[View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/04_Introduction%20to%20Algorithm%20and%20Dart%20Programming/screenshot)<br>
[Live Run](https://replit.com/@ROHMANBENYRIYAN/Luas-Lingkarang#main.dart)

## 1. Menggunakan Input Console

### Source Code :

```dart
  import 'dart:io';
  // Mathematical library
  import 'dart:math' show pi;

  //Value berdasarkan Inputan dari console
  void main() {
  // variable area mengguanakn tipe data double
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

### Output :
```PowerShell
  PS D:\Kampus Merdeka\Alterra Academy\Tugas\flutter_rohman-beny-riyanto\04_Introduction to Algorithm and Dart Programming\praktikum\praktikum_introduction_to_algorithm_and_dart_programming\bin> dart main.dart
  Masukkan panjang jari-jari lingkaran:
  20.0
  Luas lingkaran adalah 1256.63
```

## 2. Menggunakan Value Yang Sudah Di Deklarasikan


```dart
//Value berdasarkan value yang sudah di deklarasikan
void main() {
  // variable value dan area mengguanakn tipe data double
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

### Output :
```PowerShell
  Connecting to VM Service at http://127.0.0.1:59497/IwTcWAPBeeQ=/
  Luas lingkaran adalah 314.15
  Exited
```

