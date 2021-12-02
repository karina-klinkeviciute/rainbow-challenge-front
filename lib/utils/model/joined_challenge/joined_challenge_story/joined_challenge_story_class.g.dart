// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_story_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeStory _$JoinedChallengeStoryFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeStory(
      uuid: json['uuid'] as String,
      main_joined_challenge: JoinedChallenge.fromJson(
          json['main_joined_challenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JoinedChallengeStoryToJson(
        JoinedChallengeStory instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_joined_challenge': instance.main_joined_challenge.toJson(),
    };
