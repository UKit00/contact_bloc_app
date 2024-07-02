import 'package:contacts_bloc_app/model/message.model.dart';
import 'package:flutter/material.dart';

class MessageItemWidget extends StatelessWidget {
  Message message;

  MessageItemWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: (message.type == 'sent')
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10),
              color: (message.type == 'sent')
                  ? Color.fromARGB(20, 0, 255, 0)
                  : Color.fromARGB(20, 255, 0, 0),
              child: Text('${message.content}'),
              foregroundDecoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
            ),
          ),
        ],
      ),
    );
  }
}
