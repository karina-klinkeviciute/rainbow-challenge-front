// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_quiz_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeQuiz _$ChallengeQuizFromJson(Map<String, dynamic> json) =>
    ChallengeQuiz(
      questions: List<Question>.from(
          json["questions"].map((x) => Question.fromJson(x))).toList(),
      main_challenge:
          Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeQuizToJson(ChallengeQuiz instance) =>
    <String, dynamic>{
      // 'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
      // 'quiz': instance.quiz,
      'questions':
          List<dynamic>.from(instance.questions.map((x) => x.toJson())),
    };
