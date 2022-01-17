// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_article_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeArticle _$ChallengeArticleFromJson(Map<String, dynamic> json) =>
    ChallengeArticle(
        uuid: json['uuid'] as String,
        main_challenge: json['main_challenge'] != null
            ? Challenge.fromJson(json['main_challenge'] as Map<String, dynamic>)
            : Challenge.empty(),
        description: json['description'],
        article_url: json['article_url'],
        article_name: json['article_name']);

Map<String, dynamic> _$ChallengeArticleToJson(ChallengeArticle instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'main_challenge': instance.main_challenge.toJson(),
      "description": instance.description,
      "article_url": instance.article_url,
      "article_name": instance.article_name,
    };
