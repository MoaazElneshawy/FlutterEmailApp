import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'Message.g.dart';

@JsonSerializable()
class Message {
  String leading;
  String subject;
  String body;

  Message({this.leading, this.subject, this.body});

  // Message.fromJson(Map<String,dynamic> json){
  //   this.leading = json['leading'];
  //   this.subject = json['subject'];
  //   this.body = json['body'];
  // }

  // Message.fromJson(Map<String, dynamic> json)
  //     :this.leading = json['leading'],
  //       this.subject = json['subject'],
  //       this.body = json['body'];

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> loadMessages() async {
    // read a local json file
    var data = await rootBundle.loadString('data/messages.json');
    List decodedMessages = json.decode(data);

    // read messages from api link
    // http.Response data = await http
    //     .get('https://run.mocky.io/v3/357385c9-3a6a-4607-84ec-b649208be405');
    // List decodedMessages = json.decode(data.body);

    List<Message> _messages =
        decodedMessages.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}
