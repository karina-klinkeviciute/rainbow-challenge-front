// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_challenge_article_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinedChallengeArticle _$JoinedChallengeArticleFromJson(
        Map<String, dynamic> json) =>
    JoinedChallengeArticle(
      uuid: json['uuid'] as String,
      main_joined_challenge: JoinedChallenge.fromJson(
          json['main_joined_challenge'] as Map<String, dynamic>),
      article_name: json['article_name'] as String?,
      article_url: json['article_url'] as String?,
    );

Map<String, dynamic> _$JoinedChallengeArticleToJson(
        JoinedChallengeArticle instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'article_name': instance.article_name,
      'article_url': instance.article_url,
      'main_joined_challenge': instance.main_joined_challenge.toJson(),
    };
