import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_article_state.dart';

class ChallengeArticleCubit extends Cubit<ChallengeArticleState> {
  final ChallengesArticleRepository challengesTypeRepository;
  ChallengeArticleCubit({required this.challengesTypeRepository})
      : super(ChallengeArticleInitial());

  Future<ChallengeArticle> fetchChallenge(
      {required String type_uuid, required String uuid}) async {
    var challenge =
        await challengesTypeRepository.fetchChallenge(uuid: type_uuid);
    var joinedChallenge =
        await challengesTypeRepository.fetchJoinedChallenge(uuid: uuid);

    emit(ChallengeArticleLoaded(
        challengeTypeItem: challenge, challenge: joinedChallenge));
    return joinedChallenge;
  }
}
