import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_project_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeProject {
  ChallengeProject({required this.uuid, required this.main_challenge});

  String uuid;
  Challenge main_challenge;

  factory ChallengeProject.fromJson(Map<String, dynamic> json) =>
      _$ChallengeProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeProjectToJson(this);
}
