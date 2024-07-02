import 'package:contacts_bloc_app/bloc/message/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/message/messages.bloc.dart';
import 'package:contacts_bloc_app/model/message.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/contact.model.dart';

class MessagesFormWidget extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();
  Contact contact;

  MessagesFormWidget(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              Message msg = Message(
                  id: 0,
                  contactID: contact.id,
                  date: DateTime.now(),
                  content: textEditingController.text,
                  type: 'sent');
              context.read<MessageBloc>().add(new AddNewMessageEvent(msg));

              Message reply = Message(
                  id: 0,
                  contactID: contact.id,
                  date: DateTime.now(),
                  content: "Answer to: " + textEditingController.text,
                  type: 'recieve');
              context.read<MessageBloc>().add(new AddNewMessageEvent(reply));
            },
          )
        ],
      ),
    );
  }
}
