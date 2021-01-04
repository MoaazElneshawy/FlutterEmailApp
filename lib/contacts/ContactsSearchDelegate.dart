import 'package:email_app/contacts/ContactsStreamBuilder.dart';
import 'package:email_app/contacts/contact.dart';
import 'package:email_app/root/Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsSearchDelegate extends SearchDelegate {
  // final ContactsManager manager;
  //
  // ContactsSearchDelegate({this.manager});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var manager = Provider.of(context).contactsManager;
    manager.filter.add(query);

    return ContactsStreamBuilder(
        stream: manager.contacts$,
        builder: (context, contacts) {
          List<Contact> contactsList = contacts;
          if (contactsList.length > 0) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  Contact contact = contactsList[index];
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
          } else
            return Text('No results match $query');
        });
  }
}
