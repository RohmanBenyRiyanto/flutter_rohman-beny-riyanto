class CheckBoxModel {
  int id;
  String title;
  bool isChecked;

  CheckBoxModel({
    required this.id,
    required this.title,
    this.isChecked = false,
  });
}
