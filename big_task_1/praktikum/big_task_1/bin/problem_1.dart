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
