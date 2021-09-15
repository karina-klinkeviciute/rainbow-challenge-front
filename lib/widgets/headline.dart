import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';

// This widget displays a standard headline that consist of page title and subtitle.

class HeadlineWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const HeadlineWidget({Key  key,@required this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.headline2.merge(TextStyle(
                    color: ThemeColors.primaryColor,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 0,
                        color: ThemeColors.tetriaryColor.withOpacity(0.7),
                      ),
                      Shadow(
                        offset: const Offset(-2.0, -2.0),
                        blurRadius: 0,
                        color: ThemeColors.secondaryColor.withOpacity(0.3),
                      ),
                    ])),
          ),
          // Show subtitle only if it exists
          if (subtitle != null)
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3.merge(
                  const TextStyle(color: ThemeColors.primaryColor, height: 1)),
            ),
        ],
      ),
    );
  }
}
