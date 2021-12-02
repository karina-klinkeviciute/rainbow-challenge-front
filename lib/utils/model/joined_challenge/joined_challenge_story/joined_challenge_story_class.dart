import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'joined_challenge_story_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class JoinedChallengeStory {
  JoinedChallengeStory(
      {required this.uuid, required this.main_joined_challenge});

  String uuid;
  JoinedChallenge main_joined_challenge;

  factory JoinedChallengeStory.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeStoryFromJson(json);
  Map<String, dynamic> toJson() => _$JoinedChallengeStoryToJson(this);
}
