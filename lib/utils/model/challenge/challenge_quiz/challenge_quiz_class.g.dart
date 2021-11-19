// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_quiz_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeQuiz _$ChallengeQuizFromJson(Map<String, dynamic> json) =>
    ChallengeQuiz(
      uuid: json['uuid'] as String,
      quiz: json['quiz'] as String,
      mainChallenge:
          Challenge.fromJson(json['mainChallenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeQuizToJson(ChallengeQuiz instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'mainChallenge': instance.mainChallenge.toJson(),
      'quiz': instance.quiz,
    };
