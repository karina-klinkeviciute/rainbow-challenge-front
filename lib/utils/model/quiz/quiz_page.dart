import 'package:flutter/material.dart';
import 'package:rainbow_challenge/utils/model/quiz/quiz_options.dart';

class QuizQuestionWidget extends StatefulWidget {
  final List<Question> questions;

  QuizQuestionWidget({Key? key, required this.questions}) : super(key: key);

  @override
  State<QuizQuestionWidget> createState() =>
      _QuizQuestionWidgetState(questions);
}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget> {
  var _questionNumber = 1;
  final List<Question> questions;

  _QuizQuestionWidgetState(this.questions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Question $_questionNumber/${questions.length}'),
          const Divider(),
          Expanded(
            child: PageView.builder(
              itemCount: questions.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final _question = questions[index];
                return buildQuestion(_question);
              },
            ),
          )
        ],
      ),
    );
  }

  Container buildQuestion(Question question) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Text(question.question, style: const TextStyle(fontSize: 25)),
          Expanded(child: QuizOptionWidget(question: question))
        ],
      ),
    );
  }
}

class QuizOptionWidget extends StatelessWidget {
  final Question question;

  const QuizOptionWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: question.answers
          .map((answers) => buildOption(context, answers))
          .toList(),
    ));
  }

  Widget buildOption(BuildContext context, Answer answer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          answer.answer,
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
