import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joined_challenge_custom_state.dart';

class JoinedChallengeCustomCubit extends Cubit<JoinedChallengeCustomState> {
  JoinedChallengeCustomCubit() : super(JoinedChallengeCustomInitial());
}
