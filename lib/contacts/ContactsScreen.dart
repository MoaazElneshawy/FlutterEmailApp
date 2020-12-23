import 'package:email_app/contacts/ContactsSearchDelegate.dart';
import 'package:email_app/contacts/contact.dart';
import 'package:email_app/root/Provider.dart';
import 'package:flutter/material.dart';

import '../root/AppDrawer.dart';
import 'ContactsStreanBuilder.dart';

class Contacts extends StatefulWidget {
  String title;

  Contacts(this.title);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  // ContactsManager manager = ContactsManager();

  @override
  Widget build(BuildContext context) {
    var manager = Provider.of(context).manager;

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
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context, delegate: ContactsSearchDelegate());
              },
            ),
            Padding(padding: EdgeInsets.only(right: 16))
          ],
        ),
        drawer: AppDrawer(),
        body: ContactsStreamBuilder(
            stream: manager.contactsList,
            builder: (context, contacts) {
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
            }));
  }
}
