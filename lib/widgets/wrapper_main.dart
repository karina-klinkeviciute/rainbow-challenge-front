import 'package:flutter/material.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/theme/colors.dart';

// A widget that uses a built in Scaffold widget with pages that use standard
// Scaffold structure with standard Scaffold.AppBar settings and BottomMenuWidget()
// If you want custom back button went to specific page set useAppBar=false and set index
class WrapperMainWidget extends StatelessWidget {
  final Widget mainArea;
  final Color bodyBackgroundColor;
  final bool useAppBar;
  final String title;
  final int index;

  const WrapperMainWidget(
      {Key? key,
      required this.mainArea,
      this.bodyBackgroundColor = Colors.white,
      this.useAppBar = true,
      this.title = "",
      this.index = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: useAppBar
            ? AppBar(
                backgroundColor: bodyBackgroundColor,
                title: Text(title,
                    style: TextStyle(color: ThemeColors.secondaryColor)),
              )
            : AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_sharp),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NewsPage(index: index);
                        },
                      ),
                    );
                  },
                ),
              ),
        backgroundColor: bodyBackgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 30), child: mainArea),
          ),
        ));
  }
}
