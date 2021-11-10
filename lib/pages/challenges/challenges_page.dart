import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/enums.dart';
import 'package:rainbow_challenge/pages/challenges/cubit/challenges_cubit.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/headline.dart';
import 'package:rainbow_challenge/widgets/wrapper_main.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_class.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TO DO: change hard coded values to API, design, functionality.

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChallengesCubit>(context).fetchChallenges();
    return const WrapperMainWidget(
      mainArea: _MainArea(),
    );
  }
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
            title: AppLocalizations.of(context)!.menu_challenges,
          ),
          //    _LocalNavigation(),
          //  _AllChallenges(challenges: []),
          _ChallengesList(),
          //  _ChallengesList()
        ],
      ),
    );
  }
}

/*
class _LocalNavigation extends StatefulWidget {
  const _LocalNavigation({Key? key}) : super(key: key);

  @override
  __LocalNavigationState createState() => __LocalNavigationState();
}

class __LocalNavigationState extends State<_LocalNavigation> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: const <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.call),
      ],
      onPressed: (int index) {
        setState(() {
          isSelected[index] = !isSelected[index];
        });
      },
      isSelected: isSelected,
    );
  }
}
*/

// Code below could be shorter, I tried using `lib/constants/enum`, but
// localizations don't work there without context.
// ChallengeType? challengeType;

class _ChallengesList extends StatelessWidget {
  const _ChallengesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengesCubit, ChallengesState>(
        builder: (context, state) {
      if (!(state is ChallengesLoaded))
        return Center(child: CircularProgressIndicator());
      final challengesList = (state).challengesList;
      final challengesTypeQuiz = challengesList.where((e) => e.type == 'quiz');
      final challengesTypeArticle =
          challengesList.where((e) => e.type == 'article');
      final challengesTypeEvent =
          challengesList.where((e) => e.type == 'event');
      final challengesTypeCustom =
          challengesList.where((e) => e.type == 'custom');
      final challengesTypeSchoolGsa =
          challengesList.where((e) => e.type == 'school_gsa');
      final challengesTypeEventOrg =
          challengesList.where((e) => e.type == 'event_org');
      final challengesTypeStory =
          challengesList.where((e) => e.type == 'story');
      final challengesTypeProject =
          challengesList.where((e) => e.type == 'project');
      final challengesTypeReacting =
          challengesList.where((e) => e.type == 'reacting');
      final challengesTypeSupport =
          challengesList.where((e) => e.type == 'support');

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
      ];

      final List<String> challengeTypeNames = <String>[
        AppLocalizations.of(context)!.challenge_type_article,
        AppLocalizations.of(context)!.challenge_type_custom,
        AppLocalizations.of(context)!.challenge_type_event,
        AppLocalizations.of(context)!.challenge_type_event_org,
        AppLocalizations.of(context)!.challenge_type_project,
        AppLocalizations.of(context)!.challenge_type_quiz,
        AppLocalizations.of(context)!.challenge_type_reacting,
        AppLocalizations.of(context)!.challenge_type_school_gsa,
        AppLocalizations.of(context)!.challenge_type_story,
        AppLocalizations.of(context)!.challenge_type_support
      ];

      return ListView.builder(
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
        title: Text(typeTitle,
            style: Theme.of(context).textTheme.headline3!.merge(const TextStyle(
                fontWeight: FontWeight.w400,
                color: ThemeColors.neutralColorLight))),
        controlAffinity: ListTileControlAffinity.leading,
        //  children: typeList.map((e) => _challenge(e)).toList());
        children: [
          ListView.builder(
              //  scrollDirection: Axis.horizontal,
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

  // Widget _challenge(Challenge challenge, context) - in case we would need it
  Widget _challenge(Challenge challenge, context) {
    return ListTile(
      title:
          Text(challenge.name, style: Theme.of(context).textTheme.headline4!),
      subtitle: Text(challenge.description),
    );
  }
}
