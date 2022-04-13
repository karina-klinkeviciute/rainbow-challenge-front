// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_reacting_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeReacting _$ChallengeReactingFromJson(Map<String, dynamic> json) =>
    ChallengeReacting(
      uuid: json['uuid'] as String,
      main_challenge:
          Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ChallengeReactingToJson(ChallengeReacting instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
      'description': instance.description,
    };
