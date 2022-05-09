import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_quiz_model/challenge_quiz_question_model.dart';
import 'package:rainbow_challenge/widgets/file_upload_widget.dart';
import 'package:collection/collection.dart';
import '../../../utils/model/challenge/challenge_quiz/challenge_quiz_class.dart';
import 'package:http/http.dart' as http;
import 'cubit/challenge_quiz_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// Single challenge page of type Event Participant.
part 'part_info.dart';

class ChallengeQuizPage extends StatefulWidget {
  ChallengeQuizPage({Key? key, required this.type_uuid, required this.uuid}) : super(key: key);
  final String type_uuid;
  final String uuid;

  @override
  State<ChallengeQuizPage> createState() => _ChallengeQuizPageState();
}

class _ChallengeQuizPageState extends State<ChallengeQuizPage> with SingleTickerProviderStateMixin {
  List<SelectedAnswer> selectedOptions = [];
  final dio = DioClient();
  var r;
  bool selected = false;
  String? answerSelected;
  late int totalPages;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //data();
  }

  Future<ChallengeQuiz> data(String id) async {
    ChallengeQuiz r = await BlocProvider.of<ChallengeQuizCubit>(context).fetchChallenge(uuid: id);
    print('length is ${r.questions.length}');
    totalPages = r.questions.length;
    print('total is ${r.questions.length}');
    return r;
  }

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
        mainArea: SizedBox(
            width: double.infinity, //MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
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
              ],
            )));
  }

  dataWidget(PageController controller, ChallengeQuiz r) {
    List<Question> data = r.questions; //
    print('data is $data');

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 600,
        width: 340,
        color: Colors.transparent,
        child: Center(
          child: PageView(
              onPageChanged: (i) {
                print('page changed to $i');
              },
              padEnds: true,
              scrollDirection: Axis.horizontal,
              pageSnapping: false,
              controller: controller,
              children: List.generate(data.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: double.maxFinite,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        width: MediaQuery.of(context).size.width * 0.8,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.white54,
                                          border: Border.all(color: Colors.red),
                                          borderRadius: BorderRadius.circular(10),
                                        )),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        width: (MediaQuery.of(context).size.width * 0.8) * ((index + 1) / data.length).toDouble(),
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(10),
                                        )),
                                  ),
                                  // Align(
                                  //   alignment: Alignment.bottomRight,
                                  //   child: Row(
                                  //     children: List.generate(
                                  //         data.length,
                                  //         (i) => Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: Colors.transparent,
                                  //                 border: Border.all(
                                  //                   color: Colors.red,
                                  //                 ),
                                  //                 borderRadius: BorderRadius.all(Radius.circular(20))),
                                  //             child: Text('$index'))).toList(),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              '${index + 1}. ${data[index].question}',
                              style: Theme.of(context).textTheme.headline3!,
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 50,
                          ),

                          ...?data[index]
                              .answers
                              ?.map((i) => InkWell(
                                  onTap: () {
                                    //todo perform ui changes
                                    setState(() {
                                      //selected = !selected;
                                      answerSelected = i.uuid;
                                    });
                                    submitAnswer(i.uuid);

                                    print(i.uuid);
                                    print(i.answer);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 60,
                                      width: 280,
                                      child: Center(
                                        child: ListTile(
                                          title: Text(
                                            i.answer,
                                            maxLines: 2,
                                            softWrap: true,
                                            style: TextStyle(color: selected ? Colors.teal : Colors.blueGrey, fontSize: 16),
                                          ),
                                          trailing: Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              color: answerSelected == i.uuid ? Colors.tealAccent : Colors.transparent,
                                              border: Border.all(
                                                color: answerSelected == i.uuid ? Colors.tealAccent : Colors.blueGrey,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,
                                          border:
                                              Border.all(width: 1, color: answerSelected == i.uuid ? Colors.tealAccent : Colors.blueGrey)),
                                    ),
                                  )))
                              .toList(),

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
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                //todo send request to api
                                //https://rainbowchallenge.lt/api/schema/swagger-ui/#/api/api_joined_challenge_user_answer_create
                              },
                              child: Text('SUBMIT'))
                        ],
                      ),
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }

  Future submitAnswer(String answerId) async {
    final submission = await dio.submitAnswer(
      '/api/joined_challenge/user_answer/',
      {"answer": "${answerId}"},
    );

    print(submission);

    // var body = {"answer": answerId};
    // //final endpoint = Api.baseUrl + Api.challengeQuizAnswerEndpoint;
    // final endpoint = 'https://rainbowchallenge.lt/api/schema/swagger-ui/#/api/joined_challenge/user_answer/';
    //
    // try {
    //   var response = await Dio().post(endpoint, data: body);
    //   print("response is $response");
    // } catch (e) {
    //   print("error is $e");
    // }
    // final response = await http.post(Uri.parse(endpoint), body: body);
    // print('res is $response');
    //
    // if (response.statusCode == 201) {
    //   var result = jsonDecode(response.body);
    //   print('result is $result');
    //   return result;
    // } else {
    //   throw Exception('Failed to get answer');
    // }
  }

  Widget _challengeForm = ElevatedButton(onPressed: () {}, child: Text('To be added here'));
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

//custom classes for the quiz logic
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
