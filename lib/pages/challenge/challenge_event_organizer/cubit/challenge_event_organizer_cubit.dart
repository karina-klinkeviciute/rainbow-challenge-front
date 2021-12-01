import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_event_organizer_state.dart';

class ChallengeEventOrganizerCubit extends Cubit<ChallengeEventOrganizerState> {
  final ChallengesEventOrganizerRepository challengesTypeRepository;
  ChallengeEventOrganizerCubit({required this.challengesTypeRepository})
      : super(ChallengeEventOrganizerInitial());

  void fetchChallenge({required String uuid}) {
    Timer(Duration(seconds: 1), () {
      challengesTypeRepository
          .fetchChallenge(uuid: uuid)
          .then((challengeTypeItem) {
        emit(ChallengeEventOrganizerLoaded(
            challengeTypeItem: challengeTypeItem));
      });
    });
  }
}
