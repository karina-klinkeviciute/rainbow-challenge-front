import 'package:json_annotation/json_annotation.dart';

part 'streak_class.g.dart';

@JsonSerializable()
class Streak {
  int streak;
  int change;

  Streak({required this.streak, required this.change});

  factory Streak.fromJson(Map<String, dynamic> json) => _$StreakFromJson(json);
  Map<String, dynamic> toJson() => _$StreakToJson(this);
}
