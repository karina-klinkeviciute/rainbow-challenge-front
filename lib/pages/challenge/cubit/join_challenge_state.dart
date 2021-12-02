part of 'join_challenge_cubit.dart';

abstract class JoinChallengeState extends Equatable {
  const JoinChallengeState();

  @override
  List<Object> get props => [];
}

class JoinChallengeInitial extends JoinChallengeState {}

class JoinChallengeAdding extends JoinChallengeState {}

class JoinChallengeAdded extends JoinChallengeState {}
