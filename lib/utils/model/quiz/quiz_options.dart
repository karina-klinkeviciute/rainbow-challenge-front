class Question {
  Question({
    required this.uuid,
    required this.question,
    required this.answers,
    required this.isAnswered,
  });

  final String uuid;
  final String question;
  final List<Answer> answers;
  final bool isAnswered;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        uuid: json["uuid"],
        question: json["question"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        isAnswered: json["is_answered"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "is_answered": isAnswered,
      };
}

class Answer {
  Answer({
    required this.uuid,
    required this.answer,
  });

  final String uuid;
  final String answer;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        uuid: json["uuid"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "answer": answer,
      };
}
