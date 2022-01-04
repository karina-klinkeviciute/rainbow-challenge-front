import 'package:json_annotation/json_annotation.dart';
part 'news_class.g.dart';

@JsonSerializable()
class News {
  String title;
  String body;
  String? image;
  DateTime created_at;

  News(
      {required this.title,
      required this.body,
      required this.created_at,
      this.image});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
