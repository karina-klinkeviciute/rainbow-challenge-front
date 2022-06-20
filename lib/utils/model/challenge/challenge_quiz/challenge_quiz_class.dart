import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/model/quiz/quiz_options.dart';
part 'challenge_quiz_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeQuiz {
  ChallengeQuiz({required this.questions, required this.main_challenge});

  Challenge main_challenge;

  List<Question> questions;

  factory ChallengeQuiz.fromJson(Map<String, dynamic> json) =>
      _$ChallengeQuizFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeQuizToJson(this);
}
