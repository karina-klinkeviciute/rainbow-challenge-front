import 'package:flutter/material.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/pages/__example.dart';
import 'package:rainbow_challenge/pages/challenges/challenges_page.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_class.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class ChallengePage extends StatelessWidget {
  ChallengePage({Key? key, required this.challengeInfo}) : super(key: key);
  final Challenge challengeInfo;

  @override
  Widget build(BuildContext context) {
    //  BlocProvider.of<ChallengesCubit>(context).fetchChallenges();
    return WrapperMainWidget(
        mainArea: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          ChallengeHeadlineWidget(
            title: challengeInfo.name,
            points: challengeInfo.points,
          ),
          ChallengeDescriptionWidget(description: challengeInfo.description),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  _buttonArea,
                  _challengeFormArea,
                ],
              ))
        ],
      ),
    ));
  }

  // Work in progress
  // Check if challenge_joined_type/{uuid} status == 'joined'
  // If != then show _buttonArea
  // Else show _challengeFormArea

  Widget _buttonArea = Text('If not joined - Join Challenge button',
      style: TextStyle(color: Colors.red));
  Widget _challengeFormArea =
      Text('If joined - Challenge form', style: TextStyle(color: Colors.green));
}

class ChallengePageArguments {
  final String title;

  ChallengePageArguments({
    required this.title,
  });
}
