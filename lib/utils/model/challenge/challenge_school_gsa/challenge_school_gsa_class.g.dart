// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_school_gsa_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeSchoolGsa _$ChallengeSchoolGsaFromJson(Map<String, dynamic> json) =>
    ChallengeSchoolGsa(
        uuid: json['uuid'] as String,
        main_challenge: json['main_challenge'] != null
            ? Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>)
            : Challenge.empty(),
        description: json['description']);

Map<String, dynamic> _$ChallengeSchoolGsaToJson(ChallengeSchoolGsa instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
    };
