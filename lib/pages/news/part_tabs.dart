part of 'news_page.dart';

Widget _tabs(context) {
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
