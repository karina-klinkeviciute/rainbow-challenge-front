import 'package:json_annotation/json_annotation.dart';
part 'concrete_joined_challenge_model.g.dart';

@JsonSerializable()
class ConcreteJoinedChallenge {
  String uuid;
  String date_joined;

  ConcreteJoinedChallenge({required this.uuid, required this.date_joined});

  factory ConcreteJoinedChallenge.fromJson(Map<String, dynamic> json) => _$ConcreteJoinedChallengeFromJson(json);
  Map<String, dynamic> toJson() => _$ConcreteJoinedChallengeToJson(this);

  // factory ConcreteJoinedChallenge.fromJson(Map<String, dynamic> json) =>
  //     ConcreteJoinedChallenge(uuid: json["uuid"] as String, date_joined: json["date_joined"]);
}
