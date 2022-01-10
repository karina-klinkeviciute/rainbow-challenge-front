// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_joined_challenge_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserJoinedChallenge _$UserJoinedChallengeFromJson(Map<String, dynamic> json) =>
    UserJoinedChallenge(
      uuid: json['uuid'] as String,
      challenge: json['challenge'] as String?,
      challenge_data:
          Challenge.fromJson(json['challenge_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserJoinedChallengeToJson(
        UserJoinedChallenge instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'challenge': instance.challenge,
      'challenge_data': instance.challenge_data.toJson(),
    };
