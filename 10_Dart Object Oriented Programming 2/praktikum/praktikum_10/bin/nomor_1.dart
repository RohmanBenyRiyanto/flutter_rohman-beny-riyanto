class BangunRuang {
  // Property  panjang, lebar, tinggi, volume (Bertype Integer)
  int? panjang;
  int? lebar;
  int? tinggi;

  // Method untuk menghitung volume
  int volume() => panjang! * lebar! * tinggi!;
}

class Kubus extends BangunRuang {
  // Property sisi (Bertype Integer)
  int? sisi;

  // Method untuk menghitung volume (Override merubah p*l*t menjadi s*s*s)
  @override
  int volume() => sisi! * sisi! * sisi!;
}

class Balok extends BangunRuang {}

void main() {
  var kubus = Kubus();
  kubus.sisi = 5;
  print('Volume Kubus = ${kubus.volume()}');

  var balok = Balok();
  balok.panjang = 5;
  balok.lebar = 4;
  balok.tinggi = 4;
  print('Volume Balok = ${balok.volume()}');
}
