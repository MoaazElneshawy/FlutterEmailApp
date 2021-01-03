import 'package:email_app/contacts/ContactsSearchDelegate.dart';
import 'package:email_app/contacts/contact.dart';
import 'package:email_app/root/Provider.dart';
import 'package:email_app/root/observer.dart';
import 'package:flutter/material.dart';

import '../root/AppDrawer.dart';
import 'ContactsStreamBuilder.dart';

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
    var manager = Provider.of(context).contactsManager;

    // pass initial value to Sink
    manager.filter.add('');

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Chip(
                label: Observer<int>(
              stream: manager.counter$,
              onSuccess: (BuildContext context, int data) {
                return Text((data ?? 0).toString());
              },
              onLoading: (context) => Text('..'),
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
            stream: manager.contacts$,
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
