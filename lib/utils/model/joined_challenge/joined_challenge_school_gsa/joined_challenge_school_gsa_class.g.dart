// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_school_gsa_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeSchoolGsa _$JoinedChallengeSchoolGsaFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeSchoolGsa(
      uuid: json['uuid'] as String,
      main_joinedChallenge: JoinedChallenge.fromJson(
          json['main_joinedChallenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JoinedChallengeSchoolGsaToJson(
        JoinedChallengeSchoolGsa instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_joinedChallenge': instance.main_joinedChallenge.toJson(),
    };
