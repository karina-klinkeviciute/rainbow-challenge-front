import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_story_state.dart';

class ChallengeStoryCubit extends Cubit<ChallengeStoryState> {
  final ChallengesStoryRepository challengesTypeRepository;
  ChallengeStoryCubit({required this.challengesTypeRepository})
      : super(ChallengeStoryInitial());

  Future<ChallengeStory> fetchChallenge(
      {required String uuid, required String type_uuid}) async {
    var challenge =
        await challengesTypeRepository.fetchChallenge(uuid: type_uuid);
    var joinedChallenge =
        await challengesTypeRepository.fetchJoinedChallenge(uuid: uuid);

    emit(ChallengeStoryLoaded(challengeTypeItem: challenge));
    return joinedChallenge;
  }
}
