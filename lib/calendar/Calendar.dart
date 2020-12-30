import 'package:email_app/root/Provider.dart';
import 'package:flutter/material.dart';

import '../root/AppDrawer.dart';
import 'counter.dart';

class Calender extends StatefulWidget {
  String title;

  Calender(this.title);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    var manager = Provider.of(context).calenderManager;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 8),
        child: Counter(manager: manager),
      ),
    );
  }
}
