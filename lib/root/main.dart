import 'package:email_app/contacts/contactsManager.dart';
import 'package:email_app/root/AppRoot.dart';
import 'package:email_app/root/Provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      manager: ContactsManager(),
      child: MaterialApp(
        title: 'Email App',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AppRoot(),
      ),
    );
  }
}
