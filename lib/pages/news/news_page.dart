import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/profile/cubit/profile_info_cubit.dart';
import 'package:rainbow_challenge/pages/regions/cubit/regions_cubit.dart';
import 'package:rainbow_challenge/pages/regions/regions_page.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/fonts.dart' as ThemeFonts;
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import '../pages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

import 'package:rainbow_challenge/utils/repository/repositories.dart';
import '../challenges/cubit/challenges_cubit.dart';

import 'cubit/news_cubit.dart';

// TODO: add some nice placeholder images
// TODO: make placeholder persistent for same news item

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  final ChallengesRepository challengesRepository =
      ChallengesRepository(dioClient: DioClient());

  final RegionsRepository regionsRepository =
      RegionsRepository(dioClient: DioClient());

  final ProfileRepository profileRepository =
      ProfileRepository(dioClient: DioClient());

  final NewsRepository newsRepository = NewsRepository(dioClient: DioClient());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body: TabBarView(
            children: [
              BlocProvider(
                create: (BuildContext context) =>
                    NewsCubit(newsRepository: newsRepository),
                child: _NewsList(),
              ),
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
              BlocProvider(
                create: (BuildContext context) =>
                    RegionsCubit(regionsRepository: regionsRepository),
                child: RegionsPage(),
              ),
              NavigationPage(),
            ],
          ),
          bottomNavigationBar: _BottomTabs()),
    );
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsCubit>(context).fetchNews();
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
      if (!(state is NewsLoaded))
        return Center(child: CircularProgressIndicator());
      final newsList = (state).newsList;
      return ListView.builder(
          //  shrinkWrap: true,
          //  physics: const NeverScrollableScrollPhysics(),
          itemCount: newsList.length,
          itemBuilder: (BuildContext context, int index) {
            return newsList
                .map((e) => _newsItem(e, context, index))
                .toList()[index];
          });
    });
  }

  // TODO research: Should this widget be rewritten as stless widget?
  Widget _newsItem(News newsItem, context, index) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewsItemPage(
            title: newsItem.title,
            body: newsItem.body,
            image: newsItem.image,
            date: newsItem.created_at,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            border: index == 0
                ? Border()
                : Border(
                    top: BorderSide(
                        width: 1,
                        color:
                            ThemeColors.neutralColorLight.withOpacity(0.3)))),
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            if (newsItem.image != null)
              Hero(
                  tag: newsItem.title,
                  child: ImageExternalWidget(
                      url: newsItem.image!, width: 80, height: 80))
            else
              Hero(tag: newsItem.title, child: _RandomPlaceholderImage()),
            SizedBox(width: 10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newsItem.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .merge(TextStyle(fontWeight: FontWeight.bold))),

                Container(
                    //  height: 36,
                    child: Text(
                  newsItem.body.truncate(max: 70),
                  overflow: TextOverflow.fade,
                  softWrap: true,
                )),

                // HtmlWidget(data: newsItem.body)
              ],
            )),
            SizedBox(width: 10),
            Icon(
              Icons.chevron_right_outlined,
              color: ThemeColors.secondaryColor.withOpacity(0.7),
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _RandomPlaceholderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List _placeholderImages = [
      'assets/images/news_placeholder.png',
    ];

    String _randomImage =
        _placeholderImages[Random().nextInt(_placeholderImages.length)];

    return ImageLocalWidget(url: _randomImage, width: 80, height: 80);
  }
}

class _BottomTabs extends StatelessWidget {
  const _BottomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
            )));
  }
}

extension Truncate on String {
  String truncate({required int max, String suffix = '...'}) {
    return length < max
        ? this
        : '${substring(0, substring(0, max - suffix.length).lastIndexOf(" "))}$suffix';
  }
}
