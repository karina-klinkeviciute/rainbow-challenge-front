// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      title: json['title'] as String,
      body: json['body'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'image': instance.image,
      'created_at': instance.created_at.toIso8601String(),
    };
