import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'joined_challenge_custom_class.g.dart';

// explicitToJson lets using nested class JoinedChallenge
@JsonSerializable(explicitToJson: true)
class JoinedChallengeCustom {
  JoinedChallengeCustom(
      {required this.uuid,
      required this.description,
      required this.mainJoinedChallenge});

  String uuid;
  String description;
  JoinedChallenge mainJoinedChallenge;

  factory JoinedChallengeCustom.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeCustomFromJson(json);
  Map<String, dynamic> toJson() => _$JoinedChallengeCustomToJson(this);
}
