import 'package:flutter/material.dart';
import 'package:rainbow_challenge/pages/__example.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/headline.dart';
import 'package:rainbow_challenge/widgets/wrapper_main.dart';
import 'package:rainbow_challenge/utils/model/challenge_model.dart';

// TO DO: change hard coded values to API, design, functionality.

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ExamplePage()));
              },
              child: Text('Make request')),
          //    _LocalNavigation(),
          //  _AllChallenges(challenges: []),
          _ChallengesList()
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

class _AllChallenges extends StatelessWidget {
  const _AllChallenges({Key? key, required this.challenges}) : super(key: key);

  final List<Challenge> challenges;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: challenges.length,
      itemBuilder: (context, index) {
        return Text(challenges[index].description);
      },
    );
  }
}

void _makeRequest() async {}
void _goToPage() {}
