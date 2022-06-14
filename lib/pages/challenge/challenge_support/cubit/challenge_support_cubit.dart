import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_support_state.dart';

class ChallengeSupportCubit extends Cubit<ChallengeSupportState> {
  final ChallengesSupportRepository challengesTypeRepository;
  ChallengeSupportCubit({required this.challengesTypeRepository})
      : super(ChallengeSupportInitial());

  void fetchChallenge({required String uuid}) {
    Timer(Duration(seconds: 1), () {
      challengesTypeRepository
          .fetchChallenge(uuid: uuid)
          .then((challengeTypeItem) {
        emit(ChallengeSupportLoaded(challengeTypeItem: challengeTypeItem));
      });
    });
  }

  Future<ChallengeSupport> fetchJoinedChallenge({required String uuid}) async {
    var joinedChallenge =
        await challengesTypeRepository.fetchJoinedChallenge(uuid: uuid);

    return joinedChallenge;
  }
}
