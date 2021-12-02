import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joined_challenge_project_state.dart';

class JoinedChallengeProjectCubit extends Cubit<JoinedChallengeProjectState> {
  JoinedChallengeProjectCubit() : super(JoinedChallengeProjectInitial());
}
