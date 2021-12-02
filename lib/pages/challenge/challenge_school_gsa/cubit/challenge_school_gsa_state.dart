part of 'challenge_school_gsa_cubit.dart';

abstract class ChallengeSchoolGsaState extends Equatable {
  const ChallengeSchoolGsaState();

  @override
  List<Object> get props => [];
}

class ChallengeSchoolGsaInitial extends ChallengeSchoolGsaState {}

class ChallengeSchoolGsaLoaded extends ChallengeSchoolGsaState {
  final ChallengeSchoolGsa challengeTypeItem;
  ChallengeSchoolGsaLoaded({required this.challengeTypeItem});
}
