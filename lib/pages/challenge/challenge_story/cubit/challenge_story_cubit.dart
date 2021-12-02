import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_story_state.dart';

class ChallengeStoryCubit extends Cubit<ChallengeStoryState> {
  final ChallengesStoryRepository challengesTypeRepository;
  ChallengeStoryCubit({required this.challengesTypeRepository})
      : super(ChallengeStoryInitial());

  void fetchChallenge({required String uuid}) {
    Timer(Duration(seconds: 1), () {
      challengesTypeRepository
          .fetchChallenge(uuid: uuid)
          .then((challengeTypeItem) {
        emit(ChallengeStoryLoaded(challengeTypeItem: challengeTypeItem));
      });
    });
  }
}
