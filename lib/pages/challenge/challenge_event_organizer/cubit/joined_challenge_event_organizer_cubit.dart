import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joined_challenge_event_organizer_state.dart';

class JoinedChallengeEventOrganizerCubit
    extends Cubit<JoinedChallengeEventOrganizerState> {
  JoinedChallengeEventOrganizerCubit()
      : super(JoinedChallengeEventOrganizerInitial());
}
