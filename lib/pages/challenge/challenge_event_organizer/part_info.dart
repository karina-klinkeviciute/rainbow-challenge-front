part of "challenge_event_organizer_page.dart";

Widget _challengeInfo =
    BlocBuilder<ChallengeEventOrganizerCubit, ChallengeEventOrganizerState>(
  builder: (context, state) {
    if (!(state is ChallengeEventOrganizerLoaded))
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
