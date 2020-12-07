import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class Contacts extends StatefulWidget {

  String title ;
  Contacts(this.title);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: AppDrawer(),
    );
  }
}
