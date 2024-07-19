// To parse this JSON data, do
//
//     final joinedChallenges = joinedChallengesFromJson(jsonString);

import 'dart:convert';

import 'package:rainbow_challenge/utils/model/models.dart';

List<JoinedChallenges> joinedChallengesFromJson(String str) =>
    List<JoinedChallenges>.from(
        json.decode(str).map((x) => JoinedChallenges.fromJson(x)));

String joinedChallengesToJson(List<JoinedChallenges> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JoinedChallenges {
  JoinedChallenges({
    required this.uuid,
    required this.status,
    required this.challenge,
    required this.challengeData,
    required this.concreteJoinedChallenge,
    required this.challengeType,
    required this.joinedAt,
    required this.files,
  });

  final String uuid;
  final String status;
  final String challenge;
  final Challenge challengeData;
  final String concreteJoinedChallenge;
  final String challengeType;
  final DateTime joinedAt;
  final List<FileElement> files;

  factory JoinedChallenges.fromJson(Map<String, dynamic> json) =>
      JoinedChallenges(
        uuid: json["uuid"],
        status: json["status"],
        challenge: json["challenge"],
        challengeData: Challenge.fromJson(json["challenge_data"]),
        concreteJoinedChallenge: json["concrete_joined_challenge"],
        challengeType: json["challenge_type"],
        joinedAt: DateTime.parse(json["joined_at"]),
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "status": status,
        "challenge": challenge,
        "challenge_data": challengeData.toJson(),
        "concrete_joined_challenge": concreteJoinedChallenge,
        "challenge_type": challengeType,
        "joined_at": joinedAt.toIso8601String(),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
      };
}

class ConcreteJoinedChallenge {
  String uuid;
  String date_joined;

  ConcreteJoinedChallenge({required this.uuid, required this.date_joined});

  factory ConcreteJoinedChallenge.fromJson(Map<String, dynamic> json) =>
      ConcreteJoinedChallenge(
          uuid: json["uuid"] as String, date_joined: json["date_joined"]);
}

class FileElement {
  FileElement({
    required this.uuid,
    required this.joinedChallenge,
    required this.file,
    required this.fileName,
  });

  final String uuid;
  final String joinedChallenge;
  final String file;
  final String fileName;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        uuid: json["uuid"],
        joinedChallenge: json["joined_challenge"],
        file: json["file"],
        fileName: json["file_name"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "joined_challenge": joinedChallenge,
        "file": file,
        "file_name": fileName,
      };
}
