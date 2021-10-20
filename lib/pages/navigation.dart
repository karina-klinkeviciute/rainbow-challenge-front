import 'package:flutter/material.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/headings.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:rainbow_challenge/widgets/bottom_menu.dart';

// A page that consists of all main pages displayed in a grid.
// TO DO: functionality

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final String _itemTitle;
    // final String _itemIcon;
    return Scaffold(
        appBar: AppBar(),
        body: Center(
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
              children: const <Widget>[
                _GridItem(
                  itemIcon: ThemeIcons.challenges,
                  itemTitle: 'Užduotys',
                  routeName: AppRoute.challenges,
                ),
                _GridItem(
                  itemIcon: ThemeIcons.regions,
                  itemTitle: 'Regionai',
                  routeName: AppRoute.regions,
                ),
                _GridItem(
                  itemIcon: ThemeIcons.profile,
                  itemTitle: 'Profilis',
                  routeName: AppRoute.profile,
                ),
                _GridItem(
                  itemIcon: ThemeIcons.chat,
                  itemTitle: 'Susirašinėjimai',
                  routeName: AppRoute.messages,
                ),
                _GridItem(
                  itemIcon: ThemeIcons.qrCode,
                  itemTitle: 'Qr kodo skenavimas',
                  routeName: AppRoute.code,
                ),
                _GridItem(
                  itemIcon: ThemeIcons.challengesStarted,
                  itemTitle: 'Pradėtos užduotys',
                  routeName: AppRoute.challengesStarted,
                ),
                _GridItem(
                  itemIcon: ThemeIcons.shop,
                  itemTitle: 'Parduotuvė',
                  routeName: AppRoute.shop,
                ),
                _GridItem(
                  itemIcon: ThemeIcons.about,
                  itemTitle: 'Apie projektą',
                  routeName: AppRoute.about,
                ),
                //  _gridItem(Icons.favorite, 'Apie projektą'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomMenuWidget());
  }
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
