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
https://user-images.githubusercontent.com/72520643/158541733-8cafb60a-cb01-4e43-921f-3e8485982da0.mp4
