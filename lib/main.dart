import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/bloc/bottom_menu_cubit.dart';
import 'package:rainbow_challenge/bloc/internet_cubit.dart';
import 'package:rainbow_challenge/navigation/app_router.dart';
import 'package:rainbow_challenge/pages/home_empty.dart';
import 'package:rainbow_challenge/theme/design_theme.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/bloc/authentication_bloc.dart';

//import 'package:rainbow_challenge/pages/splash.dart';
import 'package:rainbow_challenge/pages/home.dart';
import 'package:rainbow_challenge/pages/login/login_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(App(
      userRepository: UserRepository(),
      appRouter: AppRouter(),
      connectivity: Connectivity()));
}

class App extends StatelessWidget {
  final UserRepository userRepository;
  // These should be combined to runApp(), ex. bloc video 2:02
  final AppRouter appRouter;
  // Connectivity: to check if mobile
  // is connected to Wifi or Mobile Data
  final Connectivity connectivity;

  App(
      {Key? key,
      required this.userRepository,
      required this.connectivity,
      required this.appRouter})
      : assert(userRepository != null),
        super(key: key);
  // Bloc video 1:48 - provide bloc globally by wrapping MaterialApp()
  // A MultiProvider that combines different providers comes here
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (context) =>
                  AuthenticationBloc(userRepository: userRepository)
                    ..add(AppStarted())),
          BlocProvider<InternetCubit>(
              create: (context) => InternetCubit(connectivity: connectivity)),
          BlocProvider<BottomMenuCubit>(create: (context) => BottomMenuCubit()),
        ],
        child: MaterialApp(
          theme: DesignTheme.lightTheme,
          darkTheme: DesignTheme.darkTheme,
          title: 'Rainbow challenge', //AppLocalizations.of(context)!.app_title,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('lt', ''),
            //Locale('en', '')
          ],
          onGenerateRoute: appRouter.onGenerateRoute,
          initialRoute: '/',
          // Home value can be removed after we define the default route in AppRoute()
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationUninitialized) {
                //return SplashPage();
              }
              if (state is AuthenticationAuthenticated) {
                // To do in the future: change to HomePage()
                return HomeEmptyPage();
              }
              //if (state is AuthenticationUnauthenticated) {
              //return LoginPage(userRepository: userRepository);
              //}
              // return NavigationPage();
              return LoginPage(userRepository: userRepository);
              //return RegistrationPage(userRepository: userRepository);
            },
          ),
        ));
  }
}
