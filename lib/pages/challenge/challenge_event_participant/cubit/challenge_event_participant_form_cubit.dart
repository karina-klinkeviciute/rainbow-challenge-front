import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'challenge_event_participant_form_state.dart';

class ChallengeEventParticipantFormCubit extends Cubit<ChallengeEventParticipantFormState> {
  ChallengeEventParticipantFormCubit() : super(ChallengeEventParticipantFormInitial());
}
