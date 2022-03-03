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
2. [View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/07_Advance%20Function%20-%20Async-Await/praktikum/advance_function_async_await)