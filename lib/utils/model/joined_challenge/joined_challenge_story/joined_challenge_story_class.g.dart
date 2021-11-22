// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_story_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeStory _$JoinedChallengeStoryFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeStory(
      uuid: json['uuid'] as String,
      mainJoinedChallenge: JoinedChallenge.fromJson(
          json['mainJoinedChallenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JoinedChallengeStoryToJson(
        JoinedChallengeStory instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'mainJoinedChallenge': instance.mainJoinedChallenge.toJson(),
    };
