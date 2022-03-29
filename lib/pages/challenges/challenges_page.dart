import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/challenges/cubit/challenges_cubit.dart';
import 'package:rainbow_challenge/pages/challenges/cubit/user_joined_challenges_cubit.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rainbow_challenge/theme/fonts.dart' as ThemeFonts;

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
    BlocProvider.of<UserJoinedChallengesCubit>(context).fetchChallenges();
    return const WrapperMainWidget(mainArea: _MainArea(), useAppBar: false);
  }

  @override
  bool get wantKeepAlive => false;
}

class _MainArea extends StatelessWidget {
  const _MainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          HeadlineWidget(
            title: AppLocalizations.of(context)!.menu_challenges,
          ),
          _LocalTabs(),
        ],
      ),
    );
  }
}

class _LocalTabs extends StatefulWidget {
  const _LocalTabs({Key? key}) : super(key: key);

  @override
  State<_LocalTabs> createState() => _LocalTabsState();
}

class _LocalTabsState extends State<_LocalTabs> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: ThemeColors.secondaryColor),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(40), // Creates border
                color: ThemeColors.secondaryColor),
            labelColor: Colors.white,
            labelStyle: TextStyle(
                fontFamily: ThemeFonts.secondaryFontFamily,
                fontWeight: FontWeight.bold),
            unselectedLabelColor: ThemeColors.neutralColor,
            automaticIndicatorColorAdjustment: false,
            controller: _tabController,
            tabs: [
              Tab(text: 'Visos'),
              Tab(text: 'Pradėtos'),
              Tab(text: 'Užbaigtos'),
            ],
          ),
        ),
      ),
      ListView(

          //  shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            TabBarView(
              controller: _tabController,
              children: [
                _ChallengesList(),
                _JoinedChallengesList(),
                _DoneChallengesList()
              ],
            ),
          ])
    ]);
  }
}

// CHALLENGES
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

      return ListView.separated(
          separatorBuilder: (context, index) => Divider(
                height: 1,
              ),
          //  shrinkWrap: true,
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
    final ThemeData theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
          title: Text(
            typeTitle,
            style: TextStyle(
                fontFamily: ThemeFonts.secondaryFontFamily,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          controlAffinity: ListTileControlAffinity.trailing,
          collapsedTextColor: ThemeColors.neutralColor,
          collapsedIconColor: ThemeColors.neutralColor,
          iconColor: ThemeColors.secondaryColor,
          textColor: ThemeColors.secondaryColor,
          //  backgroundColor: ThemeColors.neutralColorLight.withOpacity(0.1),
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
          ]),
    );
  }

  Widget _challenge(Challenge challenge, context) {
    return ListTile(
      title: Text(challenge.name,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
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

// JOINED CHALLENGES
class _JoinedChallengesList extends StatelessWidget {
  const _JoinedChallengesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserJoinedChallengesCubit, UserJoinedChallengesState>(
        builder: (context, state) {
      if (!(state is UserJoinedChallengesLoaded))
        return Center(child: CircularProgressIndicator());
      final userJoinedchallengesList = (state).userJoinedChallengesList;

      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: userJoinedchallengesList.length,
          itemBuilder: (BuildContext context, int index) {
            return userJoinedchallengesList
                .map((e) => _userJoinedChallenge(e, context))
                .toList()[index];
          });
    });
  }

  Widget _userJoinedChallenge(
      UserJoinedChallenge userJoinedChallenge, context) {
    return ListTile(
      title: Text(userJoinedChallenge.challenge,
          style: Theme.of(context).textTheme.headline4!),
      onTap: () {},
    );
  }
}

// COMPLETED CHALLENGES
class _DoneChallengesList extends StatelessWidget {
  const _DoneChallengesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Done Challenges list'));
  }
}
