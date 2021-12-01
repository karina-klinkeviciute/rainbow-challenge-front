// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_event_participant_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeEventParticipant _$JoinedChallengeEventParticipantFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeEventParticipant(
      uuid: json['uuid'] as String,
      main_joinedChallenge: JoinedChallenge.fromJson(
          json['main_joinedChallenge'] as Map<String, dynamic>),
      qr_code: json['qr_code'] as String? ?? "",
    );

Map<String, dynamic> _$JoinedChallengeEventParticipantToJson(
        JoinedChallengeEventParticipant instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_joinedChallenge': instance.main_joinedChallenge.toJson(),
      'qr_code': instance.qr_code,
    };
