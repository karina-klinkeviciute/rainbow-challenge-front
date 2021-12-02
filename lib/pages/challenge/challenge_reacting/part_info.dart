part of "challenge_reacting_page.dart";

Widget _challengeInfo =
    BlocBuilder<ChallengeReactingCubit, ChallengeReactingState>(
  builder: (context, state) {
    if (!(state is ChallengeReactingLoaded))
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
