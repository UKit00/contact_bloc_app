import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/model/message.model.dart';

abstract class MessageEvent<T> {
  T payload;
  MessageEvent(this.payload);
}

class MessagesByContactEvent extends MessageEvent<Contact> {
  MessagesByContactEvent(Contact payload) : super(payload);
}

class AddNewMessageEvent extends MessageEvent<Message> {
  AddNewMessageEvent(Message payload) : super(payload);
}
