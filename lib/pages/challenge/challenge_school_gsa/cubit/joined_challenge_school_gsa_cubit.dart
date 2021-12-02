import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joined_challenge_school_gsa_state.dart';

class JoinedChallengeSchoolGsaCubit
    extends Cubit<JoinedChallengeSchoolGsaState> {
  JoinedChallengeSchoolGsaCubit() : super(JoinedChallengeSchoolGsaInitial());
}
