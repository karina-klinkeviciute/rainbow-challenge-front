// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_school_gsa_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeSchoolGsa _$ChallengeSchoolGsaFromJson(Map<String, dynamic> json) =>
    ChallengeSchoolGsa(
      uuid: json['uuid'] as String,
      mainChallenge:
          Challenge.fromJson(json['mainChallenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeSchoolGsaToJson(ChallengeSchoolGsa instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'mainChallenge': instance.mainChallenge.toJson(),
    };
