//Buatlah fungsi konversi temperatur.

import 'dart:io';

void konversi(int c) {
  double k, f, r;

  k = c + 273.15;
  f = (c * 1.8) + 32;
  r = c * 0.8;

  print('Hasil Konversi Suhu dari Celsius ke: \n');
  print('Celsius : $c');
  print('Kelvin : $k');
  print('Fahrenheit : $f');
  print('Reaumur : $r');
}

void main() {
  stdout.write('Masukkan suhu (Celsius) : ');
  int? c = int.parse(stdin.readLineSync()!);

  konversi(c);

}
