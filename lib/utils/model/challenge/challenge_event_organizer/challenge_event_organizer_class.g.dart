// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_event_organizer_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeEventOrganizer _$ChallengeEventOrganizerFromJson(
        Map<String, dynamic> json) =>
    ChallengeEventOrganizer(
      uuid: json['uuid'] as String,
      mainChallenge:
          Challenge.fromJson(json['mainChallenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeEventOrganizerToJson(
        ChallengeEventOrganizer instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'mainChallenge': instance.mainChallenge.toJson(),
    };
