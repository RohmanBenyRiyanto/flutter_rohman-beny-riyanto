import 'dart:io';

class Hewan {
  double? berat = 20.0;
}

class Mobil {
  List hewan = [
    'Kucing',
    'Anjing',
    'Kelinci',
    'Kerbau',
  ];
  int max = 5;

  void tambahMuatan() {
    if (hewan.length < max) {
      stdout.write('Masukkan nama hewan : ');
      String? tambah = stdin.readLineSync()!;
      hewan.add(tambah);
      print('Berhasil menambahkan $tambah\n');
      print('Daftar hewan Terbaru : $hewan\n');
    } else if (hewan.length >= max) {
      print('Muatan telah penuh (MAX 5)!\n');
    } else {
      print('Error\n');
    }
  }

  void lanjut() {
    stdout.write('Tambah muatan lagi?(y/n) : ');
    String? button = stdin.readLineSync()!;
    if (button == 'y') {
      if (hewan.length < max) {
        stdout.write('Masukkan nama hewan : ');
        String? tambah = stdin.readLineSync()!;
        hewan.add(tambah);
        print('Berhasil menambahkan $tambah\n');
        print('Daftar hewan Terbaru : $hewan\n');
      } else if (hewan.length >= max) {
        print('Muatan telah penuh (MAX 5)!\n');
      }
    } else if (button == 'n') {
      print('Program telah selesai!\n');
    } else {
      print('error\n');
    }
  }
}

void main() {
  var mobils = Mobil();

  print('Total Berat hewan adalah : ${Hewan().berat! * mobils.hewan.length}');
  print('Daftar hewan : ${mobils.hewan}\n');

  stdout.write('Menambahkan muatan?(y/n) : ');
  String? button = stdin.readLineSync()!;
  if (button == 'y') {
    // Menambahkan nilai ke dalam list
    mobils.tambahMuatan();
    mobils.lanjut();
  } else if (button == 'n') {
    print('Program telah selesai!\n');
  } else {
    print('error\n');
  }
}
