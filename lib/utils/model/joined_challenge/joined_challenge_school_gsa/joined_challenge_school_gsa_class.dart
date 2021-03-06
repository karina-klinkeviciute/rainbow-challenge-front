import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
part 'joined_challenge_school_gsa_class.g.dart';

// explicitToJson lets using nested class JoinedChallenge
@JsonSerializable(explicitToJson: true)
class JoinedChallengeSchoolGsa {
  JoinedChallengeSchoolGsa(
      {required this.uuid, required this.main_joined_challenge});

  String uuid;
  JoinedChallenge main_joined_challenge;

  factory JoinedChallengeSchoolGsa.fromJson(Map<String, dynamic> json) =>
      _$JoinedChallengeSchoolGsaFromJson(json);
  Map<String, dynamic> toJson() => _$JoinedChallengeSchoolGsaToJson(this);
}
