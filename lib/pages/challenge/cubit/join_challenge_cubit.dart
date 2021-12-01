import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';
import 'dart:async';
part 'join_challenge_state.dart';

class JoinChallengeCubit extends Cubit<JoinChallengeState> {
  JoinedChallengesRepository joinedChallengesRepository;
  JoinChallengeCubit({required this.joinedChallengesRepository})
      : super(JoinChallengeInitial());

  void joinChallenge(String challengeType, String uuid) {
    Timer(Duration(seconds: 2), () {
      joinedChallengesRepository
          .joinChallenge(challengeType: challengeType, uuid: uuid)
          .then((joinedChallenge) {
        emit(JoinChallengeAdded());
      });
    });
  }
}
