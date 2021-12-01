import 'package:flutter/material.dart';

// A widget that uses a built in Scaffold widget with pages that use standard
// Scaffold structure with standard Scaffold.AppBar settings and BottomMenuWidget()

class WrapperMainWidget extends StatelessWidget {
  final Widget mainArea;
  final Color bodyBackgroundColor;
  final bool useAppBar;

  const WrapperMainWidget(
      {Key? key,
      required this.mainArea,
      this.bodyBackgroundColor = Colors.white,
      this.useAppBar = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: useAppBar
            ? AppBar(
                backgroundColor: bodyBackgroundColor,
              )
            : null,
        backgroundColor: bodyBackgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 30), child: mainArea),
          ),
        ));
  }
}
