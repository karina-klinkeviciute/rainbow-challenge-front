import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/challenges/cubit/challenges_cubit.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TO DO: design _challenge
// TO DO: replace front end filtering with backend endpoints
part 'part_challenges_list.dart';
part 'part_joined_challenges_list.dart';
part 'part_done_challenges_list.dart';

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
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          HeadlineWidget(
            title: AppLocalizations.of(context)!.menu_challenges,
          ),
          //     _LocalNavigation(),
          _LocalTabs(),
          //  _LocalTabs(),
          //    _LocalTabFields(),
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
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: const <Widget>[
        Text('Challenges'),
        Text('Joined'),
        Text('Done'),
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
        decoration: BoxDecoration(
          border: Border.all(color: ThemeColors.neutralColorLight),
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.symmetric(vertical: 30),
        child: TabBar(
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Creates border
              color: ThemeColors.secondaryColor),
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.star_border_outlined)),
            Tab(icon: Icon(Icons.star_half_outlined)),
            Tab(icon: Icon(Icons.star)),
          ],
        ),
      ),
      Container(
        height: 1000,
        child: TabBarView(
          controller: _tabController,
          children: [
            _ChallengesList(),
            _JoinedChallengesList(),
            _DoneChallengesList()
          ],
        ),
      ),
    ]);
  }
}
