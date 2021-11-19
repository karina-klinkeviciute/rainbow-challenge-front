import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class ChallengeDescriptionWidget extends StatelessWidget {
  final String description;
  const ChallengeDescriptionWidget({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(data: description);
  }
}
