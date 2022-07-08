part of 'challenges_cubit.dart';

abstract class ChallengesState extends Equatable {
  const ChallengesState();

  @override
  List<Object> get props => [];
}

class ChallengesInitial extends ChallengesState {}

class ChallengesLoaded extends ChallengesState {
  final List<Challenge> challengesList;
  ChallengesLoaded({required this.challengesList});
}

class JoinedChallengesLoaded extends ChallengesState {
  final List<JoinedChallenges> joinedChallengesList;
  JoinedChallengesLoaded({required this.joinedChallengesList});
}

class CompletedChallengesLoaded extends ChallengesState {
  final List<JoinedChallenges> completedChallengesList;
  CompletedChallengesLoaded({required this.completedChallengesList});
}
