import 'dart:io';

String ganjilGenap(int n) {
  // Jika n adalah bilangan genap maka akan mengembalikan nilai true
  if (n % 2 == 0) {
    return 'Angka $n adalah bilangan genap';
  }
  // Sebaliknya, jika n adalah bilangan ganjil akan mengembalikan nilai false
  else {
    return 'Angka $n adalah bilangan ganjil';
  }
}

void main() {
  stdout.write('Masukkan Nomor : ');
  int? angka = int.parse(stdin.readLineSync()!);
  print(ganjilGenap(angka));
}
