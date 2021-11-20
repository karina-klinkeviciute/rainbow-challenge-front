import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

// Profile page
// TO DO: everything

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
      icon: Icons.account_circle,
      title: 'Čia bus tavo profilis',
    );
  }
}
