part of 'challenge_custom_cubit.dart';

abstract class ChallengeCustomState extends Equatable {
  const ChallengeCustomState();

  @override
  List<Object> get props => [];
}

class ChallengeCustomInitial extends ChallengeCustomState {}

class ChallengeCustomLoaded extends ChallengeCustomState {
  final ChallengeCustom challengeTypeItem;
  ChallengeCustomLoaded({required this.challengeTypeItem});
}
