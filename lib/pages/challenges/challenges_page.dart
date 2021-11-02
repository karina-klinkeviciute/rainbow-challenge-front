import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/__example.dart';
import 'package:rainbow_challenge/pages/challenges/cubit/challenges_cubit.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/headline.dart';
import 'package:rainbow_challenge/widgets/wrapper_main.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_class.dart';

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
          const HeadlineWidget(
            title: 'Užduotys',
          ),
          //    _LocalNavigation(),
          //  _AllChallenges(challenges: []),
          _ChallengesList2(),
          //  _ChallengesList()
        ],
      ),
    );
  }
}

class _ChallengesList extends StatelessWidget {
  final List<String> challengeCategories = <String>[
    'Dalyvavimas renginiuose',
    'Straipsniai',
    'Žinių patikrinimas',
    'Parama',
    'Renginio organizavimas',
    'Projekto įgyvendinimas',
    'Reagavimas į įvykius',
    'Visuomenės informavimas',
    'Pasidalink savo istorija',
    'Įvairūs',
  ];
  _ChallengesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: challengeCategories.length,
        itemBuilder: (BuildContext context, int index) {
          /*
          return Container(
              height: 50,
              color: ThemeColors.bgColorLight,
              child: Text('${challengeCategories[index]}',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .merge(const TextStyle(fontWeight: FontWeight.w400))));
        */
          return ExpansionTile(
            title: Text(challengeCategories[index],
                style: Theme.of(context).textTheme.headline3!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.neutralColorLight))),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              ListTile(title: Text(challengeCategories[index])),
              ListTile(title: Text(challengeCategories[index])),
              ListTile(title: Text(challengeCategories[index])),
            ],
          );
        });
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

class _ChallengesList2 extends StatelessWidget {
  const _ChallengesList2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengesCubit, ChallengesState>(
      builder: (context, state) {
        if (!(state is ChallengesLoaded))
          return Center(child: CircularProgressIndicator());
        // final challenges = (state as ChallengesLoaded).challenges;
        final challengesList = (state).challengesList;
        return ListView(
          // Add context to _challenge if needed
          // children: challenges.map((e) => _challenge(e, context)).toList(),

          children: challengesList.map((e) => _challenge(e)).toList(),
        );
      },
    );
  }
}

// Widget _challenge(Challenge challenge, context) - in case we would need it
Widget _challenge(Challenge challenge) {
  return ListTile(
    title: Text(challenge.name),
    subtitle: Text(challenge.description),
  );
}
