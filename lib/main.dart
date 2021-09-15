import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/bloc/authentication_bloc.dart';

import 'package:rainbow_challenge/pages/splash.dart';
import 'package:rainbow_challenge/pages/home.dart';
import 'package:rainbow_challenge/pages/logout.dart';
import 'package:rainbow_challenge/pages/login/login_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  final userRepository = UserRepository();
  runApp(
      BlocProvider<AuthenticationBloc>(
        create: (context) {
          return AuthenticationBloc(
              userRepository: userRepository
          )..add(AppStarted());
        },
        child: App(userRepository: userRepository),
      )
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      title: 'Rainbow challenge App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('lt', ''),//Lithuanian, no entry code
        Locale('en', '')
      ],
      routes: {
        '/logout': (context) => LogoutPage(),
      },
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {

           //print(AppLocalizations.of(context)!.hello);

            return LoginPage(userRepository: userRepository,);
          }
         // return LoadingIndicator();
        },

      ),
    );
  }
}
