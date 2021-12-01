// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_reacting_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeReacting _$JoinedChallengeReactingFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeReacting(
      uuid: json['uuid'] as String,
      main_joinedChallenge: JoinedChallenge.fromJson(
          json['main_joinedChallenge'] as Map<String, dynamic>),
      reaction_description: json['reaction_description'] as String?,
    );

Map<String, dynamic> _$JoinedChallengeReactingToJson(
        JoinedChallengeReacting instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_joinedChallenge': instance.main_joinedChallenge.toJson(),
      'reaction_description': instance.reaction_description,
    };
