import 'package:json_annotation/json_annotation.dart';
part 'challenge_class.g.dart';

@JsonSerializable()
class Challenge {
  String uuid;
  String concrete_challenge_uuid;
  String type;
  String name;
  String description;
  String? image;
  int points;
  DateTime? start_date;
  DateTime? end_date;
  bool multiple;
  bool needs_confirmation;
  String? region;
  bool can_be_joined;
  bool is_joined;
  List<ConcreteJoinedChallenge> concrete_joined_challenges;

  Challenge(
      {required this.uuid,
      required this.concrete_challenge_uuid,
      required this.type,
      required this.name,
      required this.description,
      this.image,
      required this.points,
      this.start_date,
      this.end_date,
      required this.multiple,
      required this.needs_confirmation,
      this.region,
      required this.can_be_joined,
      required this.is_joined,
      required this.concrete_joined_challenges});

  factory Challenge.empty() => Challenge(
      uuid: "",
      concrete_challenge_uuid: "",
      type: "",
      name: "",
      description: "",
      points: 0,
      multiple: false,
      needs_confirmation: false,
      can_be_joined: false,
      is_joined: false,
      concrete_joined_challenges: List<ConcreteJoinedChallenge>.empty());

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}

class ConcreteJoinedChallenge {
  String uuid;
  String date_joined;

  ConcreteJoinedChallenge({required this.uuid, required this.date_joined});

  factory ConcreteJoinedChallenge.fromJson(Map<String, dynamic> json) =>
      ConcreteJoinedChallenge(
          uuid: json["uuid"] as String, date_joined: json["date_joined"]);
}
