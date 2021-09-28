import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/wrapper_simple.dart';

// Loading page that could be shown while the app is loading on start.
// TO DO:
// 1. Replace hard coded values
// 2. Functionality

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WrapperSimpleWidget(
        bodyBackgroundColor: ThemeColors.primaryColorDark,
        mainArea: _LoadingArea());
  }
}

class _LoadingArea extends StatelessWidget {
  const _LoadingArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 80,
          child:
              Center(child: Image.asset('assets/images/logo.png', height: 200)),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: LinearProgressIndicator(
              value: 0.7,
              semanticsLabel: 'Linear progress indicator',
              backgroundColor: Colors.white.withOpacity(0.8),
              color: ThemeColors.secondaryColor,
            ))
      ],
    );
  }
}
