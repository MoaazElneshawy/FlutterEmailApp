import 'package:email_app/contacts/contact.dart';
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
          // ignore: missing_return
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                List<Contact> contacts = snapshot.data;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      Contact contact = contacts[index];
                      return ListTile(
                        title: Text(contact.name),
                        subtitle: Text(contact.email),
                        leading: CircleAvatar(
                          child: Text("${contact.id}"),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: contacts.length);
            }
          },
        ));
  }
}
