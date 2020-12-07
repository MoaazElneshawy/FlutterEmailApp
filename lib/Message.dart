import 'dart:convert';

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

  static Future<List<Message>> loadMessages(String status) async {
    String url = "https://run.mocky.io/v3/599f25d1-cb13-4f44-9c6a-d4fe5c54c52c";

    if (status != "important") {
      url = "https://run.mocky.io/v3/357385c9-3a6a-4607-84ec-b649208be405";
    }
    // read messages from api link
    http.Response data = await http.get(url);
    List decodedMessages = json.decode(data.body);
    return decodedMessages.map((json) => Message.fromJson(json)).toList();
  }
}
