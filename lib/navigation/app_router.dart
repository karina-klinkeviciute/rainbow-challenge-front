import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/navigation/route_arguments/single_challenge_arguments.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_event_participant/qr_code_scanner/cubit/qr_code_scanner_cubit.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_event_participant/qr_code_scanner/qr_code_scanner_page.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/pages/profile/cubit/profile_info_cubit.dart';
import 'package:rainbow_challenge/pages/regions/cubit/regions_cubit.dart';
import 'package:rainbow_challenge/pages/regions/regions_page.dart';
import 'package:rainbow_challenge/pages/shop/cubit/shop_info_cubit.dart';
import 'package:rainbow_challenge/pages/shop/cubit/shop_prize_cubit.dart';
import 'package:rainbow_challenge/pages/shop/shop_items.dart';
import 'package:rainbow_challenge/pages/shop/shop_page.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/utils/repository/joined_challenges/prize_repository.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

import 'package:rainbow_challenge/pages/challenge/challenge_article/cubit/challenge_article_cubit.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_custom/cubit/challenge_custom_cubit.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_event_organizer/cubit/challenge_event_organizer_cubit.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_event_participant/cubit/challenge_event_participant_cubit.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_project/cubit/challenge_project_cubit.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_quiz/cubit/challenge_quiz_cubit.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_reacting/cubit/challenge_reacting_cubit.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_school_gsa/cubit/challenge_school_gsa_cubit.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_story/cubit/challenge_story_cubit.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_support/cubit/challenge_support_cubit.dart';

import 'package:rainbow_challenge/pages/challenges/cubit/challenges_cubit.dart';

// In this file we define named app routes.
// One of use cases is with Navigator: `Navigator.pushNamed(context, routeName)`.

class AppRouter {
  RegionsRepository regionsRepository =
      RegionsRepository(dioClient: DioClient());

  ProfileRepository profileRepository =
      ProfileRepository(dioClient: DioClient());

  PrizeRepository prizeRepository = PrizeRepository(dioClient: DioClient());

  ChallengesRepository challengesRepository =
      ChallengesRepository(dioClient: DioClient());

  JoinedChallengesEventParticipantRepository
      joinedChallengesEventParticipantRepository =
      JoinedChallengesEventParticipantRepository(dioClient: DioClient());

  ChallengesEventParticipantRepository challengesEventParticipantRepository =
      ChallengesEventParticipantRepository(dioClient: DioClient());

  ChallengesArticleRepository challengesArticleRepository =
      ChallengesArticleRepository(dioClient: DioClient());

  ChallengesCustomRepository challengesCustomRepository =
      ChallengesCustomRepository(dioClient: DioClient());

  ChallengesEventOrganizerRepository challengesEventOrganizerRepository =
      ChallengesEventOrganizerRepository(dioClient: DioClient());

  ChallengesProjectRepository challengesProjectRepository =
      ChallengesProjectRepository(dioClient: DioClient());

  ChallengesQuizRepository challengesQuizRepository =
      ChallengesQuizRepository(dioClient: DioClient());

  ChallengesReactingRepository challengesReactingRepository =
      ChallengesReactingRepository(dioClient: DioClient());

  ChallengesSchoolGsaRepository challengesSchoolGsaRepository =
      ChallengesSchoolGsaRepository(dioClient: DioClient());

  ChallengesStoryRepository challengesStoryRepository =
      ChallengesStoryRepository(dioClient: DioClient());

  ChallengesSupportRepository challengesSupportRepository =
      ChallengesSupportRepository(dioClient: DioClient());

