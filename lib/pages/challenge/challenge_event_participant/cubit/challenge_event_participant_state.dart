part of 'challenge_event_participant_cubit.dart';

abstract class ChallengeEventParticipantState extends Equatable {
  const ChallengeEventParticipantState();

  @override
  List<Object> get props => [];
}

class ChallengeEventParticipantInitial extends ChallengeEventParticipantState {}

class ChallengeEventParticipantLoaded extends ChallengeEventParticipantState {
  final ChallengeEventParticipant challengeTypeItem;
  ChallengeEventParticipantLoaded({required this.challengeTypeItem});
}
