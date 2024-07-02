import 'package:contacts_bloc_app/bloc/message/messages.actions.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/message.model.dart';

class MessageState {
  RequestState requestState;
  List<Message> messages;
  String messageError;
  var currentMessageEvent;

  MessageState({
    required this.requestState,
    required this.messages,
    required this.messageError,
    required this.currentMessageEvent,
  });

  MessageState.initialState()
      : requestState = RequestState.NONE,
        messages = [],
        messageError = "",
        currentMessageEvent = null;
}
