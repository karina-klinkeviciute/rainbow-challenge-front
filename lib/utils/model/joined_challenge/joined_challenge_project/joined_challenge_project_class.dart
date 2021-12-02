import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'joined_challenge_project_class.g.dart';

// explicitToJson lets using nested class JoinedChallenge
@JsonSerializable(explicitToJson: true)
class JoinedChallengeProject {
  JoinedChallengeProject(
      {required this.uuid,
      required this.main_joined_challenge,
      this.project_description,
      this.project_name,
      this.project_url,
      this.implemented_alone});

  String uuid;
  JoinedChallenge main_joined_challenge;
  String? project_description;
  String? project_url;
  String? project_name;
  bool? implemented_alone;

  factory JoinedChallengeProject.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeProjectFromJson(json);
  Map<String, dynamic> toJson() => _$JoinedChallengeProjectToJson(this);
}
