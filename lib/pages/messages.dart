import 'package:flutter/material.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/message.dart';
import 'package:rainbow_challenge/utils/repository/messages_repository.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MessagesPageState();
  }
}

class _MessagesPageState extends State<MessagesPage> {
  List<Message> messages = List<Message>.empty(growable: true);
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      mainArea: getMainAreaView(context),
      title: "Pranešimai",
    );
  }

  Widget getMainAreaView(BuildContext context) {
    if (isLoading)
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()]);

    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        return getListViewCell(messages[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 1,
        height: 10,
      ),
    );
  }

  Widget getListViewCell(Message message) {
    return Text(message.messageText);
  }

  Future loadData() async {
    var fetchedMessages =
        await MessagesRepository(dioClient: DioClient()).fetchMessages();

    setState(() {
      messages = fetchedMessages;
      isLoading = false;
    });
  }
}
