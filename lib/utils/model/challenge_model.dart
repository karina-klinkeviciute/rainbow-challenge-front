import 'dart:convert';

Challenge challengeFromJson(String str) => Challenge.fromJson(json.decode(str));

String challengeToJson(Challenge data) => json.encode(data.toJson());

class Challenge {
  Challenge({
    required this.uuid,
    required this.concreteChallengeUuid,
    required this.type,
    required this.name,
    required this.description,
    this.image,
    this.published,
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
  bool? published;
  int points;
  DateTime? startDate;
  DateTime? endDate;
  bool multiple;
  bool needsConfirmation;
  String? region;

  factory Challenge.fromJson(Map<String, dynamic> json) => Challenge(
        uuid: json["uuid"],
        concreteChallengeUuid: json["concrete_challenge_uuid"],
        type: json["type"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        published: json["published"],
        points: json["points"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        multiple: json["multiple"],
        needsConfirmation: json["needs_confirmation"],
        region: json["region"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "concrete_challenge_uuid": concreteChallengeUuid,
        "type": type,
        "name": name,
        "description": description,
        "image": image,
        "published": published,
        "points": points,
        if (startDate != null)
          "start_date":
              "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        if (endDate != null)
          "end_date":
              "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "multiple": multiple,
        "needs_confirmation": needsConfirmation,
        "region": region,
      };
}
