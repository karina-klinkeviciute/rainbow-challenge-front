import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_quiz_model/challenge_quiz_answer_model.dart';
part 'challenge_quiz_question_model.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class Question {
  Question({required this.uuid, required this.question, this.answers, required this.is_answered});

  String uuid;
  String question;
  List<Answer>? answers;
  bool is_answered;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
