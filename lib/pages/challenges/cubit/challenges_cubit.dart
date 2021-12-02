import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
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
}
