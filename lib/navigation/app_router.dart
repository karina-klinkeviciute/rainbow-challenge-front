import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/pages/about.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_page.dart';
import 'package:rainbow_challenge/pages/challenges/challenges_page.dart';
import 'package:rainbow_challenge/pages/challenges/cubit/challenges_cubit.dart';
import 'package:rainbow_challenge/pages/home_empty.dart';
import 'package:rainbow_challenge/pages/navigation.dart';
import 'package:rainbow_challenge/pages/qr_code.dart';
import 'package:rainbow_challenge/pages/shop.dart';
import 'package:rainbow_challenge/pages/logout.dart';
import 'package:rainbow_challenge/pages/messages.dart';
import 'package:rainbow_challenge/pages/regions.dart';
import 'package:rainbow_challenge/pages/profile/profile_page.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/repository/challenges_repository.dart';

// In this file we define named app route.
// One of use cases is with Navigator: `Navigator.pushNamed(context, routeName)`.

class AppRouter {
  ChallengesRepository challengesRepository =
      ChallengesRepository(dioClient: DioClient());

  AppRouter() {
    challengesRepository = ChallengesRepository(dioClient: DioClient());
  }

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // Maybe we should divide this file to parts?
      case AppRoute.challenges:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ChallengesCubit(
                      challengesRepository: challengesRepository),
                  child: ChallengesPage(),
                ));

      case AppRoute.challengesJoined:
        return MaterialPageRoute(builder: (_) => ChallengesPage());
      //  case AppRoute.challenge:
      //    return MaterialPageRoute(builder: (_) => ChallengePage());
      case AppRoute.regions:
        return MaterialPageRoute(builder: (_) => RegionsPage());
      case AppRoute.navigation:
        return MaterialPageRoute(builder: (_) => NavigationPage());
      case AppRoute.logout:
        return MaterialPageRoute(builder: (_) => LogoutPage());
      case AppRoute.shop:
        return MaterialPageRoute(builder: (_) => ShopPage());
      case AppRoute.qrCode:
        return MaterialPageRoute(builder: (_) => QrCodePage());
      case AppRoute.messages:
        return MaterialPageRoute(builder: (_) => MessagesPage());
      case AppRoute.profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case AppRoute.about:
        return MaterialPageRoute(builder: (_) => AboutPage());
      default:
        return MaterialPageRoute(builder: (_) => HomeEmptyPage());
    }
  }
}
