import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';
import 'cubit/challenge_article_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Single challenge page of type Event Participant.
part 'part_info.dart';

class ChallengeArticlePage extends StatefulWidget {
  ChallengeArticlePage({Key? key, required this.type_uuid, required this.uuid})
      : super(key: key);

  final String type_uuid;
  final String uuid;

  @override
  State<StatefulWidget> createState() {
    return _ChallengeArticlePageState(type_uuid: type_uuid, uuid: uuid);
  }
}

class _ChallengeArticlePageState extends State<ChallengeArticlePage> {
  TextEditingController articleDescriptionController = TextEditingController();
  TextEditingController articleTitleController = TextEditingController();
  TextEditingController articleUrlController = TextEditingController();
  final String type_uuid;
  final String uuid;

  _ChallengeArticlePageState({required this.type_uuid, required this.uuid});

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    var joinedChallenge = await BlocProvider.of<ChallengeArticleCubit>(context)
        .fetchChallenge(type_uuid: type_uuid, uuid: uuid);

    articleDescriptionController.text = joinedChallenge.description ?? "";
    articleTitleController.text = joinedChallenge.article_name ?? "";
    articleUrlController.text = joinedChallenge.article_url ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
        mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                _challengeInfo,
                getArticleForm(),
              ],
            )));
  }

  Widget getArticleForm() {
    OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: ThemeColors.primaryColor),
      borderRadius: BorderRadius.circular(5),
    );

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                hintText: "Aprašykite, kaip atlikote užduotį *",
                border: border,
                disabledBorder: border,
                enabledBorder: border,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              autocorrect: false,
              controller: articleDescriptionController,
              textInputAction: TextInputAction.done,
              obscureText: false,
              maxLines: 4,
              //onChanged: (val) => {articleDescription = val},
            )),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                hintText: "Straipsnio pavadinimas *",
                border: border,
                disabledBorder: border,
                enabledBorder: border,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              autocorrect: false,
              controller: articleTitleController,
              textInputAction: TextInputAction.done,
              obscureText: false,
              maxLines: 1,
              //onChanged: (val) => {articleTitle = val},
            )),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextFormField(
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                hintText: "Straipsnio nuoroda",
                border: border,
                disabledBorder: border,
                enabledBorder: border,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              autocorrect: false,
              controller: articleUrlController,
              textInputAction: TextInputAction.done,
              obscureText: false,
              maxLines: 1,
              //onChanged: (val) => {articleUrl = val},
            )),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () {
                  saveAction(context);
                },
                child: Text(
                  "Saugoti ir pateikti vėliau",
                  style: TextStyle(color: Colors.white),
                ))),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: () {
                  completeAction(context);
                },
                child: Text(
                  "Pateikti",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    );
  }

  completeAction(BuildContext context) async {
    if (articleTitleController.text == "" ||
        articleDescriptionController.text == "") {
      await showMessage(context, "Klaida", "Laukai yra privalomi");
      return;
    }

    JoinedChallengesRepository joinedChallengesRepository =
        JoinedChallengesRepository(dioClient: DioClient());

    List<MapEntry<String, Object>> bodyParams =
        List<MapEntry<String, Object>>.empty(growable: true);

    bodyParams.add(MapEntry("description", articleDescriptionController.text));
    bodyParams.add(MapEntry("article_url", articleUrlController.text));
    bodyParams.add(MapEntry("article_name", articleTitleController.text));

    var result = await joinedChallengesRepository.completeChallenge(
        uuid: uuid,
        challengeType: Api().getChallengeTypeSubPath(Api.challengeTypeArticle),
        status: "completed",
        bodyParams: bodyParams);

    if (result != null &&
        result["main_joined_challenge"] != null &&
        (result["main_joined_challenge"] as Map<String, dynamic>)["status"] ==
            "completed") {
      await showMessage(context, "Ačiū!",
          "Ačiū už atliktą užduotį! Savanoris peržiūrės jūsų atsakymą ir įskaitys vaivorykštes. Apie tai būsite informuoti pranešimų skiltyje.");
      Navigator.of(context).pop();
      return;
    }

    if (result != null &&
        result["main_joined_challenge"] != null &&
        (result["main_joined_challenge"] as Map<String, dynamic>)["status"] ==
            "confirmed") {
      await showMessage(context, "Ačiū!",
          "Ačiū už atliktą užduotį. Jums vaivorykštės įskaičiuotos.");
      Navigator.of(context).pop();
      return;
    }

    if (result != null && result["error"] != null) {
      await showMessage(context, "Klaida", result["error"]);
      return;
    }

    await showMessage(
        context, "Klaida", "Nenumatyta klaida, mėginkite dar kartą");
  }

  saveAction(BuildContext context) async {
    JoinedChallengesRepository joinedChallengesRepository =
        JoinedChallengesRepository(dioClient: DioClient());

    List<MapEntry<String, Object>> bodyParams =
        List<MapEntry<String, Object>>.empty(growable: true);

    bodyParams.add(MapEntry("description", articleDescriptionController.text));
    bodyParams.add(MapEntry("article_url", articleUrlController.text));
    bodyParams.add(MapEntry("article_name", articleTitleController.text));

    var result = await joinedChallengesRepository.completeChallenge(
        uuid: uuid,
        challengeType: Api().getChallengeTypeSubPath(Api.challengeTypeArticle),
        status: "joined",
        bodyParams: bodyParams);

    if (result != null &&
        result["main_joined_challenge"] != null &&
        (result["main_joined_challenge"] as Map<String, dynamic>)["status"] ==
            "joined") {
      await showMessage(context, "Ačiū!", "Pakeitimai išsaugoti");
      Navigator.of(context).pop();
      return;
    }

    if (result != null && result["error"] != null) {
      await showMessage(context, "Klaida", result["error"]);
      return;
    }

    await showMessage(
        context, "Klaida", "Nenumatyta klaida, mėginkite dar kartą");
  }

  Future showMessage(BuildContext context, String title, String message) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
