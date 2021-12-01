part of 'challenge_story_cubit.dart';

abstract class ChallengeStoryState extends Equatable {
  const ChallengeStoryState();

  @override
  List<Object> get props => [];
}

class ChallengeStoryInitial extends ChallengeStoryState {}

class ChallengeStoryLoaded extends ChallengeStoryState {
  final ChallengeStory challengeTypeItem;
  ChallengeStoryLoaded({required this.challengeTypeItem});
}
