import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joined_challenge_quiz_state.dart';

class JoinedChallengeQuizCubit extends Cubit<JoinedChallengeQuizState> {
  JoinedChallengeQuizCubit() : super(JoinedChallengeQuizInitial());
}
