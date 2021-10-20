import 'package:flutter/material.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/pages/about.dart';
import 'package:rainbow_challenge/pages/challenge.dart';
import 'package:rainbow_challenge/pages/challenges/challenges_page.dart';
import 'package:rainbow_challenge/pages/home_empty.dart';
import 'package:rainbow_challenge/pages/navigation.dart';
import 'package:rainbow_challenge/pages/code.dart';
import 'package:rainbow_challenge/pages/shop.dart';
import 'package:rainbow_challenge/pages/logout.dart';
import 'package:rainbow_challenge/pages/messages.dart';
import 'package:rainbow_challenge/pages/regions.dart';
import 'package:rainbow_challenge/pages/profile/profile_page.dart';

// Inf this file we define named app route.
// One of use cases is with Navigator: `Navigator.pushNamed(context, routeName)`.
class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoute.challenges:
        return MaterialPageRoute(builder: (_) => ChallengesPage());
      case AppRoute.challengesStarted:
        return MaterialPageRoute(builder: (_) => ChallengesPage());
      case AppRoute.challenge:
        return MaterialPageRoute(builder: (_) => ChallengePage());
      case AppRoute.regions:
        return MaterialPageRoute(builder: (_) => RegionsPage());
      case AppRoute.navigation:
        return MaterialPageRoute(builder: (_) => NavigationPage());
      case AppRoute.logout:
        return MaterialPageRoute(builder: (_) => LogoutPage());
      case AppRoute.shop:
        return MaterialPageRoute(builder: (_) => ShopPage());
      case AppRoute.code:
        return MaterialPageRoute(builder: (_) => CodePage());
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
