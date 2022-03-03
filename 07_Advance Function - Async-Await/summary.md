# (7) Advance Function, Async-Await

| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### Fungsi Lanjutan
Dalam bahasa pemrograman, dart memiliki fungsi panah (=>). Fungsi panah digunakan untuk mendefinisikan ekspresi tunggal dalam suatu fungsi. Ini adalah cara yang lebih sederhana untuk menulis fungsi dengan satu pernyataan.

#### Contoh :
```dart
String arrowFunction(String name) => 'Hello, $name!';

void main() {
    print(arrowFunction('Beny'));
}
```

### Async - Await
- Menjalankan beberapa proses tanpa perlu menunggu,
- Proses ditulis dalam bentuk fungsi,
- Await akan menunggu hingga proses async selesai.

#### Contoh :
```dart
void fungsi1 () {
    Future.delayed(Duration(seconds : 1), () {
        print('Nasi Goreng');
    });
}

void fungsi2 () {
    print('Es Teh');
}

void main() {
    fungsi1(); // Dijalankan dibelakang
    fungsi2(); // Akan menampilkan data lebih awal
}
```

### Future dan Collection
#### 1. Future
   - Data yang ditunggu,
   - Membawa data return dari fungsi async.

#### Contoh :
```dart
Future<String> namaFungsi() async {
  return Future.delayed(Duration(seconds: 1), () {
    return 'Ini adalah data yang di return';
  });
}

void main() async {
  var data = await namaFungsi();// Menunggu sampai data selesai di proses
  print(data);
}

```
#### 2. Collection
   - **List** <br> Contoh :
```dart
var number = [1, 2, 3, 4, 5];
```
   - **Map** <br> Contoh :
```dart
var map = {
    'key': 'value',
    'key': 12345,
};
```
# Task

1. Buatlah sebuah fungsi dengan spesifikasi berikut :
   - Menerima 2 parameter, yaitu list dan pengali,
   - lakukan perulangan pada list data secara asynchronous,
   - tiap perulangan, kalikan elemen list data dengan pengali,
   - return list baru yang berisi hasil proses di atas.
   
2. Buatlah sebuah list dengan spesifikasi berikut :
   - Tiap element-nya berupda list juga,
   - tiap element-nya wajib terdapat 2 data (sub-element).
<br>Buatlah sebuah Map dengan menggunakan list tersebut!

Berikut hasil dari praktikum ini :
1. [View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/07_Advance%20Function%20-%20Async-Await/praktikum/advance_function_async_await)
2. [View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/07_Advance%20Function%20-%20Async-Await/screenshot)

## 1. Soal nomor 1

### Source Code :
```dart
import 'dart:math';

void main() async {
  Future<List>? _futureOfList = _getList();
  List? list = await _futureOfList;
  var nilaipengali = Random().nextInt(100);

  print(await fungsi(list, nilaipengali));
}

Future<List> _getList() async {
  await Future.delayed(Duration(seconds: 1));
  return Future.value(List.generate(5, (number) => Random().nextInt(100)));
}

Future<String> fungsi(List data, int pengali) async {
  print('Proses Start\n');
  print('Nilai Pengali adalah : $pengali\n');
  print('List awal adalah $data\n');
  var kali = data.map((number) => number * pengali);

  for (var e in data) {
    var currentElement = e;
    var currentKali = currentElement * pengali;
    print('Hasil dari $pengali x $currentElement adalah : $currentKali\n');
  }

  var newList = List.from(data)..addAll(kali);
  print('List terbaru adalah : $newList');
  return '\nProses End';
}
```

### Output :
```powershell
Connecting to VM Service at http://127.0.0.1:63281/chN7IdamI3E=/
Proses Start

Nilai Pengali adalah : 42

List awal adalah [1, 46, 7, 88, 72]

Hasil dari 42 x 1 adalah : 42

Hasil dari 42 x 46 adalah : 1932

Hasil dari 42 x 7 adalah : 294

Hasil dari 42 x 88 adalah : 3696

Hasil dari 42 x 72 adalah : 3024

List terbaru adalah : [1, 46, 7, 88, 72, 42, 1932, 294, 3696, 3024]

Proses End
Exited
```

## 2. Soal nomor 2

### Source Code :
```dart
void main() {
  final listData = [
    ['Sapi', 4],
    ['Ayam', 2],
    ['Kucing', 4],
  ];

  var result = Map.fromIterable(listData, key: (v) => v[0], value: (v) => v[1]);
  print(result);
}
```

### Output :
```powershell
Connecting to VM Service at http://127.0.0.1:51061/NH32m0X2fQc=/
{Sapi: 4, Ayam: 2, Kucing: 4}
Exited
```