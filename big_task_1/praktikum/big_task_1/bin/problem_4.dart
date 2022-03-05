import 'dart:io';

// Fungsi diagonalAngka
String diagonalAngka() {
  // Deklarasi variabel
  int x, y;

  // Menampilkan perintah
  stdout.write('Masukkan angka : ');
  // Menampung nilai dari inputan user
  int? n = int.parse(stdin.readLineSync()!);

  // Melakukan perulangan untuk menampilkan diagonal angka
  for (x = 1; x <= n; x++) {
    for (y = 1; y <= n; y++) {
      // Melakukan pengecekan apakah x dan y sama dengan n dan menambakna 1
      if (x == y || y == n - x + 1) {
        // Menampilkan diagonal angka
        stdout.write(' $y');
      } else
        // Menampilkan spasi
        stdout.write(' ');
    }
    // Menampilkan enter
    stdout.write('\n');
  }
  // Mengembalikan string kosong
  return '';
}

void main() {
  // Menampilkan hasil dari fungsi diagonalAngka
  print(diagonalAngka());
}
