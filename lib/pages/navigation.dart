import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/headings.dart';
import 'package:rainbow_challenge/widgets/bottom_menu.dart';

// A page that consists of all main pages displayed in a grid.
// TO DO: functionality

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key key}) : super(key: key);
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
                _GridItem(itemIcon: Icons.star_outline, itemTitle: 'Užduotys'),
                _GridItem(itemIcon: Icons.fmd_good, itemTitle: 'Regionai'),
                _GridItem(
                    itemIcon: Icons.account_circle, itemTitle: 'Profilis'),
                _GridItem(itemIcon: Icons.chat, itemTitle: 'Susirašinėjimai'),
                _GridItem(
                    itemIcon: Icons.qr_code, itemTitle: 'Qr kodo skenavimas'),
                _GridItem(
                    itemIcon: Icons.star_half, itemTitle: 'Pradėtos užduotys'),
                _GridItem(
                    itemIcon: Icons.shopping_basket, itemTitle: 'Parduotuvė'),
                _GridItem(itemIcon: Icons.favorite, itemTitle: 'Apie projektą'),
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

  const _GridItem({Key key, @required this.itemIcon, @required this.itemTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
