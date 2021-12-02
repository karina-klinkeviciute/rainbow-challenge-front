part of 'challenge_quiz_cubit.dart';

abstract class ChallengeQuizState extends Equatable {
  const ChallengeQuizState();

  @override
  List<Object> get props => [];
}

class ChallengeQuizInitial extends ChallengeQuizState {}

class ChallengeQuizLoaded extends ChallengeQuizState {
  final ChallengeQuiz challengeTypeItem;
  ChallengeQuizLoaded({required this.challengeTypeItem});
}
