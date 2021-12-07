import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'qr_code_scanner/qr_code_scanner_page.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'cubit/challenge_event_participant_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Single challenge page of type Event Participant.
part 'part_info.dart';

class ChallengeEventParticipantPage extends StatelessWidget {
  ChallengeEventParticipantPage({Key? key, required this.uuid})
      : super(key: key);
  final String uuid;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChallengeEventParticipantCubit>(context)
        .fetchChallenge(uuid: uuid);

    return WrapperMainWidget(
        mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                _challengeInfo,
                _challengeFormMain(context, uuid),
              ],
            )));
  }

  // Add an alternative way of complete the challenge
  Widget _challengeFormExtra(context) {
    return Form(
      child: Column(
        children: [
          TextFormField(),
          TextFormField(),
        ],
      ),
    );
  }
}
