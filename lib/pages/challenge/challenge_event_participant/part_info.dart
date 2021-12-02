part of "challenge_event_participant_page.dart";

Widget _challengeInfo =
    BlocBuilder<ChallengeEventParticipantCubit, ChallengeEventParticipantState>(
  builder: (context, state) {
    if (!(state is ChallengeEventParticipantLoaded))
      return Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: CircularProgressIndicator(),
      ));
    final challengeTypeItem = (state).challengeTypeItem;
    return Column(children: [
      ChallengeHeadlineWidget(
        title: challengeTypeItem.main_challenge.name,
        points: challengeTypeItem.main_challenge.points,
      ),
      ChallengeDescriptionWidget(
          description: challengeTypeItem.main_challenge.description),
    ]);
  },
);
