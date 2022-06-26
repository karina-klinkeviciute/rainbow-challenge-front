// To parse this JSON data, do
//
//     final correctAnswer = correctAnswerFromJson(jsonString);

import 'dart:convert';

CorrectAnswer correctAnswerFromJson(String str) =>
    CorrectAnswer.fromJson(json.decode(str));

class CorrectAnswer {
  CorrectAnswer({
    required this.correctAnswer,
  });

  CorrectAnswerClass correctAnswer;

  factory CorrectAnswer.fromJson(Map<String, dynamic> json) => CorrectAnswer(
        correctAnswer: CorrectAnswerClass.fromJson(json["correct_answer"]),
      );
}

class CorrectAnswerClass {
  CorrectAnswerClass({
    required this.uuid,
  });

  String uuid;

  factory CorrectAnswerClass.fromJson(Map<String, dynamic> json) =>
      CorrectAnswerClass(
        uuid: json["uuid"],
      );
}
