// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_reacting_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeReacting _$JoinedChallengeReactingFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeReacting(
      uuid: json['uuid'] as String,
      main_joined_challenge: JoinedChallenge.fromJson(
          json['main_joined_challenge'] as Map<String, dynamic>),
      reaction_description: json['reaction_description'] as String?,
    );

Map<String, dynamic> _$JoinedChallengeReactingToJson(
        JoinedChallengeReacting instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_joined_challenge': instance.main_joined_challenge.toJson(),
      'reaction_description': instance.reaction_description,
    };
