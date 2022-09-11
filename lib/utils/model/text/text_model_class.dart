import 'package:json_annotation/json_annotation.dart';
part 'text_model_class.g.dart';

@JsonSerializable()
class TextModel {
  String uuid;
  String title;
  String body;
  String notes;
  String created_at;
  String updated_at;

  TextModel(
      {required this.uuid,
      required this.title,
      required this.body,
      this.notes = '',
      this.created_at = '',
      this.updated_at = ''});

  factory TextModel.fromJson(Map<String, dynamic> json) =>
      _$TextModelFromJson(json);
  Map<String, dynamic> toJson() => _$TextModelToJson(this);
}
