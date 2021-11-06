// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
      uuid: json['uuid'] as String,
      concreteChallengeUuid: json['concreteChallengeUuid'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String?,
      points: json['points'] as int,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      multiple: json['multiple'] as bool,
      needsConfirmation: json['needsConfirmation'] as bool,
      region: json['region'] as String?,
    );

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'concreteChallengeUuid': instance.concreteChallengeUuid,
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'points': instance.points,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'multiple': instance.multiple,
      'needsConfirmation': instance.needsConfirmation,
      'region': instance.region,
    };
