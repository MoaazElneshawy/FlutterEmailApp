// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    leading: json['leading'] as String,
    subject: json['subject'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'leading': instance.leading,
      'subject': instance.subject,
      'body': instance.body,
    };
