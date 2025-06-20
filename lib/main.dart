import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/bloc/language_cubit.dart';

import 'package:rainbow_challenge/services/firebase_service.dart';

import 'package:rainbow_challenge/bloc/bottom_menu_cubit.dart';
import 'package:rainbow_challenge/bloc/internet_cubit.dart';
import 'package:rainbow_challenge/navigation/app_router.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/theme/design_theme.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/bloc/authentication_bloc.dart';

//import 'package:rainbow_challenge/pages/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rainbow_challenge/localization/app_localizations.dart'; 
import "package:flutter/services.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  final fcmToken = await FirebaseService.getDeviceToken();
  final RemoteMessage? _message = await FirebaseService.firebaseMessaging.getInitialMessage();
  final dynamic _pushNotifCategory = _message?.data["category"] ?? null;

  print("FCM TOKEN:");
  print(fcmToken);

  print("Initial message category: ");
  print(_message?.data["category"]);

  final userRepo = UserRepository(fcmToken);
  final initLanguage = await userRepo.getLanguage();

  runApp(
    App(
      userRepository: userRepo,
      appRouter: AppRouter(),
      connectivity: Connectivity(),
      initLanguage: initLanguage,
      pushNotifCategory: _pushNotifCategory
      )
  );
}

// Perhaps App could be added as an import

class App extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  final UserRepository userRepository;
  final AppRouter appRouter;
  final Connectivity connectivity;
  final AppLanguage initLanguage;
  final dynamic pushNotifCategory;

  App({
    Key? key,
    required this.userRepository,
    required this.connectivity,
    required this.appRouter,
    required this.initLanguage,
    this.pushNotifCategory = null,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (context) =>
                  AuthenticationBloc(userRepository: widget.userRepository)
                    ..add(AppStarted())),
          BlocProvider<InternetCubit>(
              create: (context) => InternetCubit(connectivity: widget.connectivity)),
          BlocProvider<BottomMenuCubit>(create: (context) => BottomMenuCubit()),
          BlocProvider<LanguageCubit>(create: (context) => LanguageCubit(
              userRepository: widget.userRepository,
              initLanguage: widget.initLanguage), lazy: false),
        ],
        child: BlocBuilder<LanguageCubit, AppLanguage>(
          builder: (context, language) {
            return MaterialApp(
              navigatorKey: App.navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: DesignTheme.lightTheme,
              darkTheme: DesignTheme.lightTheme,
              onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.app_title,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLanguage.supported.values.map((e) => e.locale),
              locale: language.locale,
              onGenerateRoute: widget.appRouter.onGenerateRoute,
              initialRoute: '/',
              // Home value can be removed after we define the default route in AppRoute()
              home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticationUninitialized) {
                    //return SplashPage();
                  }
                  if (state is AuthenticationAuthenticated) {
                    // Adding context to allow changing route whole in foreground
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      FCMProvider.setContext(context);
                    });

                    //If the notification opened the app
                    if(widget.pushNotifCategory != null){
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        Future.delayed(const Duration(milliseconds: 4000), () async {
                          await Navigator.of(context).pushNamed(getNotificationCategoryRoute(widget.pushNotifCategory));
                        });
                      });
                    }

                    // If app received notification while in background
                    Stream<RemoteMessage> _stream = FirebaseMessaging.onMessageOpenedApp;
                    _stream.listen((RemoteMessage event) async {
                      print("Handling category from stream: " + event.data["category"].toString());
                      await Navigator.of(context).pushNamed(getNotificationCategoryRoute(event.data["category"].toString()));
                                        });
                    return NewsPage();
                  } else {
                    return RegistrationPage(userRepository: widget.userRepository);
                  }
                },
              ),
            );
          },
        )
    );
  }
}