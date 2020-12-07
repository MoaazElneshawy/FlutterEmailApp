import 'package:email_app/AppDrawer.dart';
import 'package:email_app/messagesList.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatefulWidget {
  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(text: 'Local',icon: Icon(Icons.local_activity),),
              Tab(text: 'Network',icon: Icon(Icons.network_wifi),),
            ]),
            title: Text('Email App'),
            centerTitle: true,
          ),
          drawer: AppDrawer(),
          body: TabBarView(children: [
            MessagesList(
              title: 'Local',
              status: 'local',
            ),
            MessagesList(
              title: 'Network',
              status: 'network',
            )
          ]),
        ));
  }
}
