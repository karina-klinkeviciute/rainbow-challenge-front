import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'challenge_state.dart';

class ChallengeCubit extends Cubit<ChallengeState> {
  ChallengeCubit() : super(ChallengeInitial());
}
