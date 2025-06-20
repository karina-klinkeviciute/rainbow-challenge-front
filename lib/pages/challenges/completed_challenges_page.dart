import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/challenges/cubit/challenges_cubit.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/localization/app_localizations.dart'; 

class CompletedChallengesPage extends StatefulWidget {
  const CompletedChallengesPage({Key? key}) : super(key: key);

  @override
  _CompletedChallengesPageState createState() {
    return _CompletedChallengesPageState();
  }
}

class _CompletedChallengesPageState extends State<CompletedChallengesPage>
    with AutomaticKeepAliveClientMixin<CompletedChallengesPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    BlocProvider.of<ChallengesCubit>(context).fetchCompletedChallenges();
    return const WrapperMainWidget(
      useAppBar: false,
      index: 4,
      mainArea: _MainArea(),
    );
  }

  @override
  bool get wantKeepAlive => false;
}

class _MainArea extends StatelessWidget {
  const _MainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          HeadlineWidget(
            title: AppLocalizations.of(context)!.challenge_type_completed,
          ),
          _ChallengesList(),
        ],
      ),
    );
  }
}

class _ChallengesList extends StatelessWidget {
  const _ChallengesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengesCubit, ChallengesState>(
        builder: (context, state) {
      if (!(state is CompletedChallengesLoaded))
        return Center(child: CircularProgressIndicator());
      final challengesList = (state).completedChallengesList;
      final challengesListCompleted =
          challengesList.map((e) => e.challengeData);
      final challengesTypeQuiz =
          challengesListCompleted.where((e) => e.type == 'quiz');
      final challengesTypeArticle =
          challengesListCompleted.where((e) => e.type == 'article');
      final challengesTypeEvent =
          challengesListCompleted.where((e) => e.type == 'event');
      final challengesTypeCustom =
          challengesListCompleted.where((e) => e.type == 'custom');
      final challengesTypeSchoolGsa =
          challengesListCompleted.where((e) => e.type == 'school_gsa');
      final challengesTypeEventOrg =
          challengesListCompleted.where((e) => e.type == 'event_org');
      final challengesTypeStory =
          challengesListCompleted.where((e) => e.type == 'story');
      final challengesTypeProject =
          challengesListCompleted.where((e) => e.type == 'project');
      final challengesTypeReacting =
          challengesListCompleted.where((e) => e.type == 'reacting');
      final challengesTypeSupport =
          challengesListCompleted.where((e) => e.type == 'support');

      final List<dynamic> filteredChallengeTypes = [
        challengesTypeArticle,
        challengesTypeCustom,
        challengesTypeEvent,
        challengesTypeEventOrg,
        challengesTypeProject,
        challengesTypeQuiz,
        challengesTypeReacting,
        challengesTypeSchoolGsa,
        challengesTypeStory,
        challengesTypeSupport
      ].where((e) => e.length != 0).toList();

      final List<String> challengeTypeNames = <String>[
        AppLocalizations.of(context)!.challenge_type_article +
            ' (${challengesTypeArticle.length})',
        AppLocalizations.of(context)!.challenge_type_custom +
            ' (${challengesTypeCustom.length})',
        AppLocalizations.of(context)!.challenge_type_event +
            ' (${challengesTypeEvent.length})',
        AppLocalizations.of(context)!.challenge_type_event_org +
            ' (${challengesTypeEventOrg.length})',
        AppLocalizations.of(context)!.challenge_type_project +
            ' (${challengesTypeProject.length})',
        AppLocalizations.of(context)!.challenge_type_quiz +
            ' (${challengesTypeQuiz.length})',
        AppLocalizations.of(context)!.challenge_type_reacting +
            ' (${challengesTypeReacting.length})',
        AppLocalizations.of(context)!.challenge_type_school_gsa +
            ' (${challengesTypeSchoolGsa.length})',
        AppLocalizations.of(context)!.challenge_type_story +
            ' (${challengesTypeStory.length})',
        AppLocalizations.of(context)!.challenge_type_support +
            ' (${challengesTypeSupport.length})',
      ].where((e) => !e.contains('(0)')).toList();

      return (challengeTypeNames.isEmpty)
          ? Center(
              child: Text(
                AppLocalizations.of(context)!.challenges_no_completed_challenges,
                style: Theme.of(context).textTheme.displaySmall,
            ))
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: challengeTypeNames.length,
              itemBuilder: (BuildContext context, int index) {
                return _challengeType(
                    typeTitle: challengeTypeNames[index],
                    typeList: filteredChallengeTypes[index]);
              });
    });
  }
}

class _challengeType extends StatelessWidget {
  final String typeTitle;
  final Iterable<Challenge> typeList;
  const _challengeType(
      {Key? key, required this.typeTitle, required this.typeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        collapsedIconColor: ThemeColors.secondaryColor,
        iconColor: ThemeColors.secondaryColor,
        title: Text(typeTitle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .merge(const TextStyle(color: ThemeColors.neutralColor))),
        controlAffinity: ListTileControlAffinity.leading,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: typeList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return typeList
                    .map((e) => _challenge(e, context))
                    .toList()[index];
              })
        ]);
  }

  Widget _challenge(Challenge challenge, context) {
    return ListTile(
      trailing: (challenge.needs_confirmation)
          ? Icon(Icons.check_box, color: Colors.grey)
          : Icon(Icons.check_box, color: Colors.green),
      title: Text(challenge.name,
          style: (!challenge.can_be_joined && !challenge.is_joined)
              ? Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .merge(const TextStyle(color: Colors.grey))
              : Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .merge(const TextStyle(color: ThemeColors.neutralColor))),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChallengePage(challengeInfo: challenge)));
      },
    );
  }
}

class ChallengesPageArguments {
  final String title;
  final String description;
  final String uuid;
  final int points;

  ChallengesPageArguments(
      {required this.description,
      required this.title,
      required this.uuid,
      required this.points});
}
