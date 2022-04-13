import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_quiz_state.dart';

class ChallengeQuizCubit extends Cubit<ChallengeQuizState> {
  final ChallengesQuizRepository challengesTypeRepository;
  ChallengeQuizCubit({required this.challengesTypeRepository}) : super(ChallengeQuizInitial());

  Future<ChallengeQuiz> fetchChallenge({required String uuid}) async {
    print('start');
    var challengeTypeItem = await challengesTypeRepository.fetchChallenge(uuid: uuid);
    print('printing is $challengeTypeItem');
    emit(ChallengeQuizLoaded(challengeTypeItem: challengeTypeItem));
    //print('return');
    return challengeTypeItem;
  }
}
