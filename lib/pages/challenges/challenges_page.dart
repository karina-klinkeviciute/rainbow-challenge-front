import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/challenges/cubit/challenges_cubit.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/localization/app_localizations.dart'; 
import 'package:rainbow_challenge/widgets/wrapper_custom_appbar.dart';

// TO DO: design _challenge
// TO DO: replace front end filtering with backend endpoints

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  @override
  _ChallengesPageState createState() {
    return _ChallengesPageState();
  }
}

class _ChallengesPageState extends State<ChallengesPage>
    with AutomaticKeepAliveClientMixin<ChallengesPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    BlocProvider.of<ChallengesCubit>(context).fetchChallenges();
    return WrapperCustomAppbarWidget(
      appBar: AppBar(automaticallyImplyLeading: false),
      mainArea: _MainArea(),
      //  useAppBar: false,
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
      final challengesListJoinable = challengesList
        ..where((e) => e.can_be_joined == true);
      final challengesTypeQuiz = challengesList.where((e) => e.type == 'quiz');
      final challengesTypeArticle =
          challengesListJoinable.where((e) => e.type == 'article');
      final challengesTypeEvent =
          challengesListJoinable.where((e) => e.type == 'event');
      final challengesTypeCustom =
          challengesListJoinable.where((e) => e.type == 'custom');
      final challengesTypeSchoolGsa =
          challengesListJoinable.where((e) => e.type == 'school_gsa');
      final challengesTypeEventOrg =
          challengesListJoinable.where((e) => e.type == 'event_org');
      final challengesTypeStory =
          challengesListJoinable.where((e) => e.type == 'story');
      final challengesTypeProject =
          challengesListJoinable.where((e) => e.type == 'project');
      final challengesTypeReacting =
          challengesListJoinable.where((e) => e.type == 'reacting');
      final challengesTypeSupport =
          challengesListJoinable.where((e) => e.type == 'support');

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
        collapsedIconColor: ThemeColors.secondaryColor,
        iconColor: ThemeColors.secondaryColor,
        title: Text(typeTitle,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .merge(const TextStyle(color: ThemeColors.neutralColor))),
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
      // subtitle: Text('can be joined ${challenge.can_be_joined}'),
      leading: Container(
        height: double.infinity,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageLocalWidget(
                url: 'assets/images/rainbow.png',
                width: 16,
              ),
              Text(challenge.points.toString())
            ]),
      ),
      trailing: (challenge.is_joined)
          ? Icon(
              Icons.check_box_outline_blank,
              color: Colors.green,
            )
          : null,
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
      // subtitle: Text(challenge.description),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChallengePage(challengeInfo: challenge)));
      },

      /*
      onTap: () {
        Navigator.pushNamed(context, AppRoute.challenge,
            arguments: ChallengesPageArguments(
                description: 'ths', title: 'tr', uuid: 'rrr', points: 4));
      },*/
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
