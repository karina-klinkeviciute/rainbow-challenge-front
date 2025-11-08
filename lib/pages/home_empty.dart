import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/profile/cubit/profile_info_cubit.dart';
import 'package:rainbow_challenge/pages/profile/profile_page.dart';
import 'package:rainbow_challenge/pages/regions/regions_page.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/fonts.dart' as ThemeFonts;
import 'package:rainbow_challenge/utils/repository/challenges/challenges_repository.dart';
import 'package:rainbow_challenge/utils/repository/user_profile_repository.dart';
import 'package:rainbow_challenge/widgets/message.dart';
import 'package:rainbow_challenge/localization/app_localizations.dart'; 

import 'challenges/challenges_page.dart';
import 'challenges/cubit/challenges_cubit.dart';
import 'navigation.dart';

// This page is a suggestion on how the home page can look while
// the ArticlesPage() is empty.

class HomeEmptyPage extends StatelessWidget {
  HomeEmptyPage({Key? key}) : super(key: key);

  final ChallengesRepository challengesRepository =
      ChallengesRepository(dioClient: DioClient());

  final ProfileRepository profileRepository =
      ProfileRepository(dioClient: DioClient());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body: TabBarView(
            children: [
              Scaffold(
                  backgroundColor: ThemeColors.bgColorLight,
                  body: SafeArea(
                    bottom: true,
                    top: true,
                    child: MessageWidget(
                      icon: Icons.favorite,
                      title:
                      AppLocalizations.of(context)!.home_empty_title,
                      //   message:
                      //      '<p>Čia galima, esant reikalui, įdėti išsamesnę žinutę su HtmlWidget().'
                      //      ' Pavyzdžiui, kai norime lankytojui <strong>suteikti daugiau </strong> '
                      //      ' <a href="https://tja.lt">informacijos</a>.</p>',
                    ),
                  )),
              BlocProvider(
                create: (BuildContext context) =>
                    ProfileInfoCubit(profileRepository: profileRepository),
                child: ProfilePage(),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    ChallengesCubit(challengesRepository: challengesRepository),
                child: ChallengesPage(),
              ),
              RegionsPage(),
              NavigationPage(),
            ],
          ),
          bottomNavigationBar: Material(
              color: Colors.white,
              child: SizedBox(
                  height: 55,
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: AppLocalizations.of(context)!.menu_home,
                        icon: Icon(Icons.home),
                        iconMargin: EdgeInsets.zero,
                      ),
                      Tab(
                        text: AppLocalizations.of(context)!.menu_profile,
                        icon: Icon(Icons.account_circle),
                        iconMargin: EdgeInsets.zero,
                      ),
                      Tab(
                        text: AppLocalizations.of(context)!.menu_challenges,
                        icon: Icon(Icons.star_outline),
                        iconMargin: EdgeInsets.zero,
                      ),
                      Tab(
                        text: AppLocalizations.of(context)!.menu_regions,
                        icon: Icon(Icons.place),
                        iconMargin: EdgeInsets.zero,
                      ),
                      Tab(
                        text: AppLocalizations.of(context)!.menu_navigation,
                        icon: Icon(Icons.menu),
                        iconMargin: EdgeInsets.zero,
                      ),
                    ],
                    indicatorColor: ThemeColors.secondaryColor,
                    labelColor: ThemeColors.secondaryColor,
                    unselectedLabelColor: ThemeColors.neutralColorLight,
                    unselectedLabelStyle: const TextStyle(
                        fontFamily: ThemeFonts.primaryFontFamily, fontSize: 14),
                    labelStyle: const TextStyle(
                        fontFamily: ThemeFonts.primaryFontFamily, fontSize: 14),
                  )))),
    );
  }
}
