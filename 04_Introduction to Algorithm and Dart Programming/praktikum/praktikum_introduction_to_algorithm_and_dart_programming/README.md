# Menghitung Luas Lingkaran Menggunakan Dart

## 1. Menggunakan Input Console

### Source Code :

```dart
  import 'dart:io';
  import 'dart:math' show pi;

  //Value berdasarkan Inputan dari console
  void main() {
  double area;

  print('Masukkan panjang jari-jari lingkaran: ');
  var num1 = stdin.readLineSync();
  var num2 = double.parse(num1!);

  area = pi * num2 * num2;
  print('Luas lingkaran adalah $area');
}
```

### Output :
```PowerShell
  PS D:\Kampus Merdeka\Alterra Academy\Tugas\flutter_rohman-beny-riyanto\04_Introduction to Algorithm and Dart Programming\praktikum\praktikum_introduction_to_algorithm_and_dart_programming\bin> dart main.dart
  Masukkan panjang jari-jari lingkaran:
  20.0
  Luas lingkaran adalah 1256.6370614359173
```

## 2. Menggunakan Value Yang Sudah Di Deklarasikan


```dart
//Value di berdasarkan value yang sudah di deklarasikan
void main() {
  double value, area;
  value = 10;

  area = pi * value * value;
  print('Luas lingkaran adalah $area');
}
```

### Output :
```PowerShell
  Connecting to VM Service at http://127.0.0.1:59497/IwTcWAPBeeQ=/
  Luas lingkaran adalah 314.1592653589793
  Exited
```
