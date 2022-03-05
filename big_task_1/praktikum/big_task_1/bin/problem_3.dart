import 'dart:io';

// Fungsi jamPasir
String? jamPasir() {
  // Deklarasi variabel
  int i, j;

  // Menampilkan kalimat "Masuakan angka"
  stdout.write('Masukkan angka : ');
  // Menampung inputan user
  int? n = int.parse(stdin.readLineSync()!);

  // Melakukan perulangan untuk menampilkan hasil
  for (i = 1; i < 2 * n; i++) {
    for (j = 1; j < 2 * n; j++) {
      // Melakukan pengecekan apakah i dan j sama dengan n
      if ((i <= j && i + j <= 2 * n) || (i > n && i >= j && i + j >= 2 * n)) {
        // Menampilkan hasil
        stdout.write('*');
      } else {
        // Menampilkan spasi
        stdout.write(' ');
      }
    }
    // Menampilkan enter
    stdout.write('\n');
  }
  // Mengembalikan nilai null
  return '';
}

void main() {
  // Menjalankan fungsi jamPasir
  print(jamPasir());
}
