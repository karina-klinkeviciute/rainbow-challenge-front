import 'package:flutter/material.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/quiz/quiz_compleate.dart';
import 'package:rainbow_challenge/utils/model/quiz/quiz_options.dart';

class QuizQuestionWidget extends StatefulWidget {
  final String uuid;
  final List<Question> questions;
  var count = 0;
  QuizQuestionWidget({
    Key? key,
    required this.questions,
    required this.uuid,
  }) : super(key: key);

  @override
  State<QuizQuestionWidget> createState() =>
      _QuizQuestionWidgetState(questions, uuid);
}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget> {
  var _questionNumber = 1;
  final List<Question> questions;
  late PageController _controller;
  final String uuid;

  _QuizQuestionWidgetState(this.questions, this.uuid);

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
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(5),
            foregroundDecoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.pink, width: 1),
              ),
              child: LinearProgressIndicator(
                value: _questionNumber / questions.length,
                color: Colors.pink,
                backgroundColor: Colors.white,
                minHeight: 13,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 7,
                  child: Text(' $_questionNumber/${questions.length}',
                      style: TextStyle(fontSize: 14))),
              Expanded(
                flex: 8,
                child: QuestionNumberWidget(
                    questionNumber: _questionNumber, questions: questions),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: PageView.builder(
              itemCount: questions.length,
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final _question = questions[index];
                final _uuid = uuid;
                return buildQuestion(_question, _uuid);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildQuestion(Question question, String uuid) {
    final _uuid = uuid;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Expanded(
              flex: 3,
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(question.question,
                      style: const TextStyle(fontSize: 18)),
                ),
              )),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
          Expanded(
            flex: 5,
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
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10), child: Divider()),
          Expanded(flex: 1, child: buildTextButton(_uuid))
        ],
      ),
    );
  }

  TextButton buildTextButton(String uuid) {
    DioClient dioClient = DioClient();
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
          } else {
            Future<int> patchQuizChallenge({required String uuid}) async {
              final String challengeTypePoint =
                  '/api/joined_challenge/quiz_joined_challenge/$uuid/';
              Map<String, Object> body = {
                "main_joined_challenge": {
                  "status": "completed",
                }
              };
              await dioClient.patchItem(challengeTypePoint, body).then(
                    (value) => setState(
                      () {
                        widget.count = value;
                        print(value);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QuizPageConfirm(count: widget.count),
                          ),
                        );
                      },
                    ),
                  );
              return widget.count;
            }

            patchQuizChallenge(uuid: uuid);
          }
        },
        child: Text(_questionNumber < questions.length
            ? 'Kitas klausimas'
            : 'Baigti testą'));
  }
}

class QuestionNumberWidget extends StatefulWidget {
  final List<Question> questions;
  final int questionNumber;
  QuestionNumberWidget({required this.questions, required this.questionNumber});

  @override
  State<QuestionNumberWidget> createState() => _QuestionNumberWidgetState();
}

class _QuestionNumberWidgetState extends State<QuestionNumberWidget> {
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Container(
      height: MediaQuery.of(context).size.height * 0.027,
      child: ListView.separated(
        controller: controller,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            Container(width: MediaQuery.of(context).size.height * 0.01),
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          final _isSelected = widget.questionNumber == index + 1;
          final color = _isSelected ? Colors.pink : Colors.black;
          return Text(
            '${index + 1}',
            style: TextStyle(color: color, fontSize: 14),
          );
        },
      ),
    );
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
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
          child: Column(
        children: widget.question.answers
            .map((answers) => buildOption(context, answers))
            .toList(),
      )),
    );
  }

  Widget buildOption(BuildContext context, Answer answer) {
    final color = getColorForAnswer(answer, widget.question);

    return GestureDetector(
      onTap: (() => widget.onClickedAnswer(answer)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.44,
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color),
              ),
              child: Text(
                answer.answer,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Expanded(flex: 1, child: getIconForAnswer(answer, widget.question))
        ],
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
    return Colors.grey.shade400;
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

  Widget getIconForAnswer(Answer answer, Question question) {
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
