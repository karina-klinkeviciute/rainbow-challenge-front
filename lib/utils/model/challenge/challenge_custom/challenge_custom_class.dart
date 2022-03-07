import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_custom_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeCustom {
  ChallengeCustom(
      {required this.uuid,
      required this.main_challenge,
      required this.description});

  String uuid;
  Challenge main_challenge;
  String? description;

  factory ChallengeCustom.fromJson(Map<String, dynamic> json) =>
      _$ChallengeCustomFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeCustomToJson(this);
}
