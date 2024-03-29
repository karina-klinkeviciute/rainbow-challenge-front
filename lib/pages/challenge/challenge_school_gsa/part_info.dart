part of "challenge_school_gsa_page.dart";

Widget _challengeInfo =
    BlocBuilder<ChallengeSchoolGsaCubit, ChallengeSchoolGsaState>(
  builder: (context, state) {
    if (!(state is ChallengeSchoolGsaLoaded))
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
