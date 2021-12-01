import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

// Regions page.
// To do everything.

class RegionsPage extends StatefulWidget {
  const RegionsPage({Key? key}) : super(key: key);

  @override
  _RegionsPageState createState() {
    return _RegionsPageState();
  }
}

class _RegionsPageState extends State<RegionsPage>
    with AutomaticKeepAliveClientMixin<RegionsPage> {
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

class _MainArea extends StatelessWidget {
  const _MainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MessageWidget(
      icon: ThemeIcons.regions,
      title: 'Čia bus regionai',
    );
  }
}
