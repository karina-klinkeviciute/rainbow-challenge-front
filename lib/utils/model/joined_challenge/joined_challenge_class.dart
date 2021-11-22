import 'package:json_annotation/json_annotation.dart';
part 'joined_challenge_class.g.dart';

@JsonSerializable()
class JoinedChallenge {
  String uuid;
  String? status;
  String challenge;

  JoinedChallenge({required this.uuid, this.status, required this.challenge});

  factory JoinedChallenge.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeFromJson(json);
  Map<String, dynamic> toJson() => _$JoinedChallengeToJson(this);
}
