import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/headings.dart';

// This widget displays a heading that contains a centered heading surrounded by
// horizontal lines

class HeadingLinedWidget extends StatelessWidget {
  final String title;
  const HeadingLinedWidget({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _Line(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Text(title, style: ThemeHeadings.themeHeading3),
          ),
          const _Line(),
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Divider());
  }
}
