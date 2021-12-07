// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      username: json['username'] as String?,
      all_points: json['all_points'] as int? ?? 0,
      remaining_points: json['remaining_points'] as String?,
      streak: json['streak'] as String?,
      medals: json['medals'],
    )..region = json['region'] as String?;

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'username': instance.username,
      'region': instance.region,
      'all_points': instance.all_points,
      'remaining_points': instance.remaining_points,
      'streak': instance.streak,
      'medals': instance.medals,
    };
