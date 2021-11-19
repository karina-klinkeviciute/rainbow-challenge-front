import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'challenge_event_participant_state.dart';

class ChallengeEventParticipantCubit extends Cubit<ChallengeEventParticipantState> {
  ChallengeEventParticipantCubit() : super(ChallengeEventParticipantInitial());
}
