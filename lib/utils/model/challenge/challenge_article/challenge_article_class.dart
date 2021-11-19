import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_article_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeArticle {
  ChallengeArticle({required this.uuid, required this.mainChallenge});

  String uuid;
  Challenge mainChallenge;

  factory ChallengeArticle.fromJson(Map<String, dynamic> json) =>
      _$ChallengeArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeArticleToJson(this);
}
