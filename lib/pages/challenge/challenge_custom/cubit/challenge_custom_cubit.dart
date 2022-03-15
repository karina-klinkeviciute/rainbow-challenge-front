import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_custom_state.dart';

class ChallengeCustomCubit extends Cubit<ChallengeCustomState> {
  final ChallengesCustomRepository challengesTypeRepository;
  ChallengeCustomCubit({required this.challengesTypeRepository})
      : super(ChallengeCustomInitial());

  Future<ChallengeCustom> fetchChallenge(
      {required String uuid, required String type_uuid}) async {
    var challenge =
        await challengesTypeRepository.fetchChallenge(uuid: type_uuid);
    var joinedChallenge =
        await challengesTypeRepository.fetchJoinedChallenge(uuid: uuid);

    emit(ChallengeCustomLoaded(challengeTypeItem: challenge));
    return joinedChallenge;
  }
}
