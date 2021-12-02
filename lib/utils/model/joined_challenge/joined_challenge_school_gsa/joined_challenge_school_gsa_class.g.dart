// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_school_gsa_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeSchoolGsa _$JoinedChallengeSchoolGsaFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeSchoolGsa(
      uuid: json['uuid'] as String,
      main_joined_challenge: JoinedChallenge.fromJson(
          json['main_joined_challenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JoinedChallengeSchoolGsaToJson(
        JoinedChallengeSchoolGsa instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_joined_challenge': instance.main_joined_challenge.toJson(),
    };
