import 'package:json_annotation/json_annotation.dart';
part 'region_class.g.dart';

@JsonSerializable()
class RegionModel {
  String name;
  String uuid;
  int points;

  RegionModel({this.name = "Lietuva", this.points = 0, required this.uuid});

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
