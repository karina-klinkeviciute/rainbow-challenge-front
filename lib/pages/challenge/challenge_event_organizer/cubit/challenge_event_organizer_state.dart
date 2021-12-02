part of 'challenge_event_organizer_cubit.dart';

abstract class ChallengeEventOrganizerState extends Equatable {
  const ChallengeEventOrganizerState();

  @override
  List<Object> get props => [];
}

class ChallengeEventOrganizerInitial extends ChallengeEventOrganizerState {}

class ChallengeEventOrganizerLoaded extends ChallengeEventOrganizerState {
  final ChallengeEventOrganizer challengeTypeItem;
  ChallengeEventOrganizerLoaded({required this.challengeTypeItem});
}
