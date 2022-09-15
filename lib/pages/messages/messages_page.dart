import 'package:flutter/material.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/model/message.dart';
import 'package:rainbow_challenge/utils/repository/messages_repository.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'message_page.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MessagesPageState();
  }
}

class _MessagesPageState extends State<MessagesPage> {
  List<Message> messages = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      useAppBar: false,
      index: 4,
      useScroll: false,
      mainArea: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              HeadlineWidget(
                  title: AppLocalizations.of(context)!.menu_messages),
              Expanded(child: getMainAreaView(context)),
            ],
          )),
      title: AppLocalizations.of(context)!.menu_messages,
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
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
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
    return GestureDetector(
        child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(message.messageText ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: message.seen
                                ? FontWeight.normal
                                : FontWeight.bold))),
                Icon(
                  Icons.chevron_right_outlined,
                  color: ThemeColors.secondaryColor.withOpacity(0.7),
                  size: 24.0,
                ),
              ],
            )),
        onTap: () async {
          await onMessageClick(message);
        });
  }

  Future onMessageClick(Message message) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MessagePage(message: message);
    }));
    setState(() {
      isLoading = true;
    });

    loadData();
  }

  Future loadData() async {
    var fetchedMessages =
        await MessagesRepository(dioClient: DioClient()).fetchMessages();

    setState(() {
      messages = fetchedMessages
        ..sort((a, b) => b.timeSent.compareTo(a.timeSent));
      isLoading = false;
    });
  }
}
