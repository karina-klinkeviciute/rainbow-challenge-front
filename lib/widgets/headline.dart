import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/headings.dart';

// This widget displays a standard headline that consist of page title and subtitle.

class HeadlineWidget extends StatelessWidget {
  final String title;
  final String? subtitle;

  const HeadlineWidget({Key? key, required this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            title.toUpperCase(),
            style: ThemeHeadings.themeHeading2,
            textAlign: TextAlign.center,
          ),

          // Show subtitle only if it exists
          if (subtitle != null)
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3!.merge(
                  const TextStyle(color: ThemeColors.primaryColor, height: 1)),
            ),
        ],
      ),
    );
  }
}
