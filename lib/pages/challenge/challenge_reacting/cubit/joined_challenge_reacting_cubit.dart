import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joined_challenge_reacting_state.dart';

class JoinedChallengeReactingCubit extends Cubit<JoinedChallengeReactingState> {
  JoinedChallengeReactingCubit() : super(JoinedChallengeReactingInitial());
}
