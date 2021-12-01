import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'joined_challenge_reacting_class.g.dart';

// explicitToJson lets using nested class Challenge
// No UUID on backend
@JsonSerializable(explicitToJson: true)
class JoinedChallengeReacting {
  JoinedChallengeReacting(
      {required this.uuid,
      required this.main_joinedChallenge,
      this.reaction_description});

  String uuid;
  JoinedChallenge main_joinedChallenge;
  String? reaction_description;

  factory JoinedChallengeReacting.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeReactingFromJson(json);
  Map<String, dynamic> toJson() => _$JoinedChallengeReactingToJson(this);
}
