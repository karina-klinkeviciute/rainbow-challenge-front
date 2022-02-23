import 'dart:convert';

FileModel messageFromJson(String str) => FileModel.fromJson(json.decode(str));

String messageToJson(FileModel data) => json.encode(data.toJson());

class FileModel {
  String? file;
  String? file_name;

  FileModel({required this.file, required this.file_name});

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
        file: json["file"],
        file_name: json["file_name"],
      );

  Map<String, dynamic> toJson() => {"file": file, "file_name": file_name};
}
