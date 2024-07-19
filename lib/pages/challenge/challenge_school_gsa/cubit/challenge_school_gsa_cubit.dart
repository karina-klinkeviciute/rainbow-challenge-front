import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'challenge_school_gsa_state.dart';

class ChallengeSchoolGsaCubit extends Cubit<ChallengeSchoolGsaState> {
  final ChallengesSchoolGsaRepository challengesTypeRepository;
  ChallengeSchoolGsaCubit({required this.challengesTypeRepository})
      : super(ChallengeSchoolGsaInitial());

  Future<ChallengeSchoolGsa> fetchChallenge(
      {required String uuid, required String type_uuid}) async {
    var challenge =
        await challengesTypeRepository.fetchChallenge(uuid: type_uuid);

    emit(ChallengeSchoolGsaLoaded(challengeTypeItem: challenge));

    var joinedChallenge =
        await challengesTypeRepository.fetchJoinedChallenge(uuid: uuid);

    return joinedChallenge;
  }
}
