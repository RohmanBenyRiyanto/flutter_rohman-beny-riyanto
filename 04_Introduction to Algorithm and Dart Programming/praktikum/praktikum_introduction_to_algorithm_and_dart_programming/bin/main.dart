import 'dart:io';
import 'dart:math' show pi;

/*Value di berdasarkan value yang sudah
  di deklarasikan*/
// void main() {
//   double value, area;
//   value = 10;

//   area = pi * value * value;
//   print('Luas lingkaran adalah $area');
// }

//Value di berdasarkan Inputan dari console
void main() {
  double area;

  print('Masukkan panjang jari-jari lingkaran: ');
  var num1 = stdin.readLineSync();
  var num2 = double.parse(num1!);

  area = pi * num2 * num2;
  print('Luas lingkaran adalah $area');
}
