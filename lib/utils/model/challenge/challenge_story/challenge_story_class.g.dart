// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_story_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeStory _$ChallengeStoryFromJson(Map<String, dynamic> json) =>
    ChallengeStory(
      uuid: json['uuid'] as String,
      main_challenge:
          Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeStoryToJson(ChallengeStory instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
    };
