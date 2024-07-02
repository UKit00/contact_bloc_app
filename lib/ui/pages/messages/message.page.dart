import 'package:contacts_bloc_app/bloc/message/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/message/messages.bloc.dart';
import 'package:contacts_bloc_app/bloc/message/messages.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widget/messages.form.widget.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widget/messages.list.widget.dart';
import 'package:contacts_bloc_app/ui/shared/circular.progress.ind.widget.dart';
import 'package:contacts_bloc_app/ui/shared/error.retrymessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  var contact;
  @override
  Widget build(BuildContext context) {
    this.contact = ModalRoute.of(context)?.settings.arguments;
    context.read<MessageBloc>().add(MessagesByContactEvent(contact));
    return Scaffold(
      appBar: AppBar(
        title: Text("Message de ${contact.name}"),
      ),
      body: Column(children: [
        Expanded(
          child:
              BlocBuilder<MessageBloc, MessageState>(builder: (context, state) {
            if (state.requestState == RequestState.LOADED) {
              return MessagesListWidget(state.messages);
            } else if (state.requestState == RequestState.ERROR) {
              return ErrorRetryMessage(
                  errorMessage: state.messageError,
                  onAction: () {
                    context
                        .read<MessageBloc>()
                        .add(MessagesByContactEvent(contact));
                  });
            } else if (state.requestState == RequestState.LOADING) {
              return MyCircularProgressIndWidget();
            } else {
              return Container();
            }
          }),
        ),
        MessagesFormWidget(contact),
      ]),
    );
  }
}
