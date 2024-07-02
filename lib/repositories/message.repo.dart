import 'dart:math';

import 'package:contacts_bloc_app/model/message.model.dart';

class MessageRepository {
  int messageCount = 0;

  Map<int, Message> messages = {
    1: Message(
        id: 1,
        contactID: 1,
        date: DateTime.now(),
        content: "Hello man",
        type: "sent"),
    2: Message(
        id: 2,
        contactID: 1,
        date: DateTime.now(),
        content: "OK Thnaks",
        type: "received"),
    3: Message(
        id: 3,
        contactID: 1,
        date: DateTime.now(),
        content: "What are you  doing",
        type: "sent"),
    4: Message(
        id: 4,
        contactID: 1,
        date: DateTime.now(),
        content: "Hello man",
        type: "sent"),
    5: Message(
        id: 5,
        contactID: 2,
        date: DateTime.now(),
        content: "Hello man",
        type: "sent"),
    6: Message(
        id: 6,
        contactID: 2,
        date: DateTime.now(),
        content: "Hello man",
        type: "received"),
  };

  MessageRepository() {
    this.messageCount = messages.length;
  }

  Future<List<Message>> allMessages() async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 1) {
      return messages.values.toList();
    } else {
      throw new Exception("Internet Error");
    }
  }

  Future<List<Message>> messagesByContact(int contactID) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 1) {
      return messages.values
          .toList()
          .where((element) => element.contactID == contactID)
          .toList();
    } else {
      throw new Exception("Internet Error");
    }
  }

  Future<Message> addNewMessage(Message message) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 1) {
      message.id = ++messageCount;
      messages[message.id] = message;
      return message;
    } else {
      throw new Exception("Internet Error");
    }
  }
}
