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

  void fetchChallenge({required String uuid}) {
    Timer(Duration(seconds: 1), () {
      challengesTypeRepository
          .fetchChallenge(uuid: uuid)
          .then((challengeTypeItem) {
        emit(ChallengeArticleLoaded(challengeTypeItem: challengeTypeItem));
      });
    });
  }
}
