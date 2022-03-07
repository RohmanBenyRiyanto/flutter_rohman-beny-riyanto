void main() {
  final listData = [
    ['Sapi', 4],
    ['Ayam', 2],
    ['Kucing', 4],
  ];

  var result = Map.fromIterable(listData, key: (v) => v[0], value: (v) => v[1]);
  print(result);
}