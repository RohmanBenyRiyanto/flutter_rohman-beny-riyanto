class Chat {
  String imageURL;
  String name;
  String messageText;
  String time;
  int? badge;
  var color;

  Chat({
    required this.imageURL,
    required this.name,
    required this.messageText,
    required this.time,
    required this.color,
    this.badge,
  });
}
