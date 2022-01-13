import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/headings.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

// A widget that displays an icon - material or our own -
// together with big number and a label in column layout.

class StatsWidget extends StatelessWidget {
  final IconData? icon;
  final String? localIcon;
  final String number;
  final String label;
  // const MessageWidget({ Key  key }) : super(key: key);

  const StatsWidget({
    Key? key,
    this.icon,
    this.localIcon,
    required this.number,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon),
          if (localIcon != null) ImageLocalWidget(url: localIcon!, width: 32),
          Text(number,
              style: ThemeHeadings.bigNumber.merge(TextStyle(height: 1))),
          Text(label,
              style: ThemeHeadings.themeHeading4.merge(TextStyle(height: 1))),
        ],
      ),
    );
  }
}
