import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'joined_challenge_event_participant_class.g.dart';

// explicitToJson lets using nested class JoinedChallenge
@JsonSerializable(explicitToJson: true)
class JoinedChallengeEventParticipant {
  JoinedChallengeEventParticipant(
      {required this.uuid, required this.mainJoinedChallenge, this.qr_code});

  String uuid;
  JoinedChallenge mainJoinedChallenge;
  String? qr_code;

  factory JoinedChallengeEventParticipant.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeEventParticipantFromJson(json);
  Map<String, dynamic> toJson() =>
      _$JoinedChallengeEventParticipantToJson(this);
}
