import 'package:json_annotation/json_annotation.dart';
part 'region_class.g.dart';

@JsonSerializable()
class Region {
  String name;
  String uuid;
  String points;

  Region({required this.name, required this.points, required this.uuid});

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
