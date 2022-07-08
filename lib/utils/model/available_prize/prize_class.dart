import 'dart:convert';

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


// To parse this JSON data, do
//
//     final rainbowBalance = rainbowBalanceFromJson(jsonString);



RainbowBalance rainbowBalanceFromJson(String str) => RainbowBalance.fromJson(json.decode(str));

class RainbowBalance {
    RainbowBalance({
        required this.earnedRainbows,
        required this.remainingRainbows,
        required this.earning,
        required this.spending,
    });

    final int earnedRainbows;
    final int remainingRainbows;
    final List<Earning> earning;
    final List<Spending> spending;

    factory RainbowBalance.fromJson(Map<String, dynamic> json) => RainbowBalance(
        earnedRainbows: json["earned_rainbows"],
        remainingRainbows: json["remaining_rainbows"],
        earning: List<Earning>.from(json["earning"].map((x) => Earning.fromJson(x))),
        spending: List<Spending>.from(json["spending"].map((x) => Spending.fromJson(x))),
    );

}

class Earning {
    Earning({
        required this.name,
        required this.points,
    });

    final String name;
    final int points;

    factory Earning.fromJson(Map<String, dynamic> json) => Earning(
        name: json["name"],
        points: json["points"],
    );
}

class Spending {
    Spending({
        required this.name,
        required this.amount,
        required this.price,
        required this.total,
    });

    final String name;
    final int amount;
    final int price;
    final int total;

    factory Spending.fromJson(Map<String, dynamic> json) => Spending(
        name: json["name"],
        amount: json["amount"],
        price: json["price"],
        total: json["total"],
    );
}
