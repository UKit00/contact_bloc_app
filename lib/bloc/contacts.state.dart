import 'package:contacts_bloc_app/enums/enums.dart';

class ContactsState {
  var contacts;
  RequestState requestState;
  String errorMessage;
  var currentEvent;

  ContactsState({
    required this.contacts,
    required this.requestState,
    required this.errorMessage,
    this.currentEvent,
  });
}
