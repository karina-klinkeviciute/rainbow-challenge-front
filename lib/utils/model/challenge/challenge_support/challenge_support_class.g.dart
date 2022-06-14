// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_support_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeSupport _$ChallengeSupportFromJson(Map<String, dynamic> json) =>
    ChallengeSupport(
      uuid: json['uuid'] as String,
      description: json['description'] as String?,
      main_challenge:
          Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeSupportToJson(ChallengeSupport instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'description': instance.description,
      'main_challenge': instance.main_challenge.toJson(),
    };
