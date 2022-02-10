import 'package:json_annotation/json_annotation.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/model/streak/streak_class.dart';

part 'profile_class.g.dart';

@JsonSerializable()
class Profile {
  String email;
  String? username;
  Region? region;
  int all_points;
  int remaining_points;
  Streak streak;
  List<Medal> medals;

  Profile(
      {required this.email,
      this.username,
      this.region,
      this.all_points = 0,
      required this.remaining_points,
      required this.streak,
      required this.medals});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
