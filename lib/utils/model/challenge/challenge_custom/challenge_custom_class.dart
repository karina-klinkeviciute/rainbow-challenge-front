import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_custom_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeCustom {
  ChallengeCustom({required this.uuid, required this.mainChallenge});

  String uuid;
  Challenge mainChallenge;

  factory ChallengeCustom.fromJson(Map<String, dynamic> json) =>
      _$ChallengeCustomFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeCustomToJson(this);
}
