import 'package:json_annotation/json_annotation.dart';
part 'region_class.g.dart';

@JsonSerializable()
class Region {
  String name;
  String uuid;
  int points;

  Region({this.name = "Lietuva", this.points = 0, required this.uuid});

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
