import 'package:contacts_bloc_app/bloc/contacts.actions.dart';
import 'package:contacts_bloc_app/bloc/contacts.bloc.dart';
import 'package:contacts_bloc_app/bloc/contacts.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/ui/pages/contacts/widgets/contacts.bar.buttons.dart';
import 'package:contacts_bloc_app/ui/pages/contacts/widgets/contacts.list.dart';
import 'package:contacts_bloc_app/ui/shared/error.retrymessage.dart';
import 'package:flutter/material.dart';
//import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
        ),
        body: Column(
          children: [
            ContactBarButtons(),
            Expanded(
              child: BlocBuilder<ContactsBloc, ContactsState>(
                  builder: (context, state) {
                if (state.requestState == RequestState.LOADING) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.requestState == RequestState.ERROR) {
                  return ErrorRetryMessage(
                    errorMessage: "Internet Error",
                    onAction: () {
                      context.read<ContactsBloc>().add(state.currentEvent);
                    },
                  );
                } else if (state.requestState == RequestState.LOADED) {
                  return ContactsList(contacts: state.contacts);
                } else {
                  return Container();
                }
              }),
            ),
          ],
        ));
  }
}
