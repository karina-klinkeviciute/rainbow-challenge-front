import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/repository/joined_challenges/joined_challenges_repository.dart';
import 'package:rainbow_challenge/widgets/file_upload_widget.dart';
import 'cubit/challenge_event_organizer_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Single challenge page of type Event Participant.
part 'part_info.dart';

class ChallengeEventOrganizerPage extends StatefulWidget {
  ChallengeEventOrganizerPage(
      {Key? key, required this.type_uuid, required this.uuid})
      : super(key: key);
  final String type_uuid;
  final String uuid;

  @override
  State<StatefulWidget> createState() {
    return _ChallengeEventOrganizerPageState(type_uuid: type_uuid, uuid: uuid);
  }
}

class _ChallengeEventOrganizerPageState
    extends State<ChallengeEventOrganizerPage> {
  final String type_uuid;
  final String uuid;

  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  bool organizedAlone = false;

  _ChallengeEventOrganizerPageState(
      {required this.type_uuid, required this.uuid});

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
        mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                _challengeInfo,
                getForm(),
                Container(
                  height: 24,
                ),
                new FileUploadWidget(
                    uuid: uuid, challenge_type: Api.challengeTypeEventOrg)
              ],
            )));
  }

  Future<void> loadData() async {
    var challenge = await BlocProvider.of<ChallengeEventOrganizerCubit>(context)
        .fetchChallenge(type_uuid: type_uuid, uuid: uuid);

    descriptionController.text = challenge.description ?? "";
    nameController.text = challenge.event_name ?? "";
    urlController.text = challenge.event_url ?? "";

    setState(() {
      organizedAlone = challenge.organized_alone ?? false;
    });
  }

  Widget getForm() {
    OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: ThemeColors.primaryColor),
      borderRadius: BorderRadius.circular(5),
    );

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                hintText: "Renginio pavadinimas *",
                border: border,
                disabledBorder: border,
                enabledBorder: border,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              autocorrect: false,
              controller: nameController,
              textInputAction: TextInputAction.done,
              obscureText: false,
              maxLines: 1,
            )),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                hintText: "Aprašymas *",
                border: border,
                disabledBorder: border,
                enabledBorder: border,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              autocorrect: false,
              controller: descriptionController,
              textInputAction: TextInputAction.done,
              obscureText: false,
              maxLines: 4,
            )),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextFormField(
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                hintText: "Renginio nuoroda",
                border: border,
                disabledBorder: border,
                enabledBorder: border,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              autocorrect: false,
              controller: urlController,
              textInputAction: TextInputAction.done,
              obscureText: false,
              maxLines: 1,
            )),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Text("Organizuoju vienas",
                    style: Theme.of(context).textTheme.button),
                Switch(
                  value: organizedAlone,
                  onChanged: (value) {
                    setState(() {
                      organizedAlone = value;
                    });
                  },
                )
              ],
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
    if (nameController.text == "" || descriptionController.text == "") {
      await showMessage(context, "Klaida", "Laukai yra privalomi");
      return;
    }

    JoinedChallengesRepository joinedChallengesRepository =
        JoinedChallengesRepository(dioClient: DioClient());

    List<MapEntry<String, Object>> bodyParams =
        List<MapEntry<String, Object>>.empty(growable: true);

    bodyParams.add(MapEntry("description", descriptionController.text));
    bodyParams.add(MapEntry("event_url", urlController.text));
    bodyParams.add(MapEntry("event_name", nameController.text));
    bodyParams.add(MapEntry("organized_alone", organizedAlone));

    var result = await joinedChallengesRepository.completeChallenge(
        uuid: uuid,
        challengeType: Api().getChallengeTypeSubPath(Api.challengeTypeEventOrg),
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

    bodyParams.add(MapEntry("description", descriptionController.text));
    bodyParams.add(MapEntry("event_url", urlController.text));
    bodyParams.add(MapEntry("event_name", nameController.text));
    bodyParams.add(MapEntry("organized_alone", organizedAlone));

    var result = await joinedChallengesRepository.completeChallenge(
        uuid: uuid,
        challengeType: Api().getChallengeTypeSubPath(Api.challengeTypeEventOrg),
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
