// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_project_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeProject _$ChallengeProjectFromJson(Map<String, dynamic> json) =>
    ChallengeProject(
      uuid: json['uuid'] as String,
      main_challenge:
          Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeProjectToJson(ChallengeProject instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
    };
