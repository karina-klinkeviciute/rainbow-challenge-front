// To parse this JSON data, do
//
//     final regUser = regUserFromJson(jsonString);

import 'dart:convert';

class RegUser {
  RegUser({
    // this.uid,
    // this.email,
    required this.gender,
    required this.genderOther,
    required this.username,
    this.region,
    required this.yearOfBirth,
    // this.allPoints,
    // this.remainingPoints,
    // this.streak,
    // this.medals,
  });

  String gender;
  String genderOther;
  String username;
  Region? region;
  int yearOfBirth;

  factory RegUser.fromJson(Map<String, dynamic> json) => RegUser(
        gender: json["gender"] ?? '',
        genderOther: json["gender_other"] ?? '',
        username: json["username"] ?? '',
        region: Region.fromJson(json["region"] ??
            {
              "name": 'name',
              "uuid": 'uuid',
              "points": 'points',
            }),
        yearOfBirth: json["year_of_birth"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "gender_other": genderOther,
        "username": username,
        "region": region?.toJson(),
        "year_of_birth": yearOfBirth,
      };
}

class Region {
  Region({
    required this.name,
    required this.uuid,
    required this.points,
  });

  String name;
  String uuid;
  int points;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        name: json["name"] ?? '',
        uuid: json["uuid"] ?? '',
        points: json["points"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "uuid": uuid,
        "points": points,
      };
}
