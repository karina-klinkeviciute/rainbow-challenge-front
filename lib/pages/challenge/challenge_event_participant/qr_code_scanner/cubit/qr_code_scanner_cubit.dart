import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/repository/joined_challenges/joined_challenges_event_participant_repository.dart';

part 'qr_code_scanner_state.dart';

class QrCodeScannerCubit extends Cubit<QrCodeScannerState> {
  final JoinedChallengesEventParticipantRepository challengeRepository;
  QrCodeScannerCubit({required this.challengeRepository})
      : super(QrCodeScannerInitial());
}
