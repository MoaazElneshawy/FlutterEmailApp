import 'dart:convert';

import 'package:http/http.dart' as http;

class Contact {
  int id;
  String name;
  String email;

  Contact.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.email = json['email'];
  }

  // {query} between the parentheses means it's optional to be passed or not
  static Future<List<Contact>> getContacts({query}) async {
    http.Response response =
        await http.get("https://jsonplaceholder.typicode.com/users");

    List contactsJson = json.decode(response.body);

    Iterable<Contact> contacts = contactsJson.map((json) => Contact.fromJson(json));

    if (query != null && query.toString().isNotEmpty) {
      contacts = contacts.where((element) => element
          .name
          .toLowerCase()
          .contains(query.toString().toLowerCase()));
    }

    return contacts.toList();
  }
}
