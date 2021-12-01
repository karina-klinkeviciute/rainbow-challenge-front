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

  void fetchChallenge({required String uuid}) {
    Timer(Duration(seconds: 1), () {
      challengesTypeRepository
          .fetchChallenge(uuid: uuid)
          .then((challengeTypeItem) {
        emit(ChallengeProjectLoaded(challengeTypeItem: challengeTypeItem));
      });
    });
  }
}
