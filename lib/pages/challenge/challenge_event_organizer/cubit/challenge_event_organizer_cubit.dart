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

  Future<ChallengeEventOrganizer> fetchChallenge(
      {required String uuid, required String type_uuid}) async {
    var challenge =
        await challengesTypeRepository.fetchChallenge(uuid: type_uuid);

    var joinedChallenge =
        await challengesTypeRepository.fetchJoinedChallenge(uuid: uuid);

    emit(ChallengeEventOrganizerLoaded(challengeTypeItem: challenge));

    return joinedChallenge;
  }
}
