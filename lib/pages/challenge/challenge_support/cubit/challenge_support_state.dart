part of 'challenge_support_cubit.dart';

abstract class ChallengeSupportState extends Equatable {
  const ChallengeSupportState();

  @override
  List<Object> get props => [];
}

class ChallengeSupportInitial extends ChallengeSupportState {}

class ChallengeSupportLoaded extends ChallengeSupportState {
  final ChallengeSupport challengeTypeItem;
  ChallengeSupportLoaded({required this.challengeTypeItem});
}
