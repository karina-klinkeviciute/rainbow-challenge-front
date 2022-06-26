import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/utils/model/quiz/quiz_page.dart';
import 'package:rainbow_challenge/widgets/file_upload_widget.dart';
import 'cubit/challenge_quiz_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Single challenge page of type Event Participant.
part 'part_info.dart';

class ChallengeQuizPage extends StatefulWidget {
  ChallengeQuizPage({Key? key, required this.type_uuid, required this.uuid})
      : super(key: key);
  final String type_uuid;
  final String uuid;

  @override
  State<ChallengeQuizPage> createState() =>
      _ChallengeQuizPageState(type_uuid: type_uuid, uuid: uuid);
}

class _ChallengeQuizPageState extends State<ChallengeQuizPage> {
  final String type_uuid;
  final String uuid;

  _ChallengeQuizPageState({required this.type_uuid, required this.uuid});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChallengeQuizCubit>(context)
        .fetchChallenge(uuid: widget.type_uuid);
    return WrapperMainWidget(
        mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                ChallengeInfo(uuid: widget.uuid),
                // _challengeForm,
                // Container(
                //   height: 24,
                // ),
                // new FileUploadWidget(
                //     uuid: uuid, challenge_type: Api.challengeTypeQuiz)
              ],
            )));
  }

  Widget _challengeForm = ElevatedButton(
      onPressed: () {},
      // child: Text(AppLocalizations.of(context)!.action_join_challenge),
      child: Text('To be added here'));
}
