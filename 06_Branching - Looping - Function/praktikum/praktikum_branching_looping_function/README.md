# (6) Branching - Looping - Function

# Task :
Pada task ini terdapat dua soal, yang pertama adalah membuat sebuah program penilaian menggunakan if else dan yang kedua adalah membuat perhitungan faktorial.

Berikut hasil dari praktikum ini :<br>
1. [View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/06_Branching%20-%20Looping%20-%20Function/praktikum/praktikum_branching_looping_function)

2. [View Screenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/06_Branching%20-%20Looping%20-%20Function/screenshot)

## 1. Soal nomor 1

### Source Code :
```dart
void main() {
  var nilai = 86;
  if (nilai >= 70) {
    print('Nilai Anda A');
  } else if (nilai >= 40) {
    print('Nilai Anda B');
  } else if (nilai >= 0) {
    print('Nilai Anda C');
  } else {
    print('');
  }
}
```

### Output :
```powershell
Connecting to VM Service at http://127.0.0.1:60371/T3kMFprZY7k=/
Nilai Anda A
Exited
```

## 2. Soal nomor 2
### Source Code :
```dart
double faktorial(double n) => n == 0 ? 1 : n * faktorial(n - 1);

void main() {
  for (double? i = 10; i! <= 30; i += 10) {
    print(' Hasil dari faktorial $i adalah : ${faktorial(i)}\n');
  }
}
```

### Output :
```powershell
Connecting to VM Service at http://127.0.0.1:50029/Fpvubvcbs4c=/
 Hasil dari faktorial 10.0 adalah : 3628800.0

 Hasil dari faktorial 20.0 adalah : 2432902008176640000.0

 Hasil dari faktorial 30.0 adalah : 2.6525285981219103e+32

Exited

```