import 'package:json_annotation/json_annotation.dart';
part 'medal_class.g.dart';

@JsonSerializable()
class Medal {
  String level;
  String time_issued;

  Medal({required this.level, required this.time_issued});

  factory Medal.fromJson(Map<String, dynamic> json) => _$MedalFromJson(json);
  Map<String, dynamic> toJson() => _$MedalToJson(this);
}
