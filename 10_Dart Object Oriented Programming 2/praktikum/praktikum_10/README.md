# Task
Pada task ini saya membuat program menghitung volume kubus, balok dan Kelipatan Persekutuan Terkecil, FaktorPersekutuanTerbesar menggunakan bahasa Dart dan OOP.

Berikut hasil dari praktikum ini :

[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/10_Dart%20Object%20Oriented%20Programming%202/praktikum/praktikum_10)<br>
[View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/10_Dart%20Object%20Oriented%20Programming%202/screenshot)

## Soal Nomor 1

### Source Code :
```dart
class BangunRuang {
  // Property  panjang, lebar, tinggi, volume (Bertype Integer)
  int? panjang;
  int? lebar;
  int? tinggi;

  // Method untuk menghitung volume
  int volume() => panjang! * lebar! * tinggi!;
}

class Kubus extends BangunRuang {
  // Property sisi (Bertype Integer)
  int? sisi;

  // Method untuk menghitung volume (Override merubah p*l*t menjadi s*s*s)
  @override
  int volume() => sisi! * sisi! * sisi!;
}

class Balok extends BangunRuang {}

void main() {
  var kubus = Kubus();
  kubus.sisi = 5;
  print('Volume Kubus = ${kubus.volume()}');

  var balok = Balok();
  balok.panjang = 5;
  balok.lebar = 4;
  balok.tinggi = 4;
  print('Volume Balok = ${balok.volume()}');
}
```

### Output :
![image](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/10_Dart%20Object%20Oriented%20Programming%202/screenshot/Output%20Nomor%201.png?raw=true)

## Soal Nomor 2

### Source Code :
```dart
class Matematika {
  // Method hasil
  hasil() => print('Section 10');
}

class KelipatanPersekutuanTerkecil implements Matematika {
  // Property
  var x, y, i;

  // Method hasil
  @override
  hasil() {
    if (x! > y!) {
      i = x;
      x = y;
      y = i;
    }
    for (i = y; i % x != 0 || i % y != 0; i++);
    return i;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  var x, y, i;

  @override
  hasil() {
    if (x! > y!) {
      i = x;
      x = y;
      y = i;
    }
    while (x > 0) {
      i = y % x;
      y = x;
      x = i;
    }
    return y;
  }
}

void main() {
  var kpk = KelipatanPersekutuanTerkecil();
  kpk.x = 16;
  kpk.y = 40;
  print('Hasil dari KPK ${kpk.x}, ${kpk.y} : ${kpk.hasil()}');

  var fpb = FaktorPersekutuanTerbesar();
  fpb.x = 16;
  fpb.y = 40;
  print('Hasil dari FPB ${fpb.x}, ${fpb.y} : ${fpb.hasil()}');
}
```

### Output :
![image](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/10_Dart%20Object%20Oriented%20Programming%202/screenshot/Output%20Nomor%202.png?raw=true)