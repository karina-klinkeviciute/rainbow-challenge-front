import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    required this.uuid,
    required this.messageText,
    required this.user,
    required this.adminSender,
    required this.timeSent,
    required this.seen,
  });

  String uuid;
  String messageText;
  String user;
  String adminSender;
  DateTime timeSent;
  bool seen;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        uuid: json["uuid"],
        messageText: json["message_text"],
        user: json["user"],
        adminSender: json["admin_sender"],
        timeSent: DateTime.parse(json["time_sent"]),
        seen: json["seen"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "message_text": messageText,
        "user": user,
        "admin_sender": adminSender,
        "time_sent": timeSent.toIso8601String(),
        "seen": seen,
      };
}
