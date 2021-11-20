import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

// A widget that uses a built in Scaffold widget with pages that use standard
// Scaffold structure with standard Scaffold.AppBar settings and BottomMenuWidget()

class WrapperMainWidget extends StatelessWidget {
  final Widget mainArea;
  final Color bodyBackgroundColor;

  const WrapperMainWidget(
      {Key? key,
      required this.mainArea,
      this.bodyBackgroundColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bodyBackgroundColor,
        ),
        backgroundColor: bodyBackgroundColor,
        bottomNavigationBar: const BottomMenuWidget(),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 30), child: mainArea),
          ),
        ));
  }
}
