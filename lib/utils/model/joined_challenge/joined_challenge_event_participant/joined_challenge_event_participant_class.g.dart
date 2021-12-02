// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_event_participant_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeEventParticipant _$JoinedChallengeEventParticipantFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeEventParticipant(
      uuid: json['uuid'] as String,
      main_joined_challenge: JoinedChallenge.fromJson(
          json['main_joined_challenge'] as Map<String, dynamic>),
      qr_code: json['qr_code'] as String? ?? "",
    );

Map<String, dynamic> _$JoinedChallengeEventParticipantToJson(
        JoinedChallengeEventParticipant instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_joined_challenge': instance.main_joined_challenge.toJson(),
      'qr_code': instance.qr_code,
    };
