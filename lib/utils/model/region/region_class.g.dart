// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel(
      name: json['name'] as String? ?? "Lietuva",
      points: json['points'] as int? ?? 0,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'points': instance.points,
    };
