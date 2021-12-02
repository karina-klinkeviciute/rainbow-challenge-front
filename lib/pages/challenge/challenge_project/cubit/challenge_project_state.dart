part of 'challenge_project_cubit.dart';

abstract class ChallengeProjectState extends Equatable {
  const ChallengeProjectState();

  @override
  List<Object> get props => [];
}

class ChallengeProjectInitial extends ChallengeProjectState {}

class ChallengeProjectLoaded extends ChallengeProjectState {
  final ChallengeProject challengeTypeItem;
  ChallengeProjectLoaded({required this.challengeTypeItem});
}
