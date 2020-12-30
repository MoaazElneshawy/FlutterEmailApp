import 'package:email_app/managers/calendarManager.dart';
import 'package:email_app/managers/contactsManager.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final ContactsManager contactsManager;
  final CalendarManager calenderManager;

  Provider({this.contactsManager, this.calenderManager, Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Provider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Provider>();
}
