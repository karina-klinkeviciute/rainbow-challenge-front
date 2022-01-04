// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
    uuid: json['uuid'] as String,
    concrete_challenge_uuid: json['concrete_challenge_uuid'] as String,
    type: json['type'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    image: json['image'] as String?,
    points: json['points'] as int,
    start_date: json['start_date'] == null
        ? null
        : DateTime.parse(json['start_date'] as String),
    end_date: json['end_date'] == null
        ? null
        : DateTime.parse(json['end_date'] as String),
    multiple: json['multiple'] as bool,
    needs_confirmation: json['needs_confirmation'] as bool,
    region: json['region'] as String?,
    can_be_joined: json['can_be_joined'] as bool,
    is_joined: json['is_joined'] as bool,
    concrete_joined_challenges: List<ConcreteJoinedChallenge>.from(
        json["concrete_joined_challenges"]
            .map((x) => ConcreteJoinedChallenge.fromJson(x))));

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'concrete_challenge_uuid': instance.concrete_challenge_uuid,
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'points': instance.points,
      'start_date': instance.start_date?.toIso8601String(),
      'end_date': instance.end_date?.toIso8601String(),
      'multiple': instance.multiple,
      'needs_confirmation': instance.needs_confirmation,
      'region': instance.region,
      'can_be_joined': instance.can_be_joined,
      'is_joined': instance.is_joined
    };
