import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/joined_challenge/joined_challenge_class.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';
import 'dart:async';
part 'join_challenge_state.dart';

class JoinChallengeCubit extends Cubit<JoinChallengeState> {
  JoinedChallengesRepository joinedChallengesRepository;
  JoinChallengeCubit({required this.joinedChallengesRepository})
      : super(JoinChallengeInitial());

  Future<JoinedChallenge?> joinChallenge(
      String challengeType, String uuid) async {
    var joinedChallenge = await joinedChallengesRepository.joinChallenge(
        challengeType: challengeType, uuid: uuid);

    emit(JoinChallengeAdded());
    return joinedChallenge;
  }
}
