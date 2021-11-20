import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_support_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeSupport {
  ChallengeSupport(
      {required this.uuid, this.organization, required this.mainChallenge});

  String uuid;
  String? organization;
  Challenge mainChallenge;

  factory ChallengeSupport.fromJson(Map<String, dynamic> json) =>
      _$ChallengeSupportFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeSupportToJson(this);
}
