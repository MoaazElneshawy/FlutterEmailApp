import 'package:flutter/material.dart';

import '../root/AppDrawer.dart';

class Calender extends StatefulWidget {
  String title;

  Calender(this.title);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
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
