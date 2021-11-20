import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_quiz_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeQuiz {
  ChallengeQuiz(
      {required this.uuid, required this.quiz, required this.mainChallenge});

  String uuid;
  Challenge mainChallenge;
  String quiz;

  factory ChallengeQuiz.fromJson(Map<String, dynamic> json) =>
      _$ChallengeQuizFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeQuizToJson(this);
}
