import 'package:email_app/contacts/contactsManager.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {

  final ContactsManager manager;

  Provider({this.manager,Key key,Widget child}):super(key: key,child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Provider of (BuildContext context)=> context.dependOnInheritedWidgetOfExactType<Provider>();

}
