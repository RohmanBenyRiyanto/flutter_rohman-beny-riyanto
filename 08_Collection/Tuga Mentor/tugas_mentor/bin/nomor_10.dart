void main() {
  String text = 'i like pizza';
  String topping = 'with tomatoes';
  String favourite = '$text $topping';
  String newText = favourite.replaceAll('pizza', 'pasta');
  favourite = 'Now I Like curry';

  print(newText);

  //pada string favourite dapat dijakian final atau const dikarenakan agar data dapat konsistent
}
