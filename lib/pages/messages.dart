import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:rainbow_challenge/widgets/message.dart';
import 'package:rainbow_challenge/widgets/wrapper_main.dart';

// Messages page.
// To do everything.

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      mainArea: _MainArea(),
      bodyBackgroundColor: ThemeColors.bgColorLight,
    );
  }
}

class _MainArea extends StatelessWidget {
  const _MainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MessageWidget(
      icon: ThemeIcons.chat,
      title: 'Čia galėsi susirašinėti',
    );
  }
}
