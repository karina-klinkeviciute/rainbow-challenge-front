import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_support_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeSupport {
  ChallengeSupport(
      {required this.uuid, this.description, required this.main_challenge});

  String uuid;
  String? description;
  Challenge main_challenge;

  factory ChallengeSupport.fromJson(Map<String, dynamic> json) =>
      _$ChallengeSupportFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeSupportToJson(this);
}
