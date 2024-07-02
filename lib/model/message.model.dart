class Message {
  int id;
  int contactID;
  DateTime date;
  String content;
  String type;

  Message({
    required this.id,
    required this.contactID,
    required this.date,
    required this.content,
    required this.type,
  });
}
