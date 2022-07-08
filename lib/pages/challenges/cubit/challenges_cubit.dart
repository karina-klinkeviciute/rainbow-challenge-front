import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/challenge/joined_challenge_class.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenges_state.dart';

class ChallengesCubit extends Cubit<ChallengesState> {
  final ChallengesRepository challengesRepository;
  ChallengesCubit({required this.challengesRepository})
      : super(ChallengesInitial());

  void fetchChallenges() {
    Timer(Duration(seconds: 1), () {
      challengesRepository.fetchChallenges().then((challengesList) {
        emit(ChallengesLoaded(challengesList: challengesList));
      });
    });
  }

  void fetchJoinedChallenges() {
    Timer(Duration(seconds: 1), () {
      challengesRepository.fetchJoinedChallenges().then((joinedChallengesList) {
        emit(
            JoinedChallengesLoaded(joinedChallengesList: joinedChallengesList));
      });
    });
  }

  void fetchCompletedChallenges() {
    Timer(Duration(seconds: 1), () {
      challengesRepository
          .fetchCompletedChallenges()
          .then((completedChallengesList) {
        emit(CompletedChallengesLoaded(
            completedChallengesList: completedChallengesList));
      });
    });
  }
}
