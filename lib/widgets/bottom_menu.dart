import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/fonts.dart';

// BottomMenu is built with the built-in widget BottomNavigationBar.
// The looks are defined with theme variables in lib/theme folder.

// TO DO: add functionality

class BottomMenuWidget extends StatelessWidget {
  const BottomMenuWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Pradžia',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Profilis',
          icon: Icon(Icons.account_circle),
        ),
        BottomNavigationBarItem(
          label: 'Užduotys',
          icon: Icon(Icons.star_outline),
        ),
        BottomNavigationBarItem(
          label: 'Regionai',
          icon: Icon(Icons.place),
        ),
        BottomNavigationBarItem(
          label: 'Navigacija',
          icon: Icon(Icons.menu),
        ),
      ],
      selectedItemColor: ThemeColors.secondaryColor,
      unselectedItemColor: ThemeColors.neutralColorLight,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      unselectedLabelStyle:
          const TextStyle(fontFamily: ThemeFonts.primaryFontFamily),
      selectedLabelStyle:
          const TextStyle(fontFamily: ThemeFonts.primaryFontFamily),
      // onTap: () {},
    );
  }
}
