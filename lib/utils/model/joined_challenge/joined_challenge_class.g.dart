// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallenge _$JoinedChallengeFromJson(Map<String, dynamic> json) =>
    JoinedChallenge(
      uuid: json['uuid'] as String,
      status: json['status'] as String? ?? 'joined',
      challenge: json['challenge'] as String,
    );

Map<String, dynamic> _$JoinedChallengeToJson(JoinedChallenge instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'status': instance.status,
      'challenge': instance.challenge,
    };
