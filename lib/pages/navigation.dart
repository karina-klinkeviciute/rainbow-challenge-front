import 'package:flutter/material.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/headings.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// A page that consists of all main pages displayed in a grid.
// TO DO: functionality

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() {
    return _NavigationPageState();
  }
}

class _NavigationPageState extends State<NavigationPage>
    with AutomaticKeepAliveClientMixin<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final String _itemTitle;
    // final String _itemIcon;
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: GridView.count(
                //  scrollDirection: Axis.horizontal,
                primary: false,
                padding: const EdgeInsets.symmetric(vertical: 20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: (2 / 1.3),
                children: <Widget>[
                  _GridItem(
                    itemIcon: ThemeIcons.challenges,
                    itemTitle: AppLocalizations.of(context)!.menu_challenges,
                    routeName: AppRoute.challenges,
                  ),
                  _GridItem(
                    itemIcon: ThemeIcons.regions,
                    itemTitle: AppLocalizations.of(context)!.menu_regions,
                    routeName: AppRoute.regions,
                  ),
                  _GridItem(
                    itemIcon: ThemeIcons.profile,
                    itemTitle: AppLocalizations.of(context)!.menu_profile,
                    routeName: AppRoute.profile,
                  ),
                  _GridItem(
                    itemIcon: ThemeIcons.chat,
                    itemTitle: AppLocalizations.of(context)!.menu_messages,
                    routeName: AppRoute.messages,
                  ),
                  _GridItem(
                    itemIcon: ThemeIcons.qrCode,
                    itemTitle: AppLocalizations.of(context)!.menu_qr_code,
                    routeName: AppRoute.qrCode,
                  ),
                  _GridItem(
                    itemIcon: ThemeIcons.challengesJoined,
                    itemTitle:
                        AppLocalizations.of(context)!.menu_challenges_joined,
                    // AppRoute.challengesJoined
                    routeName: AppRoute.challenges,
                  ),
                  _GridItem(
                    itemIcon: ThemeIcons.shop,
                    itemTitle: AppLocalizations.of(context)!.menu_shop,
                    routeName: AppRoute.shop,
                  ),
                  _GridItem(
                    itemIcon: ThemeIcons.about,
                    itemTitle: AppLocalizations.of(context)!.menu_about,
                    routeName: AppRoute.about,
                  ),
                  //  _gridItem(Icons.favorite, 'Apie projektą'),
                ],
              ),
            ),
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _GridItem extends StatelessWidget {
  final IconData itemIcon;
  final String itemTitle;
  final String routeName;

  const _GridItem(
      {Key? key,
      required this.itemIcon,
      required this.itemTitle,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: ThemeColors.bgColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: ThemeColors.bgColorLight,
              offset: Offset(3.0, 3.0),
              blurRadius: 0,
            ),
          ],
        ),
        margin: const EdgeInsets.only(right: 3),
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        // alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(itemIcon, color: ThemeColors.secondaryColor),
              Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(itemTitle,
                      // Theme of context not working.
                      style: ThemeHeadings.themeHeading4)),
            ]),
        // color: Colors.pink[100],
      ),
    );
  }
}
