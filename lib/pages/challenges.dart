import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/heading_lined.dart';
import 'package:rainbow_challenge/widgets/headline.dart';
import 'package:rainbow_challenge/widgets/wrapper_main.dart';

// TO DO: change hard coded values to API, design, functionality.

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WrapperMainWidget(
      mainArea: _PageContent(),
    );
  }
}

class _PageContent extends StatelessWidget {
  const _PageContent({Key key}) : super(key: key);

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
  _ChallengesList({Key key}) : super(key: key);

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
                style: Theme.of(context).textTheme.headline3.merge(
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
  const _LocalNavigation({Key key}) : super(key: key);

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
