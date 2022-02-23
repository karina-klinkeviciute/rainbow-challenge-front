import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/widgets/file_upload_widget.dart';
import 'cubit/challenge_custom_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

// Single challenge page of type Event Participant.
part 'part_info.dart';

class ChallengeCustomPage extends StatelessWidget {
  ChallengeCustomPage({Key? key, required this.type_uuid, required this.uuid})
      : super(key: key);
  final String type_uuid;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChallengeCustomCubit>(context)
        .fetchChallenge(uuid: type_uuid);
    return WrapperMainWidget(
        mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                _challengeInfo,
                _challengeForm,
                Container(
                  height: 24,
                ),
                new FileUploadWidget(
                    uuid: uuid, challenge_type: Api.challengeTypeCustom)
              ],
            )));
  }

  Widget _challengeForm = ElevatedButton(
      onPressed: () {},
      // child: Text(AppLocalizations.of(context)!.action_join_challenge),
      child: Text('To be added here'));
}
