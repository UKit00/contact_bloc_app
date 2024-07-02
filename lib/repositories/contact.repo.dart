import 'dart:math';

import 'package:contacts_bloc_app/model/contact.model.dart';

class ContactsRepository {
  Map<int, Contact> contacts = {
    1: Contact(
        id: 1, name: "Mohamed", profile: "MO", score: 1234, type: "Student"),
    2: Contact(
        id: 2, name: "Yasime", profile: "YA", score: 124, type: "Student"),
    3: Contact(
        id: 3, name: "IMANE", profile: "IM", score: 634, type: "Developer"),
    4: Contact(
        id: 4, name: "Hanane", profile: "HA", score: 667, type: "Student"),
    5: Contact(
        id: 5, name: "Ahmed", profile: "AH", score: 888, type: "Developer"),
  };

  Future<List<Contact>> allContacts() async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 3) {
      return contacts.values.toList();
    } else {
      throw new Exception("Internet Error");
    }
  }

  contactsByType(String type) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 3) {
      return contacts.values
          .toList()
          .where((element) => element.type == type)
          .toList();
    } else {
      throw new Exception("Internet Error");
    }
  }
}
