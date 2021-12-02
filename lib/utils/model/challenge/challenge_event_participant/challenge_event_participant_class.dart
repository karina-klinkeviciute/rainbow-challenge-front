import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_event_participant_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeEventParticipant {
  ChallengeEventParticipant(
      {required this.uuid,
      this.event_name,
      this.date,
      this.url,
      required this.main_challenge});

  String uuid;
  String? event_name;
  DateTime? date;
  String? url;
  Challenge main_challenge;

  factory ChallengeEventParticipant.fromJson(Map<String, dynamic> json) =>
      _$ChallengeEventParticipantFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeEventParticipantToJson(this);
}
