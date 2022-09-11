// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_model_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextModel _$TextModelFromJson(Map<String, dynamic> json) => TextModel(
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      notes: json['notes'] as String? ?? '',
      created_at: json['created_at'] as String? ?? '',
      updated_at: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$TextModelToJson(TextModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'body': instance.body,
      'notes': instance.notes,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
