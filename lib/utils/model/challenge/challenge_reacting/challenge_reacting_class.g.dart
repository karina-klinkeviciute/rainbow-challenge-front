// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_reacting_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeReacting _$ChallengeReactingFromJson(Map<String, dynamic> json) =>
    ChallengeReacting(
      uuid: json['uuid'] as String,
      mainChallenge:
          Challenge.fromJson(json['mainChallenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeReactingToJson(ChallengeReacting instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'mainChallenge': instance.mainChallenge.toJson(),
    };
