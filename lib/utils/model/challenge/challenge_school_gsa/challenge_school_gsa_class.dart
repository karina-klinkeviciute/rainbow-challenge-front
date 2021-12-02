import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'challenge_school_gsa_class.g.dart';

// explicitToJson lets using nested class Challenge
@JsonSerializable(explicitToJson: true)
class ChallengeSchoolGsa {
  ChallengeSchoolGsa({required this.uuid, required this.main_challenge});

  String uuid;
  Challenge main_challenge;

  factory ChallengeSchoolGsa.fromJson(Map<String, dynamic> json) =>
      _$ChallengeSchoolGsaFromJson(json);
  Map<String, dynamic> toJson() => _$ChallengeSchoolGsaToJson(this);
}
