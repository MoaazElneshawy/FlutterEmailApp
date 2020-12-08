import 'package:email_app/messages/Message.dart';
import 'package:flutter/material.dart';

class ComposeMessage extends StatefulWidget {
  @override
  _ComposeMessageState createState() => _ComposeMessageState();
}

class _ComposeMessageState extends State<ComposeMessage> {
  String leading = "";
  String subject = "";
  String body = "";
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose New Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
              key: key,
              child: Column(
                children: [
                  ListTile(
                      title: TextFormField(
                    validator: (value) {
                      switch (value.length) {
                        case 0:
                          return 'LEADING cannot be empty';
                        case 1:
                          return 'LEADING must be 2 character';
                        default:
                          return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'LEADING',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    onSaved: (value) => leading = value,
                    maxLength: 2,
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                      title: TextFormField(
                    validator: (value) {
                      switch (value.length) {
                        case 0:
                          return 'SUBJECT cannot be empty';
                        default:
                          return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'SUBJECT',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    onSaved: (value) => subject = value,
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                      title: TextFormField(
                    validator: (value) {
                      switch (value.length) {
                        case 0:
                          return 'BODY cannot be empty';
                        default:
                          return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'BODY',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    onSaved: (value) => body = value,
                    maxLines: 10,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton.icon(
                      onPressed: () {
                        if (key.currentState.validate()) {
                          key.currentState.save();

                          Message message = Message(
                              leading: leading, subject: subject, body: body);
                          print(message);
                          Navigator.pop(context, message);
                        }
                      },
                      icon: Icon(Icons.send),
                      label: Text('Send'))
                ],
              )),
        ),
      ),
    );
  }
}
