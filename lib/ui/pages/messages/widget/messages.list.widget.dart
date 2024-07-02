import 'package:contacts_bloc_app/model/message.model.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widget/messages.item.widget.dart';
import 'package:flutter/material.dart';

class MessagesListWidget extends StatelessWidget {
  List<Message> messages;

  MessagesListWidget(this.messages);

  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    return ListView.separated(
      controller: scrollController,
      itemBuilder: (context, index) =>
          MessageItemWidget(message: messages[index]),
      separatorBuilder: (context, index) => Divider(
        height: 2,
        color: Colors.deepOrange,
      ),
      itemCount: messages.length,
    );
  }
}
