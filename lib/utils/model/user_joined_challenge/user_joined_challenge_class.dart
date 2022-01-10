import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'user_joined_challenge_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class UserJoinedChallenge {
  UserJoinedChallenge(
      {required this.uuid,
      required this.challenge,
      required this.challenge_data});

  String uuid;
  String challenge;
  Challenge challenge_data;

  factory UserJoinedChallenge.fromJson(Map<String, dynamic> json) =>
      _$UserJoinedChallengeFromJson(json);
  Map<String, dynamic> toJson() => _$UserJoinedChallengeToJson(this);
}
