// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_custom_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeCustom _$JoinedChallengeCustomFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeCustom(
      uuid: json['uuid'] as String,
      description: json['description'] as String,
      mainJoinedChallenge: JoinedChallenge.fromJson(
          json['mainJoinedChallenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JoinedChallengeCustomToJson(
        JoinedChallengeCustom instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'description': instance.description,
      'mainJoinedChallenge': instance.mainJoinedChallenge.toJson(),
    };
