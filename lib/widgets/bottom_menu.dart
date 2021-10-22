import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/bloc/bottom_menu_cubit.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/fonts.dart' as ThemeFonts;

// BottomMenu is built with the built-in widget BottomNavigationBar.
// The looks are defined with theme variables in lib/theme folder.

// TO DO: add functionality

class BottomMenuWidget extends StatelessWidget {
  const BottomMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomMenuCubit, int>(builder: (context, state) {
      void _getChangeBottomMenu(int index) {
        context.read<BottomMenuCubit>().updateIndex(index);
        switch (index) {
          case 0:
            Navigator.pushNamed(context, AppRoute.home);
            break;
          case 1:
            Navigator.pushNamed(context, AppRoute.profile);
            break;
          case 2:
            Navigator.pushNamed(context, AppRoute.challenges);
            break;
          case 3:
            Navigator.pushNamed(context, AppRoute.regions);
            break;
          case 4:
            Navigator.pushNamed(context, AppRoute.navigation);
            break;
        }
      }

      return BottomNavigationBar(
        currentIndex: context.read<BottomMenuCubit>().state,
        onTap: _getChangeBottomMenu,
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
    });
  }
}
