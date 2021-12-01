part of 'challenge_reacting_cubit.dart';

abstract class ChallengeReactingState extends Equatable {
  const ChallengeReactingState();

  @override
  List<Object> get props => [];
}

class ChallengeReactingInitial extends ChallengeReactingState {}

class ChallengeReactingLoaded extends ChallengeReactingState {
  final ChallengeReacting challengeTypeItem;
  ChallengeReactingLoaded({required this.challengeTypeItem});
}
