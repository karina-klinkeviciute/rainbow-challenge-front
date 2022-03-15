import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_story_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeStory {
  ChallengeStory(
      {required this.uuid,
      required this.main_challenge,
      required this.description,
      required this.story_url});

  String uuid;
  Challenge main_challenge;

  String? description;
  String? story_url;

  factory ChallengeStory.fromJson(Map<String, dynamic> json) =>
      _$ChallengeStoryFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeStoryToJson(this);
}
