import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';

// A colored area widget used to create a section with rounded borders
// and custom background color.

// TO DO: We should manage theme modes darkMode and lightMode.

class ColoredAreaWidget extends StatelessWidget {
  final Color backgroundColor;
  final Widget content;
  const ColoredAreaWidget(
      {Key key,
      this.backgroundColor = ThemeColors.bgColorLight,
      @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(16)),
        child: content);
  }
}
