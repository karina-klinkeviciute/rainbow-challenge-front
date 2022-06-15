import 'package:flutter/material.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/pages/shop/shop_page.dart';
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
          SizedBox(height: 30),
          ImageLocalWidget(url: 'assets/images/dialogs/shop.png'),
          Text(
            AppLocalizations.of(context)!.shop_welcome_text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3!.merge(
                const TextStyle(fontSize: 24, color: ThemeColors.primaryColor)),
          ),
          _goToShop(context)
        ],
      ),
    );
  }
}

Widget _goToShop(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 20),
    child: ElevatedButton(
        child: Text('NUKREIPIAME KAZKUR'),
        onPressed: () => Navigator.pushNamed(context, AppRoute.shopItems)),
  );
}
