import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';

import '../challenge_quiz_model/challenge_quiz_question_model.dart';
part 'challenge_quiz_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeQuiz {
  ChallengeQuiz({required this.uuid, required this.questions, required this.main_challenge});

  String? uuid;
  Challenge main_challenge;
  List<Question> questions;

  factory ChallengeQuiz.fromJson(Map<String, dynamic> json) => _$ChallengeQuizFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeQuizToJson(this);
}
