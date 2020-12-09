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

  static Future<List<Contact>> getContacts() async {
    http.Response response =
        await http.get("https://jsonplaceholder.typicode.com/users");

    await Future.delayed(Duration(seconds: 2));

    List contactsJson = json.decode(response.body);
    print(contactsJson);
    return contactsJson.map((json) => Contact.fromJson(json)).toList();
  }
}
