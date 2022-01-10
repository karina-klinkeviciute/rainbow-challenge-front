import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

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

abstract class ChallengesState extends Equatable {
  const ChallengesState();

  @override
  List<Object> get props => [];
}

class ChallengesInitial extends ChallengesState {}

class ChallengesLoaded extends ChallengesState {
  final List<Challenge> challengesList;
  ChallengesLoaded({required this.challengesList});
}
