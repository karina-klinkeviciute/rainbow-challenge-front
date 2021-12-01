// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_support_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeSupport _$ChallengeSupportFromJson(Map<String, dynamic> json) =>
    ChallengeSupport(
      uuid: json['uuid'] as String,
      organization: json['organization'] as String?,
      main_challenge:
          Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeSupportToJson(ChallengeSupport instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'organization': instance.organization,
      'main_challenge': instance.main_challenge.toJson(),
    };
