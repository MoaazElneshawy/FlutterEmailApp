import 'package:email_app/managers/calendarManager.dart';
import 'package:email_app/root/observer.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  
  final CalendarManager manager;
  
  Counter({this.manager});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Observer<int>(
              stream: manager.counter$,
              onSuccess: (context, data) {
                return Text(
                  "$data",
                  style: TextStyle(fontSize: 20),
                );
              }),
        ),
        Divider(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton.icon(
                onPressed: () {
                  manager.increment();
                },
                icon: Icon(Icons.plus_one),
                label: Text('Increment')),
            RaisedButton.icon(
                onPressed: () {
                  manager.decrement();
                },
                icon: Icon(Icons.exposure_minus_1),
                label: Text('Decrement')),
          ],
        )
      ],
    );
  }
}
