import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/fonts.dart' as ThemeFonts;
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/widgets/html.dart';
import '../pages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

import 'package:rainbow_challenge/utils/repository/repositories.dart';
import '../challenges/cubit/challenges_cubit.dart';

import 'cubit/news_cubit.dart';

// TODO: add some nice placeholder images
// TODO: fix trunkaded text body indicator in _newsItem

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  final ChallengesRepository challengesRepository =
      ChallengesRepository(dioClient: DioClient());

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
              ProfilePage(),
              BlocProvider(
                create: (BuildContext context) =>
                    ChallengesCubit(challengesRepository: challengesRepository),
                child: ChallengesPage(),
              ),
              RegionsPage(),
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
            return newsList.map((e) => _newsItem(e, context)).toList()[index];
          });
    });
  }

  // Should this widget be rewritten as stless widget?
  Widget _newsItem(News newsItem, context) {
    // TODO add interaction with hero
    return Container(
      decoration: BoxDecoration(color: Colors.red[50]),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          if (newsItem.image != null)
            ImageExternalWidget(url: newsItem.image!, width: 80, height: 80)
          else
            _RandomPlaceholderImage(),
          SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(newsItem.title,
                  style: Theme.of(context).textTheme.headline3!),
              Container(
                  height: 36,
                  child: Text(
                    newsItem.body,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  )),

              // HtmlWidget(data: newsItem.body)
            ],
          )),
        ],
      ),
    );
  }
}

class _RandomPlaceholderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List _placeholderImages = [
      'assets/images/placeholder.png',
      'assets/images/placeholder1.png',
      'assets/images/placeholder2.png',
      'assets/images/placeholder3.png'
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
