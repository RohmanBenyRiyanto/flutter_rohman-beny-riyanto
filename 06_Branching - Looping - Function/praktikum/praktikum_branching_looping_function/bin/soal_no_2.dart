import 'dart:io';

void main() {
  var factorial = 1;
  print('Masukkan bilangan bulat : ');
  int? n = int.parse(stdin.readLineSync()!);
  if (n < 0) {
    print('Angka yang dimasukkan bukan bilangan bulat');
  } else {
    for (var i = 1; i <= n; i++) {
      factorial *= i;
    }
    print('Hasil faktorial dari ' +
        n.toString() +
        ' adalah ' +
        factorial.toString());
  }
}
