import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_custom_state.dart';

class ChallengeCustomCubit extends Cubit<ChallengeCustomState> {
  final ChallengesCustomRepository challengesTypeRepository;
  ChallengeCustomCubit({required this.challengesTypeRepository})
      : super(ChallengeCustomInitial());

  Future<ChallengeCustom> fetchChallenge({required String uuid}) async {
    var result = await challengesTypeRepository.fetchChallenge(uuid: uuid);
    emit(ChallengeCustomLoaded(challengeTypeItem: result));
    return result;
  }
}
