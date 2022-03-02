double faktorial(double n) => n == 0 ? 1 : n * faktorial(n - 1);

void main() {
  for (double? i = 10; i! <= 30; i += 10) {
    print(' Hasil dari faktorial $i adalah : ${faktorial(i)}\n');
  }
}