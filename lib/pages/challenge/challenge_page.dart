import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/navigation/route_arguments/single_challenge_arguments.dart';
import 'package:rainbow_challenge/pages/challenge/cubit/join_challenge_cubit.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_class.dart';
import 'package:rainbow_challenge/utils/repository/joined_challenges/joined_challenges_repository.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChallengePage extends StatelessWidget {
  ChallengePage({Key? key, required this.challengeInfo}) : super(key: key);
  final Challenge challengeInfo;

  @override
  Widget build(BuildContext context) {
    JoinedChallengesRepository joinedChallengesRepository =
        JoinedChallengesRepository(dioClient: DioClient());
    return BlocProvider(
      create: (_) => JoinChallengeCubit(
          joinedChallengesRepository: joinedChallengesRepository),
      child: _Page(challengeInfo: challengeInfo),
    );
  }
}

class _Page extends StatelessWidget {
  _Page({Key? key, required this.challengeInfo}) : super(key: key);
  final Challenge challengeInfo;

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
        mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(children: [
              ChallengeHeadlineWidget(
                title: challengeInfo.name,
                points: challengeInfo.points,
              ),
              ChallengeDescriptionWidget(
                  description: challengeInfo.description),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: _joinChallengeButtonAction(context,
                    actionText:
                        AppLocalizations.of(context)!.action_join_challenge,
                    challengeType: challengeInfo.type,
                    uuid: challengeInfo.uuid,
                    type_uuid: challengeInfo.concrete_challenge_uuid),
              )
            ])));
  }

  ElevatedButton _joinChallengeButtonAction(context,
      {required String actionText,
      required String challengeType,
      required String uuid,
      required String type_uuid}) {
    return ElevatedButton(
      onPressed: () {
        Api api = Api();
        BlocProvider.of<JoinChallengeCubit>(context)
            .joinChallenge(api.getChallengeTypeSubPath(challengeType), uuid);
        Navigator.pushReplacementNamed(
            context, api.getChallengeTypeRoute(challengeType),
            arguments: SingleChallengePageArguments(uuid: type_uuid));
      },
      child: BlocBuilder<JoinChallengeCubit, JoinChallengeState>(
        builder: (context, state) {
          Api api = Api();
          if (state is JoinChallengeAdding) return CircularProgressIndicator();
          return Text(
            actionText,
            style: TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }
}
