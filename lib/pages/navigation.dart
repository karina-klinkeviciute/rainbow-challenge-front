import 'package:flutter/material.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/headings.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:rainbow_challenge/localization/app_localizations.dart'; 
import 'package:badges/badges.dart' as badge;
import 'package:rainbow_challenge/utils/repository/messages_repository.dart';
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
  String _count = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }

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
                childAspectRatio: MediaQuery.of(context).size.height * 0.002,
                children: <Widget>[
                  _GridItem(
                    itemIcon: ThemeIcons.challenges,
                    itemTitle: AppLocalizations.of(context)!.menu_challenges,
                    page: 2,
                  ),
                  _GridItem(
                    isAppRoute: true,
                    itemIcon: ThemeIcons.regions,
                    itemTitle: AppLocalizations.of(context)!.menu_regions,
                    pageRoute: AppRoute.regions,
                  ),
                  _GridItem(
                    itemIcon: ThemeIcons.profile,
                    itemTitle: AppLocalizations.of(context)!.menu_profile,
                    page: 1,
                  ),
                  _GridItem(
                    isAppRoute: true,
                    showBadge: (_count != '' && _count != '0') ? true : false,
                    count: _count,
                    itemIcon: ThemeIcons.chat,
                    itemTitle: AppLocalizations.of(context)!.menu_messages,
                    pageRoute: AppRoute.messages,
                  ),
                  _GridItem(
                    isAppRoute: true,
                    itemIcon: ThemeIcons.qrCode,
                    itemTitle: AppLocalizations.of(context)!.menu_qr_code,
                    pageRoute: AppRoute.qrCode,
                  ),
                  _GridItem(
                    isAppRoute: true,
                    itemIcon: ThemeIcons.challengesJoined,
                    itemTitle:
                        AppLocalizations.of(context)!.menu_challenges_joined,
                    pageRoute: AppRoute.challengesJoined,
                  ),
                  _GridItem(
                    isAppRoute: true,
                    itemIcon: ThemeIcons.challengesCompleted,
                    itemTitle:
                        AppLocalizations.of(context)!.challenge_type_completed,
                    pageRoute: AppRoute.challengesCompleted,
                  ),
                  _GridItem(
                    isAppRoute: true,
                    itemIcon: ThemeIcons.about,
                    itemTitle: AppLocalizations.of(context)!.menu_about,
                    pageRoute: AppRoute.about,
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

  Future loadData() async {
    var fetchedMessages =
        await MessagesRepository(dioClient: DioClient()).fetchMessages();

    setState(() {
      _count = fetchedMessages
          .where((message) => message.seen == false)
          .length
          .toString();
    });
  }
}

class _GridItem extends StatelessWidget {
  final bool showBadge;
  final String count;
  final IconData itemIcon;
  final String itemTitle;
  final int page;
  final bool isAppRoute;
  final String pageRoute;

  const _GridItem(
      {Key? key,
      required this.itemIcon,
      required this.itemTitle,
      this.page = 0,
      this.showBadge = false,
      this.count = '',
      this.isAppRoute = false,
      this.pageRoute = AppRoute.home})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isAppRoute == false) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewsPage(index: page)));
        }
        if (isAppRoute == true) {
          Navigator.pushNamed(context, pageRoute);
        }
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
              badge.Badge(
                  badgeStyle: badge.BadgeStyle(
                    elevation: 0,
                    badgeColor: ThemeColors.primaryColor,
                  ),
                  position: badge.BadgePosition.custom(bottom: 20, start: 20),
                  showBadge: showBadge,
                  badgeContent: Text(
                    '$count',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  child: Icon(itemIcon, color: ThemeColors.secondaryColor)),
              Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(itemTitle,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      // Theme of context not working.
                      style: ThemeHeadings.themeHeading4)),
            ]),
        // color: Colors.pink[100],
      ),
    );
  }
}
