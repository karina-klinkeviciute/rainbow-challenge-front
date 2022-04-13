// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_quiz_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeQuiz _$ChallengeQuizFromJson(Map<String, dynamic> json) =>
    ChallengeQuiz(
      uuid: json['uuid'] as String?,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      main_challenge:
          Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeQuizToJson(ChallengeQuiz instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };
