part of "challenge_project_page.dart";

Widget _challengeInfo =
    BlocBuilder<ChallengeProjectCubit, ChallengeProjectState>(
  builder: (context, state) {
    if (!(state is ChallengeProjectLoaded))
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
      ChallengeEndDateWidget(
          endDate: challengeTypeItem.main_challenge.end_date),
      ChallengeDescriptionWidget(
          description: challengeTypeItem.main_challenge.description),
    ]);
  },
);
