# (6) Branching - Looping - Function

Pada task ini, membuat sebuah program menggunakan bahasa dart untuk menyelesaikan persoalan. Persoalan satu adalah menentutkan nilai, persoalan dua menampilkan factorial.

Berikut hasil dari praktikum ini.<br>
[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/06_Branching%20-%20Looping%20-%20Function/praktikum/praktikum_branching_looping_function)<br>
[View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/06_Branching%20-%20Looping%20-%20Function/screenshot)

## 1. Soal Nomor 1 Menentukan nilai

### a. Cara 1 Menggunakan Input Console

#### Source Code :

```dart
 void main() {
  var nilai = 86;
  if (nilai >= 70) {
    print('Nilai Anda A');
  } else if (nilai >= 40) {
    print('Nilai Anda B');
  } else if (nilai >= 0) {
    print('Nilai Anda C');
  } else {
    print('');
  }
}
```

#### Output :
```PowerShell
Connecting to VM Service at http://127.0.0.1:54766/2RA3LVhTbhk=/
Nilai Anda A
Exited

```
## 2. Soal Nomor 2 menghitung factorial

#### Source Code
```dart
import 'dart:io';

void main() {
  var factorial = 1;
  print('Masukkan bilangan bulat : ');
  int? n = int.parse(stdin.readLineSync()!);
  if (n < 0) {
    print('Angka yang dimasukkan bukan bilangan bulat');
  } else {
    for (var i = 1; i <= n; i++) {
      factorial *= i;
    }
    print('Hasil faktorial dari ' +
        n.toString() +
        ' adalah ' +
        factorial.toString());
  }
}
```

#### Output :
```PowerShell
PS D:\Kampus Merdeka\Alterra Academy\Tugas\flutter_rohman-beny-riyanto\06_Branching - Looping - Function\praktikum\praktikum_branching_looping_function\bin> dart soal_no_2.dart
Masukkan bilangan bulat : 
10
Hasil faktorial dari 10 adalah 3628800
PS D:\Kampus Merdeka\Alterra Academy\Tugas\flutter_rohman-beny-riyanto\06_Branching - Looping - Function\praktikum\praktikum_branching_looping_function\bin> dart soal_no_2.dart
Masukkan bilangan bulat : 
20
Hasil faktorial dari 20 adalah 2432902008176640000
PS D:\Kampus Merdeka\Alterra Academy\Tugas\flutter_rohman-beny-riyanto\06_Branching - Looping - Function\praktikum\praktikum_branching_looping_function\bin> dart soal_no_2.dart
Masukkan bilangan bulat : 
30
Hasil faktorial dari 30 adalah -8764578968847253504
PS D:\Kampus Merdeka\Alterra Academy\Tugas\flutter_rohman-beny-riyanto\06_Branching - Looping - Function\praktikum\praktikum_branching_looping_function\bin> 
```