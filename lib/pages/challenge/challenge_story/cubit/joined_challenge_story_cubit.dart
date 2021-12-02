import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joined_challenge_story_state.dart';

class JoinedChallengeStoryCubit extends Cubit<JoinedChallengeStoryState> {
  JoinedChallengeStoryCubit() : super(JoinedChallengeStoryInitial());
}
