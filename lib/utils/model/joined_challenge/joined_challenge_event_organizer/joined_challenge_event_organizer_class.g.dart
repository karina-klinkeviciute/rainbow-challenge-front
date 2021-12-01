// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_event_organizer_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeEventOrganizer _$JoinedChallengeEventOrganizerFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeEventOrganizer(
      uuid: json['uuid'] as String,
      main_joinedChallenge: JoinedChallenge.fromJson(
          json['main_joinedChallenge'] as Map<String, dynamic>),
      event_description: json['event_description'] as String?,
      event_name: json['event_name'] as String?,
      event_url: json['event_url'] as String?,
      organized_alone: json['organized_alone'] as bool?,
    );

Map<String, dynamic> _$JoinedChallengeEventOrganizerToJson(
        JoinedChallengeEventOrganizer instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_joinedChallenge': instance.main_joinedChallenge.toJson(),
      'event_name': instance.event_name,
      'event_url': instance.event_url,
      'event_description': instance.event_description,
      'organized_alone': instance.organized_alone,
    };
