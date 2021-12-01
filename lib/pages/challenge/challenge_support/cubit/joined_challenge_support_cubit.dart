import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joined_challenge_support_state.dart';

class JoinedChallengeSupportCubit extends Cubit<JoinedChallengeSupportState> {
  JoinedChallengeSupportCubit() : super(JoinedChallengeSupportInitial());
}
