class Matematika {
  // Method hasil
  hasil() => print('Section 10');
}

class KelipatanPersekutuanTerkecil implements Matematika {
  // Property
  var x, y, i;

  // Method hasil
  @override
  hasil() {
    if (x! > y!) {
      i = x;
      x = y;
      y = i;
    }
    for (i = y; i % x != 0 || i % y != 0; i++);
    return i;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  var x, y, i;

  @override
  hasil() {
    if (x! > y!) {
      i = x;
      x = y;
      y = i;
    }
    while (x > 0) {
      i = y % x;
      y = x;
      x = i;
    }
    return y;
  }
}

void main() {
  var kpk = KelipatanPersekutuanTerkecil();
  kpk.x = 16;
  kpk.y = 40;
  print('Hasil dari KPK ${kpk.x}, ${kpk.y} : ${kpk.hasil()}');

  var fpb = FaktorPersekutuanTerbesar();
  fpb.x = 16;
  fpb.y = 40;
  print('Hasil dari FPB ${fpb.x}, ${fpb.y} : ${fpb.hasil()}');
}
