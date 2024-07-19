import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_reacting_state.dart';

class ChallengeReactingCubit extends Cubit<ChallengeReactingState> {
  final ChallengesReactingRepository challengesTypeRepository;
  ChallengeReactingCubit({required this.challengesTypeRepository})
      : super(ChallengeReactingInitial());

  Future<ChallengeReacting> fetchChallenge(
      {required String uuid, required String type_uuid}) async {
    var challenge =
        await challengesTypeRepository.fetchChallenge(uuid: type_uuid);

    emit(ChallengeReactingLoaded(challengeTypeItem: challenge));

    var joinedChallenge =
        await challengesTypeRepository.fetchJoinedChallenge(uuid: uuid);

    return joinedChallenge;
  }
}
