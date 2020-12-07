import 'package:email_app/ComposeMessage.dart';
import 'package:email_app/Message.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatefulWidget {
  final List<Message> messages;

  ComposeButton(this.messages);

  @override
  _ComposeButtonState createState() => _ComposeButtonState();
}

class _ComposeButtonState extends State<ComposeButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        Message message = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ComposeMessage()));

        if (message != null) {
          setState(() {
            widget.messages.add(message);
          });
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Message sent !'),
            backgroundColor: Colors.green,
          ));
        }
      },
      child: Icon(
        Icons.messenger_outline_sharp,
        color: Colors.white,
      ),
    );
  }
}
