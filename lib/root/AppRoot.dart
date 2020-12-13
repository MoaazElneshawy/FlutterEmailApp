import 'package:email_app/calendar/Calendar.dart';
import 'package:email_app/contacts/ContactsScreen.dart';
import 'package:email_app/messages/Inbox.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatefulWidget {
  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int bottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Inbox(),
        Contacts('Contacts'),
        Calender("Calendar"),
      ].elementAt(bottomBarIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: "Inbox",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Calendar",
          ),
        ],
        onTap: (index) {
          setState(() {
            bottomBarIndex = index;
          });
        },
        currentIndex: bottomBarIndex,
      ),
    );
  }
}
