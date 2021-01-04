import 'dart:async';

import 'package:email_app/contacts/contact.dart';
import 'package:rxdart/rxdart.dart';

class ContactsManager {
  final PublishSubject<String> _filterSubject =
      PublishSubject(); // for coming data
  final PublishSubject<int> _counterSubject = PublishSubject<int>();
  final PublishSubject<List<Contact>> _contactsSubject =
      PublishSubject<List<Contact>>(); // for outgoing data

  // Sink for Manager accepting data through it
  Sink<String> get filter => _filterSubject.sink;

  Stream<int> get counter$ => _counterSubject.stream;

  Stream<List<Contact>> get contacts$ => _contactsSubject.stream;

  ContactsManager() {
    // debounce is used to solve back pressure issue out of calling many api requests.
    // switchMap is used to focus only on the last api request call
    _filterSubject
        .debounceTime(Duration(milliseconds: 500))
        .switchMap((query) async* {
      yield await Contact.getContacts(query: query);
    }).listen((contacts) async {
      _contactsSubject.add(contacts);
    });

    _contactsSubject.listen((value) {
      _counterSubject.add(value.length);
    });
  }

  void dispose() {
    _counterSubject.close();
    _filterSubject.close();
  }
}
