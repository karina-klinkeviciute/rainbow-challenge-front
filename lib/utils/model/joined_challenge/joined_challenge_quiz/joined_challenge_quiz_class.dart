import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'joined_challenge_quiz_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class JoinedChallengeQuiz {
  JoinedChallengeQuiz({
    required this.uuid,
    required this.main_joined_challenge,
    this.quiz_user,
  });

  String uuid;
  JoinedChallenge main_joined_challenge;
  String? quiz_user;

  factory JoinedChallengeQuiz.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeQuizFromJson(json);
  Map<String, dynamic> toJson() => _$JoinedChallengeQuizToJson(this);
}
