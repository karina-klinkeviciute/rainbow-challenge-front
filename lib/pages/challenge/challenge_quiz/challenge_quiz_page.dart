import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_quiz_model/challenge_quiz_question_model.dart';
import 'package:rainbow_challenge/widgets/file_upload_widget.dart';
import 'package:collection/collection.dart';
import '../../../utils/model/challenge/challenge_quiz/challenge_quiz_class.dart';
import '../../../utils/model/challenge/challenge_quiz_model/challenge_quiz_answer_model.dart';
import 'cubit/challenge_quiz_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Single challenge page of type Event Participant.
part 'part_info.dart';

bool selected = false;

class ChallengeQuizPage extends StatefulWidget {
  ChallengeQuizPage({Key? key, required this.type_uuid, required this.uuid}) : super(key: key);
  final String type_uuid;
  final String uuid;

  @override
  State<ChallengeQuizPage> createState() => _ChallengeQuizPageState();
}

class _ChallengeQuizPageState extends State<ChallengeQuizPage> {
  List<SelectedAnswer> selectedOptions = [];
  var r;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //data();
  }

  Future<ChallengeQuiz> data(String id) async {
    ChallengeQuiz r = await BlocProvider.of<ChallengeQuizCubit>(context).fetchChallenge(uuid: id);
    print('r is $r');
    return r;
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return WrapperMainWidget(
        mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                //_challengeInfo,

                // Padding(
                //   padding: const EdgeInsets.only(top: 30, bottom: 40),
                //   child: Text("Taking History Quiz"),
                // ),

                FutureBuilder<ChallengeQuiz>(
                  future: data(widget.type_uuid),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<ChallengeQuiz> snapshot,
                  ) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        print('error is ${snapshot.stackTrace}');
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        return dataWidget(controller, snapshot.data!);
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text('State: ${snapshot.connectionState}');
                    }
                  },
                ),

                // r != null ? dataWidget(controller, r!) : SizedBox(),
                _challengeForm,
                // Container(
                //   height: 24,
                // ),
                // new FileUploadWidget(uuid: uuid, challenge_type: Api.challengeTypeQuiz)
              ],
            )));
  }

  dataWidget(PageController controller, ChallengeQuiz r) {
    List<Question> data = r.questions; //
    print('data is $data');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 500,
        width: 340,
        color: Colors.red,
        child: Center(
          child: PageView(
              scrollDirection: Axis.vertical,
              pageSnapping: false,
              controller: controller,
              children: List.generate(data.length, (index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: double.maxFinite,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //component for question
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          data[index].question,
                          style: Theme.of(context).textTheme.headline3!,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      // ListView.builder(
                      //     itemCount: data[index].answer?.length,
                      //     itemBuilder: (BuildContext context, int position) {
                      //       return Text(
                      //         data[index].answer![position].answer!,
                      //         style: TextStyle(color: Colors.green, fontSize: 15),
                      //       );
                      //     }),
                      ...?data[index]
                          .answers
                          ?.map((i) => InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 250,
                                  child: Center(
                                    child: Text(
                                      i.answer,
                                      maxLines: 2,
                                      softWrap: true,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black26)),
                                ),
                              )))
                          .toList(),

                      //...?(data[index].answer)?.map((i) => Text(i.answer!)),

                      //component for answer
                      // InkWell(
                      //   onTap: () {
                      //     //logic
                      //     print('answer is $answer');
                      //
                      //     List<SelectedAnswer?> chosenAnswers = selectedOptions
                      //         .where((element) => element.questionId == data[index].uuid && element.id == answer.uuid)
                      //         .toList();
                      //
                      //     print('chosen answers is ${chosenAnswers.length}');
                      //     //_questions[index].answers[i].chosen
                      //
                      //     List<OptionAnswer?> chosenOptions =
                      //     data[index].answer.where((element) => element.chosen == true).cast<OptionAnswer?>().toList();
                      //
                      //     print('lenght of chosen options is $chosenOptions');
                      //
                      //     if (chosenOptions.isNotEmpty) {
                      //       for (var x in chosenOptions) {
                      //         if (x!.answerId == answer.uuid) {
                      //           return;
                      //         }
                      //         print('x ids $x');
                      //         var selectedAnswerIndex = selectedOptions.indexWhere(
                      //                 (element) => element.questionId == data[index].uuid && element.id == x?.answerId);
                      //         selectedOptions.removeAt(selectedAnswerIndex);
                      //        // var chosenOptionIndex = _questions[index].answers.indexOf(x!);
                      //
                      //       //  _questions[index].answers[chosenOptionIndex].chosen = false;
                      //
                      //       //  print('not chosen is ${_questions[index].answers[chosenOptionIndex].chosen}');
                      //         setState(() {});
                      //       }
                      //       setState(() {});
                      //     } else {
                      //       SelectedAnswer a =
                      //       SelectedAnswer(questionId: data[index].uuid, id: answer.uuid, answer: answer.answer);
                      //       selectedOptions.add(a);
                      //
                      //      // data[index].answer[i].chosen = true;
                      //
                      //       setState(() {});
                      //       print('selectionOptions is $selectedOptions');
                      //     }
                      //
                      //     // print('isChosen is $isChosen');
                      //     //  switch (isChosen.id) {
                      //     //    case 'false':
                      //     //      SelectedAnswer a =
                      //     //          SelectedAnswer(questionId: _questions[index].id, id: answer.id, answer: answer.answer);
                      //     //      selectedOptions.add(a);
                      //     //      _questions[index].answers[i].chosen = true;
                      //     //      print('chosen is ${_questions[index].answers[i].chosen}');
                      //     //      setState(() {});
                      //     //      break;
                      //     //
                      //     //    default:
                      //     //      var selectedAnswerIndex = selectedOptions.indexWhere(
                      //     //          (element) => element.questionId == _questions[index].id && element.id == answer.id);
                      //     //      selectedOptions.removeAt(selectedAnswerIndex);
                      //     //      _questions[index].answers[i].chosen = false;
                      //     //
                      //     //      print('not chosen is ${_questions[index].answers[i].chosen}');
                      //     //      setState(() {});
                      //     //
                      //     //      break;
                      //     //  }
                      //
                      //     // print('touched');
                      //     // print('item is ${_questions[index].answers}');
                      //     // SelectedAnswer a = SelectedAnswer(id: _questions[index], answer: answer.answer);
                      //     // if (selectedOptions.isEmpty) {
                      //     //   print('empty so add new');
                      //     //   print('id of a is ${a.id}  and answer is ${a.answer}');
                      //     //   selectedOptions.add(a);
                      //     // } else {
                      //     //   // var result = selectedOptions.firstWhere((element) => element.id == a.id, orElse: () {
                      //     //   //   return a;
                      //     //   // });
                      //     //
                      //     //   //print('exist');
                      //     //
                      //     //   // print('result is $result');
                      //     //   // if (result.id == _questions[index].id) {
                      //     //   //   print('exists');
                      //     //   //   setState(() {
                      //     //   //     result.answer = answer;
                      //     //   //   });
                      //     //   // } else {
                      //     //   //   print('does not exist');
                      //     //   //   selectedOptions.add(a);
                      //     //   // }
                      //     // }
                      //
                      //     // print(selectedOptions);
                      //   },
                      //   child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           // selectedOptions.contains(answer)
                      //           //     ? Container(
                      //           //         height: 50,
                      //           //         width: 250,
                      //           //         child: Center(
                      //           //           child: Text(
                      //           //             answer.answer,
                      //           //             maxLines: 2,
                      //           //             softWrap: true,
                      //           //             style: TextStyle(color: Colors.white),
                      //           //           ),
                      //           //         ),
                      //           //         decoration: BoxDecoration(
                      //           //             borderRadius: BorderRadius.circular(5),
                      //           //             color: Colors.deepPurpleAccent,
                      //           //             border: Border.all(color: Colors.black26)),
                      //           //       )
                      //           Container(
                      //             height: 50,
                      //             width: 250,
                      //             child: Center(
                      //               child: Text(
                      //                 answer.answer,
                      //                 maxLines: 2,
                      //                 softWrap: true,
                      //                 style: Theme.of(context).textTheme.subtitle2!,
                      //               ),
                      //             ),
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(5),
                      //                 color: answer.chosen ? Colors.purple : Colors.white,
                      //                 border: Border.all(color: Colors.black26)),
                      //           )
                      //         ],
                      //       )),
                      // ),
                      // ),
                      SizedBox(
                        height: 50,
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  ),
                );
              })),
        ),
      ),
    );
  }

  Widget _challengeForm = ElevatedButton(
      onPressed: () {},
      // child: Text(AppLocalizations.of(context)!.action_join_challenge),
      child: Text('To be added here'));
}

// List<Questions> _questions = [
//   Questions(id: '1', question: 'Which Beach?', answers: [
//     OptionAnswer(
//       answerId: '1a',
//       answer: 'Long Island.',
//       chosen: false,
//     ),
//     OptionAnswer(answerId: '1b', answer: 'Long Month.', chosen: false),
//   ]),
//   Questions(id: '2', question: 'Which Place?', answers: [
//     OptionAnswer(answerId: '2a', answer: 'Long Island.', chosen: false),
//     OptionAnswer(answerId: '2b', answer: 'Long Osu.', chosen: false)
//   ])
// ];

// class Questions {
//   final String id;
//   final String question;
//   final List<OptionAnswer> answers;
//
//   Questions({
//     required this.id,
//     required this.question,
//     required this.answers,
//   });
// }

class OptionAnswer {
  final String answerId;
  final String answer;
  bool chosen;

  OptionAnswer({required this.answerId, required this.answer, required this.chosen});
}

class SelectedAnswer extends Equatable {
  final String questionId;
  final String id;
  late String answer;

  SelectedAnswer({
    required this.questionId,
    required this.id,
    required this.answer,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, answer, questionId];
}
