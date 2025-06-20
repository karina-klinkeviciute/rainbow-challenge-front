import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/message.dart';
import 'package:rainbow_challenge/utils/repository/messages_repository.dart';
import 'package:rainbow_challenge/widgets/wrapper_main.dart';
import 'package:rainbow_challenge/localization/app_localizations.dart'; 

class MessagePage extends StatefulWidget {
  final Message message;

  MessagePage({required this.message});

  @override
  State<StatefulWidget> createState() {
    return _MessagePageState(message: message);
  }
}

class _MessagePageState extends State<MessagePage> {
  final Message message;

  _MessagePageState({required this.message});

  @override
  void initState() {
    super.initState();
    updateMessage();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      mainArea: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(DateFormat('yyyy-MM-dd kk:mm').format(message.timeSent)),
              Container(height: 24),
              Text(message.messageText ?? ""),
              Container(height: 24),
              Text(message.adminSender ?? ""),
            ],
          )),
      title: AppLocalizations.of(context)!.messages_message,
    );
  }

  Future<void> updateMessage() async {
    await MessagesRepository(dioClient: DioClient())
        .setSeen(message.uuid ?? "");
  }
}
