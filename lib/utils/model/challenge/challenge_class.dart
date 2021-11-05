import 'package:json_annotation/json_annotation.dart';
part 'challenge_class.g.dart';

@JsonSerializable()
class Challenge {
  Challenge({
    required this.uuid,
    required this.concrete_challenge_uuid,
    required this.type,
    required this.name,
    required this.description,
    this.image,
//    this.published,
    // Points = Vaivorykštės
    required this.points,
    this.start_date,
    this.end_date,
    required this.multiple,
    required this.needs_confirmation,
    this.region,
  });

  String uuid;
  String concrete_challenge_uuid;
  String type;
  String name;
  String description;
  String? image;
//  bool? published;
  int points;
  DateTime? start_date;
  DateTime? end_date;
  bool multiple;
  bool needs_confirmation;
  String? region;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}
