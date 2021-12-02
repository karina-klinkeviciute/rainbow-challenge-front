import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_event_participant/challenge_event_participant_page.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_event_participant/challenge_event_participant_class.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_event_participant_state.dart';

class ChallengeEventParticipantCubit
    extends Cubit<ChallengeEventParticipantState> {
  final ChallengesEventParticipantRepository challengesTypeRepository;
  ChallengeEventParticipantCubit({required this.challengesTypeRepository})
      : super(ChallengeEventParticipantInitial());

  void fetchChallenge({required String uuid}) {
    Timer(Duration(seconds: 1), () {
      challengesTypeRepository
          .fetchChallenge(uuid: uuid)
          .then((challengeTypeItem) {
        emit(ChallengeEventParticipantLoaded(
            challengeTypeItem: challengeTypeItem));
      });
    });
  }
}
