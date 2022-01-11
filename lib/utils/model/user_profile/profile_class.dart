import 'package:json_annotation/json_annotation.dart';
part 'profile_class.g.dart';

@JsonSerializable()
class Profile {
  String email;
  String? username;
//  String? region;
  int all_points;
//  String? remaining_points;
//  String? streak;
//  Object? medals;
  // medals { level, time_issued}

  Profile({
    required this.email,
    this.username,
    //  this.region,
    this.all_points = 0,
    //     this.remaining_points,
    //   this.streak,
    //  this.medals
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
