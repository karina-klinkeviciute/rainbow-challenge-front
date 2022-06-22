part of "challenge_quiz_page.dart";

Widget _challengeInfo = BlocBuilder<ChallengeQuizCubit, ChallengeQuizState>(
  builder: (context, state) {
    if (!(state is ChallengeQuizLoaded))
      return Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: CircularProgressIndicator(),
      ));
    final challengeTypeItem = (state).challengeTypeItem;
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.8,
        // child: QuizQuestionWidget(
        //   questions: challengeTypeItem.questions,
        // ),
      )
    ]);
  },
);
