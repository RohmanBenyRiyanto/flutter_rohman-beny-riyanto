# Task
Pada task ini saya membuat dua program menggunakan OOP dan menggunakan bahasa dart, program pertama adalah membuat sebuah class hewan mempunyai properti berat hewan class mobil memiliki list muatan yang berisi data hewan yang menjadi muatan juga terdapat method untuk menambahkan muatan jika kapasitas mencukup. Program kedua saya menambahkan method totalMuatan pada class mobil.

Berikut hasil dari praktkum ini :

[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/09_Dart%20Object%20Oriented%20Programming%201/praktikum/dart_object_oriented_programming_1)<br>
[View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/09_Dart%20Object%20Oriented%20Programming%201/screenshot)

## Soal Nomor 1

### Source Code :
```dart
import 'dart:io';

class Hewan {
  double berat = 100.0;
}

class Mobil {
  List hewan = [
    'Kucing',
    'Anjing',
    'Kelinci',
    'Kerbau',
  ];
  int max = 5;

  void tambahMuatan() {
    if (hewan.length < max) {
      stdout.write('Masukkan nama hewan : ');
      String? tambah = stdin.readLineSync()!;
      hewan.add(tambah);
      print('Berhasil menambahkan $tambah\n');
      print('Daftar hewan Terbaru : $hewan\n');
    } else if (hewan.length >= max) {
      print('Muatan telah penuh (MAX 5)!\n');
    } else {
      print('Error\n');
    }
  }

  void lanjut() {
    stdout.write('Tambah muatan lagi?(y/n) : ');
    String? button = stdin.readLineSync()!;
    if (button == 'y') {
      if (hewan.length < max) {
        stdout.write('Masukkan nama hewan : ');
        String? tambah = stdin.readLineSync()!;
        hewan.add(tambah);
        print('Berhasil menambahkan $tambah\n');
        print('Daftar hewan Terbaru : $hewan\n');
      } else if (hewan.length >= max) {
        print('Muatan telah penuh (MAX 5)!\n');
      }
    } else if (button == 'n') {
      print('Program telah selesai!\n');
    } else {
      print('error\n');
    }
  }
}

void main() {
  var mobils = Mobil();

  print('Total Berat hewan adalah : ${Hewan().berat}');
  print('Daftar hewan : ${mobils.hewan}\n');

  stdout.write('Menambahkan muatan?(y/n) : ');
  String? button = stdin.readLineSync()!;
  if (button == 'y') {
    // Menambahkan nilai ke dalam list
    mobils.tambahMuatan();
    mobils.lanjut();
  } else if (button == 'n') {
    print('Program telah selesai!\n');
  } else {
    print('error\n');
  }
}

```

### Output :
![image](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/09_Dart%20Object%20Oriented%20Programming%201/screenshot/Output%20Nomor%201.png)

## Soal Nomor 2

```dart
import 'dart:io';

class Hewan {
  double berat = 100.0;
}

class Mobil {
  List hewan = [
    'Kucing',
    'Anjing',
    'Kelinci',
    'Kerbau',
  ];
  int max = 5;

  void tambahMuatan() {
    if (hewan.length < max) {
      stdout.write('Masukkan nama hewan : ');
      String? tambah = stdin.readLineSync()!;
      hewan.add(tambah);
      print('Berhasil menambahkan $tambah\n');
      print('Daftar hewan Terbaru : $hewan\n');
    } else if (hewan.length >= max) {
      print('Muatan telah penuh (MAX 5)!\n');
    } else {
      print('Error\n');
    }
  }

  void totalMuatan() {
    print('Total Muatan adalah ${hewan.length}\n');
  }

  void lanjut() {
    stdout.write('Tambah muatan lagi?(y/n) : ');
    String? button = stdin.readLineSync()!;
    if (button == 'y') {
      if (hewan.length < max) {
        stdout.write('Masukkan nama hewan : ');
        String? tambah = stdin.readLineSync()!;
        hewan.add(tambah);
        print('Berhasil menambahkan $tambah\n');
        print('Daftar hewan Terbaru : $hewan\n');
        print('Total Muatan adalah ${hewan.length}\n');
      } else if (hewan.length >= max) {
        print('Muatan telah penuh (MAX 5)!\n');
      }
    } else if (button == 'n') {
      print('Program telah selesai!\n');
    } else {
      print('error\n');
    }
  }
}

void main() {
  var mobils = Mobil();

  print('Total Berat hewan adalah : ${Hewan().berat}');
  print('Daftar hewan : ${mobils.hewan}\n');

  stdout.write('Menambahkan muatan?(y/n) : ');
  String? button = stdin.readLineSync()!;
  if (button == 'y') {
    // Menambahkan nilai ke dalam list
    mobils.tambahMuatan();
    mobils.totalMuatan();
    mobils.lanjut();
  } else if (button == 'n') {
    print('Program telah selesai!\n');
  } else {
    print('error\n');
  }
}
```

### Output
![image](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/09_Dart%20Object%20Oriented%20Programming%201/screenshot/Output%20Nomor%202.png)