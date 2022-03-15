// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_event_organizer_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeEventOrganizer _$ChallengeEventOrganizerFromJson(
        Map<String, dynamic> json) =>
    ChallengeEventOrganizer(
        uuid: json['uuid'] as String,
        main_challenge: json['main_challenge'] != null
            ? Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>)
            : Challenge.empty(),
        description: json['description'],
        event_name: json['event_name'],
        event_url: json['event_url'],
        organized_alone: json['organized_alone']);

Map<String, dynamic> _$ChallengeEventOrganizerToJson(
        ChallengeEventOrganizer instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
      'description': instance.description,
      'event_name': instance.event_name,
      'event_url': instance.event_url,
      'organized_alone': instance.organized_alone,
    };
