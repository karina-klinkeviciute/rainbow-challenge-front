import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_event_organizer_class.g.dart';

// explicitToJson lets using nested class Challenge
// This class consists only of main_challenge in backend
@JsonSerializable(explicitToJson: true)
class ChallengeEventOrganizer {
  ChallengeEventOrganizer({required this.uuid, required this.main_challenge});

  String uuid;
  Challenge main_challenge;

  factory ChallengeEventOrganizer.fromJson(Map<String, dynamic> json) =>
      _$ChallengeEventOrganizerFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeEventOrganizerToJson(this);
}
