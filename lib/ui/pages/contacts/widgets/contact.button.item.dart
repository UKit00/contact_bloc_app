import 'package:contacts_bloc_app/bloc/contacts.actions.dart';
import 'package:contacts_bloc_app/bloc/contacts.bloc.dart';
import 'package:contacts_bloc_app/bloc/contacts.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsButtonItem extends StatelessWidget {
  String buttonLabel;
  ContactsEvent contactsEvent;

  ContactsButtonItem({required this.buttonLabel, required this.contactsEvent});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
      return Container(
        padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
        decoration: BoxDecoration(
            border: Border.all(
          width: (state.currentEvent.runtimeType == contactsEvent.runtimeType)
              ? 5
              : 0,
          color: Colors.deepOrange,
        )),
        child: ElevatedButton(
          onPressed: () {
            //print("loadAllContacts");
            context.read<ContactsBloc>().add(contactsEvent);
          },
          child: Text(buttonLabel),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            //textStyle: TextStyle(color: Colors.white, ),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0), // Rounded corners
            ),
          ),
        ),
      );
    });
  }
}
