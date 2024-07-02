import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contacts_bloc_app/bloc/contacts.actions.dart';
import 'package:contacts_bloc_app/bloc/contacts.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/repositories/contact.repo.dart';

import '../model/contact.model.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsRepository contactsRepository;
  ContactsBloc(super.initialState, this.contactsRepository) {
    on<LoadAllContactsEvent>(_onLoadAllContactsEvent);
    on<LoadDevelopersEvent>(_onLoadDevelopersEvent);
    on<LoadStudentsEvent>(_onLoadStudentsEvent);
  }

  Future<void> _onLoadAllContactsEvent(
      LoadAllContactsEvent event, Emitter<ContactsState> emit) async {
    emit(ContactsState(
      contacts: state.contacts,
      requestState: RequestState.LOADING,
      errorMessage: "",
      currentEvent: event,
    ));
    try {
      List<Contact> data = await contactsRepository.allContacts();
      emit(ContactsState(
        contacts: data,
        requestState: RequestState.LOADED,
        errorMessage: "",
        currentEvent: event,
      ));
    } catch (e) {
      print(e);
      emit(ContactsState(
        contacts: state.contacts,
        requestState: RequestState.ERROR,
        errorMessage: e.toString(),
        currentEvent: event,
      ));
    }
  }

  FutureOr<void> _onLoadDevelopersEvent(
      LoadDevelopersEvent event, Emitter<ContactsState> emit) async {
    emit(ContactsState(
      contacts: state.contacts,
      requestState: RequestState.LOADING,
      errorMessage: "",
      currentEvent: event,
    ));
    try {
      Iterable<Contact> data =
          await contactsRepository.contactsByType("Developer");
      emit(ContactsState(
        contacts: data,
        requestState: RequestState.LOADED,
        errorMessage: "",
        currentEvent: event,
      ));
    } catch (e) {
      print(e);
      emit(ContactsState(
        contacts: state.contacts,
        requestState: RequestState.ERROR,
        errorMessage: e.toString(),
        currentEvent: event,
      ));
    }
  }

  FutureOr<void> _onLoadStudentsEvent(
      LoadStudentsEvent event, Emitter<ContactsState> emit) async {
    emit(ContactsState(
      contacts: state.contacts,
      requestState: RequestState.LOADING,
      errorMessage: "",
      currentEvent: event,
    ));
    try {
      Iterable<Contact> data =
          await contactsRepository.contactsByType("Student");
      emit(ContactsState(
        contacts: data,
        requestState: RequestState.LOADED,
        errorMessage: "",
        currentEvent: event,
      ));
    } catch (e) {
      print(e);
      emit(ContactsState(
        contacts: state.contacts,
        requestState: RequestState.ERROR,
        errorMessage: e.toString(),
        currentEvent: event,
      ));
    }
  }
}
