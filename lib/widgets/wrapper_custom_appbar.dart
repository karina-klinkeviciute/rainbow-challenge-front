import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';

// A widget that uses a built in Scaffold widget with pages that use standard
// Scaffold structure with custom Scaffold.AppBar settings

class WrapperCustomAppbarWidget extends StatelessWidget {
  final Widget mainArea;
  final Color bodyBackgroundColor;
  final AppBar appBar;
  final String title;

  const WrapperCustomAppbarWidget(
      {Key? key,
      required this.mainArea,
      this.bodyBackgroundColor = Colors.white,
      required this.appBar,
      this.title = ""})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        backgroundColor: bodyBackgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 30), child: mainArea),
          ),
        ));
  }
}
