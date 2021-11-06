import 'package:json_annotation/json_annotation.dart';
part 'challenge_class.g.dart';

@JsonSerializable()
class Challenge {
  Challenge({
    required this.uuid,
    required this.concreteChallengeUuid,
    required this.type,
    required this.name,
    required this.description,
    this.image,
//    this.published,
    // Points = Vaivorykštės
    required this.points,
    this.startDate,
    this.endDate,
    required this.multiple,
    required this.needsConfirmation,
    this.region,
  });

  String uuid;
  String concreteChallengeUuid;
  String type;
  String name;
  String description;
  String? image;
//  bool? published;
  int points;
  DateTime? startDate;
  DateTime? endDate;
  bool multiple;
  bool needsConfirmation;
  String? region;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}
