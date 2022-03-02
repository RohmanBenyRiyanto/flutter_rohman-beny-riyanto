void main() {
  double? num = 30;
  double factorial = 1;

  for (double? i = num; i ! >= 1; i--) {
    factorial *= i;
  }
  print(factorial);
}
