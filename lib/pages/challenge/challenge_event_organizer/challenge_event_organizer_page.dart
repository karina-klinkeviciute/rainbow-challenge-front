import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/challenge_event_organizer_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Single challenge page of type Event Participant.
part 'part_info.dart';

class ChallengeEventOrganizerPage extends StatelessWidget {
  ChallengeEventOrganizerPage({Key? key, required this.uuid}) : super(key: key);
  final String uuid;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChallengeEventOrganizerCubit>(context)
        .fetchChallenge(uuid: uuid);
    return WrapperMainWidget(
        mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                _challengeInfo,
                _challengeForm,
              ],
            )));
  }

  Widget _challengeForm = ElevatedButton(
      onPressed: () {},
      // child: Text(AppLocalizations.of(context)!.action_join_challenge),
      child: Text('To be added here'));
}
