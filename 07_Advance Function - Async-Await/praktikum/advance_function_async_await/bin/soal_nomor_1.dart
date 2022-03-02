// import 'dart:math';

// void main() async {
//   var randoms = Random();
//   var nilaiRandom = randoms.nextInt(100);
//   print('Nilai Pengali adalah : $nilaiRandom\n');

//   Future<List>? _futureOfList = _getList();
//   List? list = await _futureOfList;
//   print('List awal adalah $list\n');

//   var pengali = list.map((number) => number * nilaiRandom);

//   print('Hasil dari $nilaiRandom x $list adalah : $pengali\n');

//   var newList = List.from(list)..addAll(pengali);

//   print('List terbaru adalah : $newList');
// }

// Future<List> _getList() async {
//   await Future.delayed(Duration(seconds: 1));
//   return Future.value([1, 2, 3, 4, 5]);
// }

import 'dart:async';
import 'dart:math';

Future<bool> proses() async {
  await Future.delayed(Duration(seconds: 1));
  var randoms = Random();
  var nilaiRandom = randoms.nextInt(100);
  print('Nilai Pengali adalah : $nilaiRandom\n');
  var numbers = <int>[randoms.nextInt(100)];
  print('List awal adalah $numbers\n');

  for (var e in numbers) {
    // var pengali = numbers.map((number) => e * nilaiRandom);
    var pengali = e * nilaiRandom;
    print('Hasil dari $e dikalikan $nilaiRandom adalah : $pengali\n');

    var newList = List.from(numbers)..add(pengali);
    print('List terbaru adalah : $newList\n');
  }

  return true;
}

void main() async {
  print('Mulai.....\n');
  await proses();
  print('Selesai...');
}
