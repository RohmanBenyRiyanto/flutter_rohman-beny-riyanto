# (1) Big task 1


| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Task
Pada task ini saya membuat sebuah program dart dasar untuk menampilkan angka ganjil genap, menghitung azimuth/back azimuth, membuat pola jam pasir, dan menampilkan angka secara diagonal.

Berikut hasil dari big task ini.

[View Repository](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/big_task_1/praktikum/big_task_1)<br>
[View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/big_task_1/screenshot)

### Problem 1

#### Source Code :
```dart
import 'dart:io';

// Fungsi menggunakan type data boolean
// Pada fungsi ini saat digunakan harus menginputkan nilai n(angka integer)
bool ganjilGenap(int n) {
  // Jika n adalah bilangan genap maka akan mengembalikan nilai true
  if (n % 2 == 0) {
    return true;
  }
  // Sebaliknya, jika n adalah bilangan ganjil akan mengembalikan nilai false
  else {
    return false;
  }
}

void main() {
  // Menampilkan text "Masukkan angka : "
  stdout.write('Masukkan angka : ');
  // Menampung nilai dari inputan user
  int? n = int.parse(stdin.readLineSync()!);
  // Menampilkan hasil dari fungsi ganjilGenap
  print(ganjilGenap(n));
}
```

### Output :
![ScreenShot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/big_task_1/screenshot/Output%20Problem%201.png)