import 'package:flutter/material.dart';

// A widget that uses a built in Scaffold widget for pages where fullscreen
// Scaffold.body is applied. No appBar or bottomMenu() is used here.

class WrapperSimpleWidget extends StatelessWidget {
  final Widget mainArea;
  final Color bodyBackgroundColor;

  const WrapperSimpleWidget(
      {Key? key,
      required this.mainArea,
      this.bodyBackgroundColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bodyBackgroundColor,
        body: SafeArea(top: true, bottom: true, child: mainArea));
  }
}
