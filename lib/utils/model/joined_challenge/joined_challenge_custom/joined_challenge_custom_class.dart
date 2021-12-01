import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'joined_challenge_custom_class.g.dart';

// explicitToJson lets using nested class JoinedChallenge
@JsonSerializable(explicitToJson: true)
class JoinedChallengeCustom {
  JoinedChallengeCustom(
      {required this.uuid,
      this.description,
      required this.main_joinedChallenge});

  String uuid;
  String? description;
  JoinedChallenge main_joinedChallenge;

  factory JoinedChallengeCustom.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeCustomFromJson(json);
  Map<String, dynamic> toJson() => _$JoinedChallengeCustomToJson(this);
}
