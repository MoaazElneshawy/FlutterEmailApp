import 'package:email_app/contacts/ContactsStreanBuilder.dart';
import 'package:email_app/root/Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';

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
    var manager = Provider.of(context).manager;

    if (query == null || query.isEmpty) {
      return Center(
        child: Text(
          'write your search ...',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      );
    } else if (query.length < 3) {
      return Center(
        child: Text('search keyword at least 3 characters',
            style: TextStyle(fontWeight: FontWeight.bold)),
      );
    } else {
      return ContactsStreamBuilder(
          stream: manager.filteredList(query),
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
          });
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
