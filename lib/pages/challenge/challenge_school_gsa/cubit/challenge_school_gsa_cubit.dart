import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_school_gsa_state.dart';

class ChallengeSchoolGsaCubit extends Cubit<ChallengeSchoolGsaState> {
  final ChallengesSchoolGsaRepository challengesTypeRepository;
  ChallengeSchoolGsaCubit({required this.challengesTypeRepository})
      : super(ChallengeSchoolGsaInitial());

  void fetchChallenge({required String uuid}) {
    Timer(Duration(seconds: 1), () {
      challengesTypeRepository
          .fetchChallenge(uuid: uuid)
          .then((challengeTypeItem) {
        emit(ChallengeSchoolGsaLoaded(challengeTypeItem: challengeTypeItem));
      });
    });
  }
}
