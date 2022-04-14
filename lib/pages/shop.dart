import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rainbow_challenge/theme/colors.dart';

// Shop page.
// To do everything.

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      mainArea: _MainArea(),
      //  bodyBackgroundColor: ThemeColors.bgColorLight,
    );
  }
}

class _MainArea extends StatelessWidget {
  const _MainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          HeadlineWidget(title: AppLocalizations.of(context)!.menu_shop),
          ImageLocalWidget(url: 'assets/images/dialogs/shop.png'),
          Text(AppLocalizations.of(context)!.shop_welcome_text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3!.merge(
                  const TextStyle(
                      fontSize: 24, color: ThemeColors.primaryColor))),
        ],
      ),
    );
    /*  return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  ImageLocalWidget(url: 'assets/images/dialogs/shop.png'),
          Text(AppLocalizations.of(context)!.shop_welcome_text,
              style: Theme.of(context).textTheme.headline3!.merge(
                  const TextStyle(
                      fontSize: 28, color: ThemeColors.primaryColorDark))),
        ]);
*/
    /*   return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  ImageLocalWidget(url: 'assets/images/dialogs/shop.png'),
              Text(AppLocalizations.of(context)!.shop_welcome_text,
                  style: Theme.of(context).textTheme.headline3!.merge(
                      const TextStyle(
                          fontSize: 28, color: ThemeColors.primaryColorDark))),
            ]),
      ),
    ); */
  }
}
