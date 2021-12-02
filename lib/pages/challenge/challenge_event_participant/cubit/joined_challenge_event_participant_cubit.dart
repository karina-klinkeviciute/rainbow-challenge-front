import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joined_challenge_event_participant_state.dart';

class JoinedChallengeEventParticipantCubit extends Cubit<JoinedChallengeEventParticipantState> {
  JoinedChallengeEventParticipantCubit() : super(JoinedChallengeEventParticipantInitial());
}
