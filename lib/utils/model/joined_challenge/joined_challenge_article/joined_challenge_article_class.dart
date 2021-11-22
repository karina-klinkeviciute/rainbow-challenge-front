import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'joined_challenge_article_class.g.dart';

// explicitToJson lets using nested class JoinedChallenge
@JsonSerializable(explicitToJson: true)
class JoinedChallengeArticle {
  JoinedChallengeArticle(
      {required this.uuid,
      required this.mainJoinedChallenge,
      this.article_name,
      this.article_url});

  String uuid;
  String? article_name;
  String? article_url;
  JoinedChallenge mainJoinedChallenge;

  factory JoinedChallengeArticle.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeArticleFromJson(json);
  Map<String, dynamic> toJson() => _$JoinedChallengeArticleToJson(this);
}
