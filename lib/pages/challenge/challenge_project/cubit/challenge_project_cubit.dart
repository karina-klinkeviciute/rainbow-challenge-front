import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_project_state.dart';

class ChallengeProjectCubit extends Cubit<ChallengeProjectState> {
  final ChallengesProjectRepository challengesTypeRepository;
  ChallengeProjectCubit({required this.challengesTypeRepository})
      : super(ChallengeProjectInitial());

  Future<ChallengeProject> fetchChallenge(
      {required String uuid, required String type_uuid}) async {
    var challenge =
        await challengesTypeRepository.fetchChallenge(uuid: type_uuid);
    var joinedChallenge =
        await challengesTypeRepository.fetchJoinedChallenge(uuid: uuid);
    emit(ChallengeProjectLoaded(challengeTypeItem: challenge));

    return joinedChallenge;
  }
}
