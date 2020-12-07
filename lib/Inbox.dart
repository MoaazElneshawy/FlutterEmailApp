import 'package:flutter/material.dart';

import 'AppDrawer.dart';
import 'messagesList.dart';

class Inbox extends StatelessWidget {
  String title;

  Inbox({this.title = "Inbox"});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                text: 'Local',
                icon: Icon(Icons.local_activity),
              ),
              Tab(
                text: 'Network',
                icon: Icon(Icons.network_wifi),
              ),
            ]),
            title: Text(title),
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
