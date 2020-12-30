import 'package:email_app/contacts/contact.dart';
import 'package:email_app/root/observer.dart';
import 'package:flutter/material.dart';

class ContactsStreamBuilder extends StatelessWidget {
  final Stream stream;
  final Function builder;

  const ContactsStreamBuilder({this.stream, this.builder});

  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
      stream: stream,
      onSuccess: (BuildContext context, List<Contact> data) {
        return builder(context, data);
      },
      onLoading: (context) => LinearProgressIndicator(),
    );
  }
}
