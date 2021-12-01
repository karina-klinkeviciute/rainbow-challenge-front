import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_reacting_state.dart';

class ChallengeReactingCubit extends Cubit<ChallengeReactingState> {
  final ChallengesReactingRepository challengesTypeRepository;
  ChallengeReactingCubit({required this.challengesTypeRepository})
      : super(ChallengeReactingInitial());

  void fetchChallenge({required String uuid}) {
    Timer(Duration(seconds: 1), () {
      challengesTypeRepository
          .fetchChallenge(uuid: uuid)
          .then((challengeTypeItem) {
        emit(ChallengeReactingLoaded(challengeTypeItem: challengeTypeItem));
      });
    });
  }
}
