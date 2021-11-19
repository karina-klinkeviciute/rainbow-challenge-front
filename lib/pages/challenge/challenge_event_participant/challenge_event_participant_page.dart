import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

// Single challenge page of type Event Participant.

class ChallengeEventParticipantPage extends StatelessWidget {
  const ChallengeEventParticipantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  BlocProvider.of<ChallengesCubit>(context).fetchChallenges();
    return const WrapperMainWidget(
      mainArea: _MainArea(),
    );
  }
}

class _MainArea extends StatelessWidget {
  const _MainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          ChallengeHeadlineWidget(
            title: 'TITLE',
            points: 5,
          ),
          ChallengeDescriptionWidget(description: 'DESCRIPTION')
        ],
      ),
    );
  }
}
