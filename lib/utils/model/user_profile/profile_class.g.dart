// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      email: json['email'] as String,
      username: json['username'] as String?,
      region: json['region'] == null
          ? null
          : RegionModel.fromJson(json['region'] as Map<String, dynamic>),
      all_points: json['all_points'] as int? ?? 0,
      remaining_points: json['remaining_points'] as int,
      streak: json['streak'] == null
          ? null
          : Streak.fromJson(json['streak'] as Map<String, dynamic>),
      medals: (json['medals'] as List<dynamic>)
          .map((e) => Medal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'region': instance.region,
      'all_points': instance.all_points,
      'remaining_points': instance.remaining_points,
      'streak': instance.streak,
      'medals': instance.medals,
    };
