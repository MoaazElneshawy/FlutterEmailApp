import 'package:email_app/contacts/contact.dart';
import 'package:flutter/material.dart';

class ContactsStreamBuilder extends StatelessWidget {
  final Stream stream;
  final Function builder;

  const ContactsStreamBuilder({this.stream, this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Contact>>(
      stream: stream,
      builder:
      // ignore: missing_return
          (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            List<Contact> contacts = snapshot.data;
            return builder(context,contacts);
        }
      },
    );
  }
}
