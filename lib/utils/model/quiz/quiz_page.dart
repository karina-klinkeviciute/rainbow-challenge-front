import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_quiz/cubit/challenge_quiz_cubit.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/quiz/correct_answer.dart';
import 'package:rainbow_challenge/utils/model/quiz/quiz_options.dart';
import 'package:rainbow_challenge/utils/repository/challenges/challenges_quiz_repository.dart';

class QuizQuestionWidget extends StatefulWidget {
  final List<Question> questions;

  QuizQuestionWidget({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  State<QuizQuestionWidget> createState() =>
      _QuizQuestionWidgetState(questions);
}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget> {
  var _questionNumber = 1;
  final List<Question> questions;
  late PageController _controller;

  _QuizQuestionWidgetState(this.questions);

  @override
  void initState() {
    super.initState();
    
    _controller = PageController(initialPage: 0);
  }

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
              controller: _controller,
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
          Expanded(
            child: QuizOptionWidget(
              question: question,
              onClickedAnswer: (Answer answer) {
                if (question.isAnswered) return;
                setState(() {
                  question.isAnswered = true;
                  question.selectedAnswer = answer;
                });
              },
            ),
          ),
          buildTextButton()
        ],
      ),
    );
  }

  TextButton buildTextButton() {
    return TextButton(
        onPressed: () {
          if (_questionNumber < questions.length) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInExpo,
            );
            setState(() {
              _questionNumber++;
            });
          }
        },
        child: Text(
            _questionNumber < questions.length ? 'Next Page' : 'See Results'));
  }
}

class QuizOptionWidget extends StatefulWidget {
  final Question question;
  final ValueChanged<Answer> onClickedAnswer;

  String correctUuid = '';

  QuizOptionWidget({
    Key? key,
    required this.question,
    required this.onClickedAnswer,
  }) : super(key: key);

  @override
  State<QuizOptionWidget> createState() => _QuizOptionWidgetState();
}

class _QuizOptionWidgetState extends State<QuizOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: widget.question.answers
          .map((answers) => buildOption(context, answers))
          .toList(),
    ));
  }

  Widget buildOption(BuildContext context, Answer answer) {
    final color = getColorForAnswer(answer, widget.question);

    return GestureDetector(
      onTap: (() => widget.onClickedAnswer(answer)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              answer.answer,
              style: TextStyle(fontSize: 20),
            ),
            getIconForAnswer(answer, widget.question)
          ],
        ),
      ),
    );
  }

  Color getColorForAnswer(Answer answer, Question question) {
    final isSelected = answer == question.selectedAnswer;
    if (question.isAnswered) {
      if (isSelected) {
        getCorrectAnswer(uiid: answer.uuid);
        if (widget.correctUuid == '') {
          return Colors.grey.shade300;
        }
        return widget.correctUuid == answer.uuid ? Colors.green : Colors.red;
      } else if (answer.uuid == widget.correctUuid) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  Future<String> getCorrectAnswer({required String uiid}) async {
    final DioClient dioClient = DioClient();
    await dioClient
        .getAnswer(Api.challengeGetRightAnswer, {"answer": "${uiid}"}).then(
            (String value) {
      setState(() {
        widget.correctUuid = value;
      });
    });
    return widget.correctUuid;
  }

  getIconForAnswer(Answer answer, Question question) {
    final isSelected = answer == question.selectedAnswer;
    if (question.isAnswered) {
      if (isSelected) {
        if (widget.correctUuid == '') {
          return const SizedBox.shrink();
        }
        return widget.correctUuid == answer.uuid
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red);
      } else if (answer.uuid == widget.correctUuid) {
        return const Icon(Icons.check_circle, color: Colors.green);
      }
    }
    return const SizedBox.shrink();
  }
}
