// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      name: json['name'] as String? ?? "Lietuva",
      points: json['points'] as int? ?? 0,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'points': instance.points,
    };
