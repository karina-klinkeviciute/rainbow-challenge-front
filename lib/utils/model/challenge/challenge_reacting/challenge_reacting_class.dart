import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_reacting_class.g.dart';

// explicitToJson lets using nested class Challenge
// No UUID on backend
@JsonSerializable(explicitToJson: true)
class ChallengeReacting {
  ChallengeReacting({required this.uuid, required this.mainChallenge});

  String uuid;
  Challenge mainChallenge;

  factory ChallengeReacting.fromJson(Map<String, dynamic> json) =>
      _$ChallengeReactingFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeReactingToJson(this);
}
