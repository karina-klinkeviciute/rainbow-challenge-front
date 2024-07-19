
// explicitToJson lets using nested class Challenge
class ChallengeQuizCorrectAnswers {
  ChallengeQuizCorrectAnswers({required this.correct_answers_count});

  int correct_answers_count;

  factory ChallengeQuizCorrectAnswers.fromJson(Map<String, dynamic> json) =>
      ChallengeQuizCorrectAnswers(
          correct_answers_count: (json["correct_answers_count"]));
}
