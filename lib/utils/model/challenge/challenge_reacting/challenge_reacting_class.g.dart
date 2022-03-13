// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_reacting_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeReacting _$ChallengeReactingFromJson(Map<String, dynamic> json) =>
    ChallengeReacting(
        uuid: json['uuid'] as String,
        main_challenge: json['main_challenge'] != null
            ? Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>)
            : Challenge.empty(),
        description: json['description']);

Map<String, dynamic> _$ChallengeReactingToJson(ChallengeReacting instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
      'description': instance.description
    };
