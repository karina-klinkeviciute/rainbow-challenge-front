// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      email: json['email'] as String,
      username: json['username'] as String?,
      all_points: json['all_points'] as int? ?? 0,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'all_points': instance.all_points,
    };
