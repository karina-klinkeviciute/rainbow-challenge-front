// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_custom_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeCustom _$ChallengeCustomFromJson(Map<String, dynamic> json) =>
    ChallengeCustom(
      uuid: json['uuid'] as String,
      main_challenge:
          Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeCustomToJson(ChallengeCustom instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
    };
