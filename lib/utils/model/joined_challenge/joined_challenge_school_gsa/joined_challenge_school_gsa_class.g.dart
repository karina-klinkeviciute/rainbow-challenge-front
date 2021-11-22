// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_school_gsa_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeSchoolGsa _$JoinedChallengeSchoolGsaFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeSchoolGsa(
      uuid: json['uuid'] as String,
      mainJoinedChallenge: JoinedChallenge.fromJson(
          json['mainJoinedChallenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JoinedChallengeSchoolGsaToJson(
        JoinedChallengeSchoolGsa instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'mainJoinedChallenge': instance.mainJoinedChallenge.toJson(),
    };
