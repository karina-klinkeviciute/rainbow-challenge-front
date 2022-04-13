// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_event_organizer_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeEventOrganizer _$ChallengeEventOrganizerFromJson(
        Map<String, dynamic> json) =>
    ChallengeEventOrganizer(
      uuid: json['uuid'] as String,
      main_challenge:
          Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>),
      description: json['description'] as String?,
      event_name: json['event_name'] as String?,
      event_url: json['event_url'] as String?,
      organized_alone: json['organized_alone'] as bool?,
    );

Map<String, dynamic> _$ChallengeEventOrganizerToJson(
        ChallengeEventOrganizer instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
      'description': instance.description,
      'event_url': instance.event_url,
      'event_name': instance.event_name,
      'organized_alone': instance.organized_alone,
    };
