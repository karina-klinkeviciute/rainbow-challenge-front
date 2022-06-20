import 'package:json_annotation/json_annotation.dart';
part 'prize_class.g.dart';

@JsonSerializable()
class Prize {
  String name;
  String uuid;
  String description;
  int amount;
  int price;
  int amount_remaining;
  String? image;
  Prize(
      {required this.name,
      required this.uuid,
      required this.description,
      required this.amount,
      required this.price,
      required this.amount_remaining,
      this.image});

  factory Prize.fromJson(Map<String, dynamic> json) => _$PrizeFromJson(json);
  Map<String, dynamic> toJson() => _$PrizeToJson(this);
}
