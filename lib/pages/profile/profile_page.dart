import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

// Profile page
// TO DO: everything

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
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

class _profilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WrapperMainWidget(
      mainArea: _MainArea(),
      bodyBackgroundColor: ThemeColors.bgColorLight,
      useAppBar: false,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
