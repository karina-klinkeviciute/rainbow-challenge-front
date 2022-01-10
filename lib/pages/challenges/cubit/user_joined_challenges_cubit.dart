import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

class UserJoinedChallengesCubit extends Cubit<UserJoinedChallengesState> {
  final UserJoinedChallengesRepository userJoinedChallengesRepository;
  UserJoinedChallengesCubit({required this.userJoinedChallengesRepository})
      : super(UserJoinedChallengesInitial());

  void fetchChallenges() {
    Timer(Duration(seconds: 1), () {
      userJoinedChallengesRepository
          .fetchChallenges()
          .then((userJoinedChallengesList) {
        emit(UserJoinedChallengesLoaded(
            userJoinedChallengesList: userJoinedChallengesList));
      });
    });
  }
}

abstract class UserJoinedChallengesState extends Equatable {
  const UserJoinedChallengesState();

  @override
  List<Object> get props => [];
}

class UserJoinedChallengesInitial extends UserJoinedChallengesState {}

class UserJoinedChallengesLoaded extends UserJoinedChallengesState {
  final List<UserJoinedChallenge> userJoinedChallengesList;
  UserJoinedChallengesLoaded({required this.userJoinedChallengesList});
}
