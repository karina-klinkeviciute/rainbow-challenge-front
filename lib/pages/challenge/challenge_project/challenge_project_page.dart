import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/repository/joined_challenges/joined_challenges_repository.dart';
import 'package:rainbow_challenge/widgets/file_upload_widget.dart';
import 'cubit/challenge_project_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Single challenge page of type Event Participant.
part 'part_info.dart';

class ChallengeProjectPage extends StatefulWidget {
  ChallengeProjectPage({Key? key, required this.type_uuid, required this.uuid})
      : super(key: key);
  final String type_uuid;
  final String uuid;

  @override
  State<ChallengeProjectPage> createState() =>
      _ChallengeProjectPageState(type_uuid: type_uuid, uuid: uuid);
}

class _ChallengeProjectPageState extends State<ChallengeProjectPage> {
  _ChallengeProjectPageState({required this.type_uuid, required this.uuid});
  final String type_uuid;
  final String uuid;

  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  bool implementedAlone = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
        useAppBar: false,
        index: 2,
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
                    uuid: uuid, challenge_type: Api.challengeTypeProject)
              ],
            )));
  }

  Future<void> loadData() async {
    var challenge = await BlocProvider.of<ChallengeProjectCubit>(context)
        .fetchChallenge(uuid: uuid, type_uuid: type_uuid);

    descriptionController.text = challenge.description ?? "";
    nameController.text = challenge.project_name ?? "";
    urlController.text = challenge.project_url ?? "";

    setState(() {
      implementedAlone = challenge.implemented_alone ?? false;
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
                hintText: AppLocalizations.of(context)!.challenge_project_name_hint_text,
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
                hintText: AppLocalizations.of(context)!.challenge_project_description_hint_text,
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
                hintText: AppLocalizations.of(context)!.challenge_project_link_hint_text,
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
                Text(AppLocalizations.of(context)!.challenge_project_completed_alone,
                    style: Theme.of(context).textTheme.button),
                Switch(
                  value: implementedAlone,
                  onChanged: (value) {
                    setState(() {
                      implementedAlone = value;
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
                  AppLocalizations.of(context)!.challenge_save_and_submit_later,
                  style: TextStyle(color: Colors.white),
                ))),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: () {
                  completeAction(context);
                },
                child: Text(
                  AppLocalizations.of(context)!.action_submit,
                  style: TextStyle(color: Colors.white),
                )))
      ],
    );
  }

  completeAction(BuildContext context) async {
    if (nameController.text == "" || descriptionController.text == "") {
      await showMessage(context, AppLocalizations.of(context)!.error, AppLocalizations.of(context)!.message_fields_are_required);
      return;
    }

    JoinedChallengesRepository joinedChallengesRepository =
        JoinedChallengesRepository(dioClient: DioClient());

    List<MapEntry<String, Object>> bodyParams =
        List<MapEntry<String, Object>>.empty(growable: true);

    bodyParams.add(MapEntry("description", descriptionController.text));
    bodyParams.add(MapEntry("project_url", urlController.text));
    bodyParams.add(MapEntry("project_name", nameController.text));
    bodyParams.add(MapEntry("implemented_alone", implementedAlone));

    var result = await joinedChallengesRepository.completeChallenge(
        uuid: uuid,
        challengeType: Api().getChallengeTypeSubPath(Api.challengeTypeProject),
        status: "completed",
        bodyParams: bodyParams);

    if (result != null &&
        result["main_joined_challenge"] != null &&
        (result["main_joined_challenge"] as Map<String, dynamic>)["status"] ==
            "completed") {
      await showMessage(context, AppLocalizations.of(context)!.message_thank_you,
          AppLocalizations.of(context)!.message_challenge_completed_volunteer_will_take_a_look);
      Navigator.of(context).pop();
      return;
    }

    if (result != null &&
        result["main_joined_challenge"] != null &&
        (result["main_joined_challenge"] as Map<String, dynamic>)["status"] ==
            "confirmed") {
      await showMessage(context, AppLocalizations.of(context)!.message_thank_you,
          AppLocalizations.of(context)!.message_challenge_completed_rainbows_issued);
      Navigator.of(context).pop();
      return;
    }

    if (result != null && result["error"] != null) {
      await showMessage(context, AppLocalizations.of(context)!.error, result["error"]);
      return;
    }

    await showMessage(
        context, AppLocalizations.of(context)!.error, AppLocalizations.of(context)!.error_unknown_error);
  }

  saveAction(BuildContext context) async {
    JoinedChallengesRepository joinedChallengesRepository =
        JoinedChallengesRepository(dioClient: DioClient());

    List<MapEntry<String, Object>> bodyParams =
        List<MapEntry<String, Object>>.empty(growable: true);

    bodyParams.add(MapEntry("description", descriptionController.text));
    bodyParams.add(MapEntry("project_url", urlController.text));
    bodyParams.add(MapEntry("project_name", nameController.text));
    bodyParams.add(MapEntry("implemented_alone", implementedAlone));

    var result = await joinedChallengesRepository.completeChallenge(
        uuid: uuid,
        challengeType: Api().getChallengeTypeSubPath(Api.challengeTypeProject),
        status: "joined",
        bodyParams: bodyParams);

    if (result != null &&
        result["main_joined_challenge"] != null &&
        (result["main_joined_challenge"] as Map<String, dynamic>)["status"] ==
            "joined") {
      await showMessage(context, AppLocalizations.of(context)!.message_thank_you, AppLocalizations.of(context)!.message_changes_where_saved");
      Navigator.of(context).pop();
      return;
    }

    if (result != null && result["error"] != null) {
      await showMessage(context, AppLocalizations.of(context)!.error, result["error"]);
      return;
    }

    await showMessage(
        context, AppLocalizations.of(context)!.error, AppLocalizations.of(context)!.error);
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
