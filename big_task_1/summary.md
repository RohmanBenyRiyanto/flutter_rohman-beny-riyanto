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

### Problem 2

#### Source Code :
```dart
import 'dart:io';

// Fungsi azimuth bertype data Integer
// Pada fungsi ini saat digunakan harus menginputkan nilai a(angka integer)
int? azimuth(int a) {
  // Deklarasi variabel b bertype data Integer
  int? b = 180;
  // Deklarasi variabel c bertype data Integer
  int? c = 0;

  // Melakukan Pengecekan apakah nilai a lebih besar dari 180 atau tidak
  if (a > b) {
    // Jika nilai a lebih besar dari 180 maka akan di kurangi dengan 180
    return a - b;
    // Melakukan Pengecekan apakah nilai a lebih kecil dari 180 atau tidak
  } else if (a < b) {
    // Jika nilai a lebih kecil dari 180 maka akan ditambah dengan 180
    return a + b;
    // Jika nilai a sama dengan 180 maka akan mengembalikan nilai 0
  } else {
    return a - b;
  }
}

void main(List<String> arguments) {
  // Menampilkan text "Masukkan angka : "
  stdout.write('Masukkan angka : ');
    // Menampung nilai dari inputan user
  int? n = int.parse(stdin.readLineSync()!);
  // Menampilkan funsi azimuth dengan nilai n
  print(azimuth(n));
}
```

### Output :
![ScreenShot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/big_task_1/screenshot/Output%20Problem%202.png)

### Problem 3

#### Source Code :
```dart
import 'dart:io';

// Fungsi jamPasir
String? jamPasir() {
  // Deklarasi variabel
  int i, j;

  // Menampilkan kalimat "Masuakan angka"
  stdout.write('Masukkan angka : ');
  // Menampung inputan user
  int? n = int.parse(stdin.readLineSync()!);

  // Melakukan perulangan untuk menampilkan hasil
  for (i = 1; i < 2 * n; i++) {
    for (j = 1; j < 2 * n; j++) {
      // Melakukan pengecekan apakah i dan j sama dengan n
      if ((i <= j && i + j <= 2 * n) || (i > n && i >= j && i + j >= 2 * n)) {
        // Menampilkan hasil
        stdout.write('*');
      } else {
        // Menampilkan spasi
        stdout.write(' ');
      }
    }
    // Menampilkan enter
    stdout.write('\n');
  }
  // Mengembalikan nilai null
  return '';
}

void main() {
  // Menjalankan fungsi jamPasir
  print(jamPasir());
}
```

### Output :
![ScreenShot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/big_task_1/screenshot/Output%20Problem%203.png)

### Problem 4

#### Source Code :
```dart
import 'dart:io';

// Fungsi diagonalAngka
String diagonalAngka() {
  // Deklarasi variabel
  int x, y;

  // Menampilkan perintah
  stdout.write('Masukkan angka : ');
  // Menampung nilai dari inputan user
  int? n = int.parse(stdin.readLineSync()!);

  // Melakukan perulangan untuk menampilkan diagonal angka
  for (x = 1; x <= n; x++) {
    for (y = 1; y <= n; y++) {
      // Melakukan pengecekan apakah x dan y sama dengan n dan menambakna 1
      if (x == y || y == n - x + 1) {
        // Menampilkan diagonal angka
        stdout.write(' $y');
      } else
        // Menampilkan spasi
        stdout.write(' ');
    }
    // Menampilkan enter
    stdout.write('\n');
  }
  // Mengembalikan string kosong
  return '';
}

void main() {
  // Menampilkan hasil dari fungsi diagonalAngka
  print(diagonalAngka());
}
```

### Output :
![ScreenShot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/big_task_1/screenshot/Output%20Problem%204.png)