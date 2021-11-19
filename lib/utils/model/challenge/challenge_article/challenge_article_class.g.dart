// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_article_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeArticle _$ChallengeArticleFromJson(Map<String, dynamic> json) =>
    ChallengeArticle(
      uuid: json['uuid'] as String,
      mainChallenge:
          Challenge.fromJson(json['mainChallenge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeArticleToJson(ChallengeArticle instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'mainChallenge': instance.mainChallenge.toJson(),
    };
