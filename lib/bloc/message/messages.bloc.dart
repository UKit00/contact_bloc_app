import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contacts_bloc_app/bloc/message/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/message/messages.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/message.model.dart';
import 'package:contacts_bloc_app/repositories/message.repo.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageRepository messageRepository;

  MessageBloc(super.initialState, this.messageRepository) {
    on<MessagesByContactEvent>(_messageByContactEvent);
    on<AddNewMessageEvent>(_addNewMessageEvent);
  }

  Future<void> _messageByContactEvent(
      MessagesByContactEvent event, Emitter<MessageState> emit) async {
    emit(MessageState(
        requestState: RequestState.LOADING,
        messages: state.messages,
        messageError: "",
        currentMessageEvent: event));
    try {
      List<Message> data =
          await messageRepository.messagesByContact(event.payload.id);
      emit(MessageState(
          requestState: RequestState.LOADED,
          messages: data,
          messageError: "",
          currentMessageEvent: event));
    } catch (e) {
      emit(MessageState(
          requestState: RequestState.ERROR,
          messages: state.messages,
          messageError: e.toString(),
          currentMessageEvent: event));
    }
  }

  Future<void> _addNewMessageEvent(
      AddNewMessageEvent event, Emitter<MessageState> emit) async {
    // emit(MessageState(
    //     requestState: RequestState.LOADING,
    //     messages: state.messages,
    //     messageError: "",
    //     currentMessageEvent: event));
    try {
      event.payload.date = DateTime.now();
      Message message = await messageRepository.addNewMessage(event.payload);
      List<Message> data = [...state.messages];
      data.add(message);
      emit(MessageState(
          requestState: RequestState.LOADED,
          messages: data,
          messageError: "",
          currentMessageEvent: event));
    } catch (e) {
      emit(MessageState(
          requestState: RequestState.ERROR,
          messages: state.messages,
          messageError: e.toString(),
          currentMessageEvent: event));
    }
  }
}
