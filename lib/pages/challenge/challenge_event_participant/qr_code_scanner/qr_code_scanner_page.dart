import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_event_participant/qr_code_scanner/cubit/qr_code_scanner_cubit.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class QrCodeScannerPage extends StatelessWidget {
  QrCodeScannerPage({Key? key, required this.uuid}) : super(key: key);
  String uuid;

  @override
  Widget build(BuildContext context) {
    JoinedChallengesEventParticipantRepository repository =
        JoinedChallengesEventParticipantRepository(dioClient: DioClient());
    return BlocProvider(
      create: (_) => QrCodeScannerCubit(challengeRepository: repository),
      child: _Page(uuid: uuid),
    );
  }
}

class _Page extends StatelessWidget {
  _Page({Key? key, required this.uuid}) : super(key: key);
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
        mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Container()));
  }
}

// Next: How do I get a joined challenge type uuid? It's needed to post together
// With the qr code.

// Process: 
// Challenges page: concrete_challenge_uuid = challenge type uuid; 
// If I know challenge type uuid, how do I get joined challenge type uuid then?
// Do i need it at all for completing the challenge?

 //   BlocProvider.of<QrCodeScannerCubit>(context)
 //       .completeChallenge(uuid: uuid, ... );

// BlocBuilder 
// Form validation 
// completeChallenge() to API 