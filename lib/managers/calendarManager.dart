import 'package:rxdart/rxdart.dart';

/*
BehaviorSubject is a data provider for a Stream which attach itself to the data provider

Stream listens to BehaviorSubject updates

 */

class CalendarManager {
  // .seeded(0) is an initial value for the stream
  BehaviorSubject<int> clicksCounter = BehaviorSubject<int>.seeded(0);

  // counter is the new value of the stream
  int get currentValue => clicksCounter.value;

  // $ is like an indicator that this is a stream
  Stream get counter$ => clicksCounter.stream;


  // increment and decrement methods to apply changes on the data provider
  void increment() => clicksCounter.add(currentValue + 1);

  void decrement() => clicksCounter.add(currentValue - 1);
}
