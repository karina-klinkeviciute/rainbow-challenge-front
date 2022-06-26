part of "challenge_quiz_page.dart";

class ChallengeInfo extends StatelessWidget {
  final String uuid;
  const ChallengeInfo({Key? key, required this.uuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengeQuizCubit, ChallengeQuizState>(
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
            child: QuizQuestionWidget(
              uuid: uuid,
              questions: challengeTypeItem.questions,
            ),
          )
        ]);
      },
    );
  }
}
