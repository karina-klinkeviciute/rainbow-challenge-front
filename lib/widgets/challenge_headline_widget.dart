import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class ChallengeHeadlineWidget extends StatelessWidget {
  final String title;
  final int points;
  const ChallengeHeadlineWidget(
      {Key? key, required this.title, required this.points})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(children: [
        Expanded(
            child: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .merge(TextStyle(color: ThemeColors.primaryColor)))),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            ImageLocalWidget(
              url: 'assets/images/rainbow.png',
              width: 16,
            ),
            Text(points.toString(),
                style: Theme.of(context).textTheme.displaySmall!)
          ],
        )
      ]),
    );
  }
}
