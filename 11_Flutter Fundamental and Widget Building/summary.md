# (11) Introduction Flutter Widget

| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### 1. Flutter
Flutter adalah sebuah framework aplikasi mobil open source yang diciptakan oleh Google. Flutter digunakan dalam pengembangan aplikasi untuk sistem operasi Android, iOS, Windows, Linux, MacOS.

### 2. Stateless dan Stateful
- **Stateless Widget**  adalah widget yang statusnya tidak dapat diubah setelah dibuat. Widget ini tidak dapat diubah setelah dibuat yaitu jumlah perubahan apa pun dalam variabel, ikon, tombol, atau pengambilan data tidak dapat mengubah status aplikasi.
- **Stateful Widget** merupakan widget yang dinamis atau dapat berubah. Berbanding terbalik dengan stateless, stateful widget dapat mengupdate tampilan, merubah warna, menambah jumlah baris dll. Jadi dapat disimpulkan bahwa apapun widget yang dapat berubah maka itulah stateful widget.
### 3. Built in Widget
Widget Flutter dibuat menggunakan framework modern yang mengambil inspirasi dari [React](https://reactjs.org) . Ide utamanya adalah Anda membangun UI dari widget. Widget menjelaskan seperti apa tampilan mereka jika diberikan konfigurasi dan status saat ini. Saat status widget berubah, widget membuat ulang deskripsinya, yang berbeda dengan kerangka kerja dengan deskripsi sebelumnya untuk menentukan perubahan minimal yang diperlukan dalam pohon render yang mendasari untuk transisi dari satu status ke status berikutnya.

# Task
Pada task ini terdapat 2 (dua) soal yang menggunakan satu study kasus, yaitu membuat sebuah aplikasi mobile menggunakan flutter yang tampilanya dapat berubah setiap detik.

Berikut hasil dari task ini :

[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/11_Flutter%20Fundamental%20and%20Widget%20Building/praktikum/praktikum_11)<br>
[View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/11_Flutter%20Fundamental%20and%20Widget%20Building/screenshot)

## Nomor 1
Membuat tampilan statefull widget yang dapat berubah setiap detiknya.

### Source Code :
```dart
// Deklarasi properti timeString (private)
late String _timeString;

// Membuat state
@override
void initState() {
  _timeString =
    "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
}

void _getCurrentTime() {
    setState(() {
    _timeString =
        "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
  });
}

// Menampilkan method
Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
    Text(
        ('Indonesia Time'.toUpperCase()),
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            ),
        ),
        const SizedBox(height: 16),
        text(
        _timeString,
        style: const TextStyle(
            fontSize: 24,
        ),
        ),
    ],
),
```

## Nomor 2
Melakukan Spliting widget namun tidak merubah tampilanya.

### Source Code :
```dart
// Deklarasi properti timeString (private)
late String _timeString;

// Membuat state
@override
void initState() {
_timeString =
    "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
}

void _getCurrentTime() {
    setState(() {
    _timeString =
    "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
  });
}

// Menampilkan widget
Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            const Heading(),
            const SizedBox(height: 16),
            Time(timeString: _timeString,
            ),
        ],
    ),


// Split widget time, di dalamnya terdapat constructor timeString
class Time extends StatelessWidget {
  const Time({
    Key? key,
    required String timeString,
  }) : _timeString = timeString, super(key: key);

  final String _timeString;

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: const TextStyle(
        fontSize: 24,
      ),
    );
  }
}

// Split widget header menampilkan "Indonesia Time"
class Heading extends StatelessWidget {
  const Heading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      ('Indonesia Time'.toUpperCase()),
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
```

## Output :
https://user-images.githubusercontent.com/72520643/158541262-12b61992-9e45-479e-8029-03644f0b1ab1.mp4
