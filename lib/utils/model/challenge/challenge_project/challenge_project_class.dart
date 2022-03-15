import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_project_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeProject {
  ChallengeProject(
      {required this.uuid,
      required this.main_challenge,
      required this.description,
      required this.implemented_alone,
      required this.project_name,
      required this.project_url});

  String uuid;
  Challenge main_challenge;
  String? description;
  String? project_name;
  String? project_url;
  bool? implemented_alone;

  factory ChallengeProject.fromJson(Map<String, dynamic> json) =>
      _$ChallengeProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeProjectToJson(this);
}
