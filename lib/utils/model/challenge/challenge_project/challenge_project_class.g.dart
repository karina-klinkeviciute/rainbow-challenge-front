// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_project_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeProject _$ChallengeProjectFromJson(Map<String, dynamic> json) =>
    ChallengeProject(
        uuid: json['uuid'] as String,
        main_challenge: json['main_challenge'] != null
            ? Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>)
            : Challenge.empty(),
        description: json['description'],
        project_name: json['project_name'],
        project_url: json['project_url'],
        implemented_alone: json['implemented_alone']);

Map<String, dynamic> _$ChallengeProjectToJson(ChallengeProject instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
      'description': instance.description,
      'project_name': instance.project_name,
      'project_url': instance.project_url,
      'implemented_alone': instance.implemented_alone
    };
