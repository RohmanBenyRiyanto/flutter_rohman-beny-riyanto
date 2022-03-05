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
