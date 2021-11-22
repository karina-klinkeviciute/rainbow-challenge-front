import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'joined_challenge_event_organizer_class.g.dart';

// explicitToJson lets using nested class JoinedChallenge

@JsonSerializable(explicitToJson: true)
class JoinedChallengeEventOrganizer {
  JoinedChallengeEventOrganizer(
      {required this.uuid,
      required this.mainJoinedChallenge,
      required this.event_description,
      this.event_name,
      this.event_url,
      this.organized_alone});

  String uuid;
  JoinedChallenge mainJoinedChallenge;
  String? event_name;
  String? event_url;
  String event_description;
  bool? organized_alone;

  factory JoinedChallengeEventOrganizer.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeEventOrganizerFromJson(json);
  Map<String, dynamic> toJson() => _$JoinedChallengeEventOrganizerToJson(this);
}