  AppRouter() {
    challengesRepository = ChallengesRepository(dioClient: DioClient());

    challengesArticleRepository =
        ChallengesArticleRepository(dioClient: DioClient());
    challengesCustomRepository =
        ChallengesCustomRepository(dioClient: DioClient());

    challengesEventOrganizerRepository =
        ChallengesEventOrganizerRepository(dioClient: DioClient());

    challengesEventParticipantRepository =
        ChallengesEventParticipantRepository(dioClient: DioClient());

    challengesProjectRepository =
        ChallengesProjectRepository(dioClient: DioClient());

    challengesQuizRepository = ChallengesQuizRepository(dioClient: DioClient());

    challengesSchoolGsaRepository =
        ChallengesSchoolGsaRepository(dioClient: DioClient());

    challengesStoryRepository =
        ChallengesStoryRepository(dioClient: DioClient());

    challengesSupportRepository =
        ChallengesSupportRepository(dioClient: DioClient());
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

      case AppRoute.challengeEventParticipant:
        final arguments =
            routeSettings.arguments as SingleChallengePageArguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChallengeEventParticipantCubit(
                      challengesTypeRepository:
                          challengesEventParticipantRepository),
                  child: ChallengeEventParticipantPage(
                    type_uuid: arguments.type_uuid,
                    uuid: arguments.uuid,
                  ),
                ));

      case AppRoute.challengeArticle:
        final arguments =
            routeSettings.arguments as SingleChallengePageArguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChallengeArticleCubit(
                      challengesTypeRepository: challengesArticleRepository),
                  child: ChallengeArticlePage(
                    type_uuid: arguments.type_uuid,
                    uuid: arguments.uuid,
                  ),
                ));

      case AppRoute.challengeCustom:
        final arguments =
            routeSettings.arguments as SingleChallengePageArguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChallengeCustomCubit(
                      challengesTypeRepository: challengesCustomRepository),
                  child: ChallengeCustomPage(
                    type_uuid: arguments.type_uuid,
                    uuid: arguments.uuid,
                  ),
                ));

      case AppRoute.challengeEventOrganizer:
        final arguments =
            routeSettings.arguments as SingleChallengePageArguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChallengeEventOrganizerCubit(
                      challengesTypeRepository:
                          challengesEventOrganizerRepository),
                  child: ChallengeEventOrganizerPage(
                    type_uuid: arguments.type_uuid,
                    uuid: arguments.uuid,
                  ),
                ));

      case AppRoute.challengeProject:
        final arguments =
            routeSettings.arguments as SingleChallengePageArguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChallengeProjectCubit(
                      challengesTypeRepository: challengesProjectRepository),
                  child: ChallengeProjectPage(
                    type_uuid: arguments.type_uuid,
                    uuid: arguments.uuid,
                  ),
                ));

      case AppRoute.challengeQuiz:
        final arguments =
            routeSettings.arguments as SingleChallengePageArguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChallengeQuizCubit(
                      challengesTypeRepository: challengesQuizRepository),
                  child: ChallengeQuizPage(
                    type_uuid: arguments.type_uuid,
                    uuid: arguments.uuid,
                  ),
                ));

      case AppRoute.challengeReacting:
        final arguments =
            routeSettings.arguments as SingleChallengePageArguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChallengeReactingCubit(
                      challengesTypeRepository: challengesReactingRepository),
                  child: ChallengeReactingPage(
                    type_uuid: arguments.type_uuid,
                    uuid: arguments.uuid,
                  ),
                ));
      case AppRoute.qrCode:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => QrCodeScannerCubit(
                      challengeRepository:
                          joinedChallengesEventParticipantRepository),
                  child: QrCodePage(),
                ));
      case AppRoute.challengeSchoolGsa:
        final arguments =
            routeSettings.arguments as SingleChallengePageArguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChallengeSchoolGsaCubit(
                      challengesTypeRepository: challengesSchoolGsaRepository),
                  child: ChallengeSchoolGsaPage(
                    type_uuid: arguments.type_uuid,
                    uuid: arguments.uuid,
                  ),
                ));

      case AppRoute.challengeStory:
        final arguments =
            routeSettings.arguments as SingleChallengePageArguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChallengeStoryCubit(
                      challengesTypeRepository: challengesStoryRepository),
                  child: ChallengeStoryPage(
                    type_uuid: arguments.type_uuid,
                    uuid: arguments.uuid,
                  ),
                ));

      case AppRoute.challengeSupport:
        final arguments =
            routeSettings.arguments as SingleChallengePageArguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ChallengeSupportCubit(
                      challengesTypeRepository: challengesSupportRepository),
                  child: ChallengeSupportPage(
                    type_uuid: arguments.type_uuid,
                    uuid: arguments.uuid,
                  ),
                ));

      case AppRoute.profile:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      ProfileInfoCubit(profileRepository: profileRepository),
                  child: ProfilePage(),
                ));

      case AppRoute.regions:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      RegionsCubit(regionsRepository: regionsRepository),
                  child: RegionsPage(),
                ));

      case AppRoute.shopItems:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<ShopInfoCubit>(
                      create: (BuildContext context) => ShopInfoCubit(
                        profileRepository: profileRepository,
                      ),
                    ),
                    BlocProvider<ShopPrizeCubit>(
                      create: (BuildContext context) => ShopPrizeCubit(
                        prizeRepository: prizeRepository,
                      ),
                    )
                  ],
                  child: ShopItemsPage(),
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

      case AppRoute.shopItems:
        return MaterialPageRoute(builder: (_) => ShopItemsPage());

      case AppRoute.qrCode:
        return MaterialPageRoute(builder: (_) => QrCodePage());

      case AppRoute.messages:
        return MaterialPageRoute(builder: (_) => MessagesPage());

      case AppRoute.about:
        return MaterialPageRoute(builder: (_) => AboutPage());

      default:
        return MaterialPageRoute(builder: (_) => HomeEmptyPage());
    }
  }
}
