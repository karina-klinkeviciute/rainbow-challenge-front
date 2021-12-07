part of 'challenges_page.dart';
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
      // subtitle: Text(challenge.description),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChallengePage(challengeInfo: challenge)));
      },
    );
  }
}
