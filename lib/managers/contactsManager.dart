import 'dart:async';

import 'package:email_app/contacts/contact.dart';

import 'package:rxdart/rxdart.dart';


// List<String> contacts = ['Baba', 'Mama', 'Amr', 'Moaaz'];

class ContactsManager {
  // create contacts stream

  Stream<List<Contact>> get contactsList async* {
    yield await Contact.getContacts();
  }

  // create a stream using fromFuture method
  Stream<List<Contact>> filteredList(String query) {
    return Stream.fromFuture(Contact.getContacts(query: query));
  }

  // listen to another stream
  // create stream controller
  final BehaviorSubject<int> contactsCounterController =
      BehaviorSubject<int>();

  // attach a stream to stream controller
  Stream<int> get contactsCount => contactsCounterController.stream;

  ContactsManager() {
    // listen to a stream via stream controller
    contactsList.listen((list) {
      contactsCounterController.add(list.length);
    });
  }
}
