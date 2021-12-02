// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_event_participant_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeEventParticipant _$ChallengeEventParticipantFromJson(
        Map<String, dynamic> json) =>
    ChallengeEventParticipant(
      uuid: json['uuid'] as String,
      event_name: json['event_name'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      url: json['url'] as String?,
      main_challenge:
          Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeEventParticipantToJson(
        ChallengeEventParticipant instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'event_name': instance.event_name,
      'date': instance.date?.toIso8601String(),
      'url': instance.url,
      'main_challenge': instance.main_challenge.toJson(),
    };
