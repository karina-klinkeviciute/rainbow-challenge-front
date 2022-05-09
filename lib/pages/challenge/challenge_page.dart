import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/navigation/route_arguments/single_challenge_arguments.dart';
import 'package:rainbow_challenge/pages/challenge/cubit/join_challenge_cubit.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_class.dart';
import 'package:rainbow_challenge/utils/repository/joined_challenges/joined_challenges_repository.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChallengePage extends StatelessWidget {
  ChallengePage({Key? key, required this.challengeInfo}) : super(key: key);
  final Challenge challengeInfo;

  @override
  Widget build(BuildContext context) {
    JoinedChallengesRepository joinedChallengesRepository = JoinedChallengesRepository(dioClient: DioClient());
    return BlocProvider(
      create: (_) => JoinChallengeCubit(joinedChallengesRepository: joinedChallengesRepository),
      child: _Page(challengeInfo: challengeInfo),
    );
  }
}

class _Page extends StatelessWidget {
  _Page({Key? key, required this.challengeInfo}) : super(key: key) {
    int i;
  }
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
              ChallengeDescriptionWidget(description: challengeInfo.description),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: _joinChallengeButtonAction(context,
                    actionText: AppLocalizations.of(context)!.action_join_challenge,
                    challengeType: challengeInfo.type,
                    uuid: challengeInfo.uuid,
                    type_uuid: challengeInfo!.concrete_challenge_uuid!),
              )
            ])));
  }

  Widget _joinChallengeButtonAction(context,
      {required String actionText, required String challengeType, required String uuid, required String type_uuid}) {
    if (challengeInfo.can_be_joined == false && challengeInfo.multiple == false && challengeInfo.is_joined == false) {
      return Text(AppLocalizations.of(context)!.challenge_completed_already, style: TextStyle(color: ThemeColors.secondaryColor));
    }

    if (challengeInfo.is_joined && challengeInfo.can_be_joined == false) {
      return ElevatedButton(
        onPressed: () async {
          Api api = Api();

          var concreteJoinedChallenge = challengeInfo.concrete_joined_challenges.first;

          Navigator.pushReplacementNamed(context, api.getChallengeTypeRoute(challengeType),
              arguments: SingleChallengePageArguments(type_uuid: type_uuid, uuid: concreteJoinedChallenge.uuid));
        },
        child: BlocBuilder<JoinChallengeCubit, JoinChallengeState>(
          builder: (context, state) {
            if (state is JoinChallengeAdding) return CircularProgressIndicator();
            return Text(
              AppLocalizations.of(context)!.challenge_continue_single,
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      );
    }

    if (challengeInfo.is_joined == false && challengeInfo.can_be_joined) {
      return ElevatedButton(
        onPressed: () async {
          Api api = Api();

          var joinedChallengeResponse =
              await BlocProvider.of<JoinChallengeCubit>(context).joinChallenge(api.getChallengeTypeSubPath(challengeType), uuid);

          if (joinedChallengeResponse.isSuccess == false) {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(AppLocalizations.of(context)!.error),
                content: Text(joinedChallengeResponse.errorMessage ?? "Unknown error"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
            return;
          }

          Navigator.pushReplacementNamed(context, api.getChallengeTypeRoute(challengeType),
              arguments: SingleChallengePageArguments(type_uuid: type_uuid, uuid: joinedChallengeResponse.result?.uuid ?? ""));
        },
        child: BlocBuilder<JoinChallengeCubit, JoinChallengeState>(
          builder: (context, state) {
            if (state is JoinChallengeAdding) return CircularProgressIndicator();
            return Text(
              actionText,
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      );
    }

    if (challengeInfo.is_joined && challengeInfo.can_be_joined) {
      var buttons = new List<Widget>.empty(growable: true);
      for (var joinedChallenge in challengeInfo.concrete_joined_challenges) {
        buttons.add(ElevatedButton(
          onPressed: () {
            Api api = Api();

            Navigator.pushReplacementNamed(context, api.getChallengeTypeRoute(challengeType),
                arguments: SingleChallengePageArguments(type_uuid: type_uuid, uuid: joinedChallenge.uuid));
          },
          child: Text(
            "${AppLocalizations.of(context)!.challenge_continue} ${joinedChallenge.date_joined}",
            style: TextStyle(color: Colors.white),
          ),
        ));
      }

      //Static join new button
      buttons.add(ElevatedButton(
        onPressed: () async {
          Api api = Api();

          var joinedChallengeResponse =
              await BlocProvider.of<JoinChallengeCubit>(context).joinChallenge(api.getChallengeTypeSubPath(challengeType), uuid);

          if (joinedChallengeResponse.isSuccess == false) {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(AppLocalizations.of(context)!.error),
                content: Text(joinedChallengeResponse.errorMessage ?? "Unknown error"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
            return;
          }

          Navigator.pushReplacementNamed(context, api.getChallengeTypeRoute(challengeType),
              arguments: SingleChallengePageArguments(type_uuid: type_uuid, uuid: joinedChallengeResponse.result?.uuid ?? ""));
        },
        child: BlocBuilder<JoinChallengeCubit, JoinChallengeState>(
          builder: (context, state) {
            if (state is JoinChallengeAdding) return CircularProgressIndicator();
            return Text(
              actionText,
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      ));

      return new Column(children: buttons);
    }

    // Empty
    return SizedBox(width: 0, height: 0);
  }
}
