// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_quiz_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeQuiz _$JoinedChallengeQuizFromJson(Map<String, dynamic> json) =>
    JoinedChallengeQuiz(
      uuid: json['uuid'] as String,
      mainChallenge:
          Challenge.fromJson(json['mainChallenge'] as Map<String, dynamic>),
      quiz_user: json['quiz_user'] as String?,
    );

Map<String, dynamic> _$JoinedChallengeQuizToJson(
        JoinedChallengeQuiz instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'mainChallenge': instance.mainChallenge.toJson(),
      'quiz_user': instance.quiz_user,
    };
