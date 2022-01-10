import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'cubit/challenge_article_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Single challenge page of type Event Participant.
part 'part_info.dart';

class ChallengeArticlePage extends StatelessWidget {
  ChallengeArticlePage({Key? key, required this.uuid}) : super(key: key);
  final String uuid;
  String articleDescription = "";
  String articleTitle = "";
  String articleUrl = "";

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChallengeArticleCubit>(context).fetchChallenge(uuid: uuid);

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
                hintText: "Aprašykite, kaip atlikote užduotį",
                border: border,
                disabledBorder: border,
                enabledBorder: border,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              autocorrect: false,
              textInputAction: TextInputAction.done,
              obscureText: false,
              maxLines: 4,
              onChanged: (val) => {articleDescription = val},
            )),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                hintText: "Straipsnio pavadinimas",
                border: border,
                disabledBorder: border,
                enabledBorder: border,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              autocorrect: false,
              textInputAction: TextInputAction.done,
              obscureText: false,
              maxLines: 1,
              onChanged: (val) => {articleTitle = val},
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
              textInputAction: TextInputAction.done,
              obscureText: false,
              maxLines: 1,
              onChanged: (val) => {articleUrl = val},
            )),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () async {},
                child: Text(
                  "Saugoti ir pateikti vėliau",
                  style: TextStyle(color: Colors.white),
                ))),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: () async {},
                child: Text(
                  "Pateikti",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    );
  }
}
