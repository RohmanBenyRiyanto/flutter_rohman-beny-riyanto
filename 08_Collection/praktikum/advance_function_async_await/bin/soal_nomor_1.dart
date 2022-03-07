import 'dart:math';

void main() async {
  Future<List>? _futureOfList = _getList();
  List? list = await _futureOfList;
  var nilaipengali = Random().nextInt(100);

  print(await fungsi(list, nilaipengali));
}

Future<List> _getList() async {
  await Future.delayed(Duration(seconds: 1));
  return Future.value(List.generate(5, (number) => Random().nextInt(100)));
}

Future<String> fungsi(List data, int pengali) async {
  print('Proses Start\n');
  print('Nilai Pengali adalah : $pengali\n');
  print('List awal adalah $data\n');
  var kali = data.map((number) => number * pengali);

  for (var e in data) {
    var currentElement = e;
    var currentKali = currentElement * pengali;
    print('Hasil dari $pengali x $currentElement adalah : $currentKali\n');
  }

  var newList = List.from(data)..addAll(kali);
  print('List terbaru adalah : $newList');
  return '\nProses End';
}
