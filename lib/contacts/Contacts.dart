import 'package:flutter/material.dart';

import '../root/AppDrawer.dart';
import 'contactsManager.dart';

class Contacts extends StatefulWidget {
  String title;

  Contacts(this.title);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  ContactsManager manager = ContactsManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Chip(
                label: StreamBuilder(
              stream: manager.contactsCount,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Text((snapshot.data ?? 0).toString());
              },
            )),
            Padding(padding: EdgeInsets.only(right: 16))
          ],
        ),
        drawer: AppDrawer(),
        body: StreamBuilder(
          stream: manager.contactsList,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            List<String> contacts = snapshot.data;
            return snapshot.hasData
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(contacts[index]),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: contacts.length)
                : Center(
                    child: Text('...'),
                  );
          },
        ));
  }
}
