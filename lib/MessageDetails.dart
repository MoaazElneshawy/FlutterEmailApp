import 'package:flutter/material.dart';

class MessageDetails extends StatelessWidget {

  final String title;
  final String message;

  MessageDetails(this.title,this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Text(message),
        ),
      ),
    );
  }
}
