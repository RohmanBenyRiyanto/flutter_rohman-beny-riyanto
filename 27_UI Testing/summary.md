# (25) MVVM Architecture
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### 1. Pengertian UI Testing
UI Testing juga dikenal sebagai Pengujian GUI pada dasarnya adalah mekanisme yang dimaksudkan untuk menguji aspek perangkat lunak apa pun yang akan dihubungi oleh pengguna . Ini biasanya berarti menguji elemen visual untuk memverifikasi bahwa mereka berfungsi sesuai dengan persyaratan – dalam hal fungsionalitas dan kinerja.

### 2.  Cara Melakukan UI testing pada flutter
Untuk melakukan UI Testing pada Flutter cukup sederhana, berikut langkah - langkahnya :

1. Melakukan pendaftaran package *flutter_test:* pada despendecy pubspec.yaml
2. Membuat file pada folder test (terdapat pada root project) dengan naman _test.dart
3. Melakukan import package pada file yang sudah di buat : 
   <br>- import 'package:flutter_test/flutter_test.dart';
4. Membuat code untuk testing (Terdapat pada task di bawah ini)

# Task
Pada task ini saya menerapkan UI Testing untuk melakukan find.text pada halaman homepage.

Berikut hasil dari praktikum ini :

[View Source Code](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/27_UI%20Testing/praktikum/praktikum_27)<br>
[View ScreenShot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/27_UI%20Testing/screenshot)

## Penjelasan Source Code :
```dart
void main() {
// Group berguna apabila nantinya akan dibuat testing widget yang lainya
  group(
    'Widgets Test',
    () {
// Memanggil testWidget yang diharuskan terdapat deskripsi dan body
      testWidgets(
// Desktipsi test widget
        'Foods Widgets Test',
        (WidgetTester tester) async {
// Body Test widget
          await tester.pumpWidget(
// Karena halaman ini menggunakan state management
// Maka diharuskan untuk memanggil package state management tersebut
            MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => FoodViewModel(),
                ),
              ],
              child: const MaterialApp(
// Memanggil class atau halaman yang akan di lakukan testing
                home: HomePage(),
              ),
            ),
          );
// Menambahkan await dengan durasi 3 detik
          await tester.pumpAndSettle(const Duration(seconds: 3));
// Melakukan pencarian text dengan isi 'Foods'
          expect(find.text('Foods'), findsOneWidget);
        },
      );
    },
  );
}
```

## Output : 
![secreenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/27_UI%20Testing/screenshot/Output%20UI%20Testing.png)
