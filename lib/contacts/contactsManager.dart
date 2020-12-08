import 'dart:async';

List<String> contacts = ['Baba', 'Mama', 'Amr', 'Moaaz'];

class ContactsManager {
  // create contacts stream
  Stream<List<String>> get contactsList async* {
    for (var i = 0; i < contacts.length; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield contacts.sublist(0, i + 1);
    }
  }

  // listen to another stream
  // create stream controller
  final StreamController<int> contactsCounterController =
      StreamController<int>();

  // attach a stream to stream controller
  Stream<int> get contactsCount => contactsCounterController.stream;

  ContactsManager() {
    // listen to a stream via stream controller
    contactsList.listen((list) {
      contactsCounterController.add(list.length);
    });
  }
}
