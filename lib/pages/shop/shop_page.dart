import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/shop/cubit/shop_info_cubit.dart';
import 'package:rainbow_challenge/pages/shop/cubit/shop_prize_cubit.dart';
import 'package:rainbow_challenge/pages/shop/shop_items.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/model/available_prize/prize_class.dart';
import 'package:rainbow_challenge/widgets/rainbow_price.dart';
import 'package:rainbow_challenge/widgets/wrapper_custom_appbar.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO: get medals data and fix conditional view for them.
// TODO: add option to logout.
// TODO: Lithuanian localizations for Vaivorykstes (word variations).

class ShopItemsPage extends StatelessWidget {
  ShopItemsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperCustomAppbarWidget(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      mainArea: _MainArea(),
      //  useAppBar: false,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _MainArea extends StatelessWidget {
  _MainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          HeadlineWidget(
            title: AppLocalizations.of(context)!.menu_shop,
            subtitle: AppLocalizations.of(context)!.shop_subtitle_text,
          ),
          _ProfileInfo(),
          SizedBox(height: 10),
          _PrizeList(),
        ],
      ),
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShopInfoCubit>(context).fetchProfile();
    return BlocBuilder<ShopInfoCubit, ShopInfoState>(
      builder: (context, state) {
        if ((state is ShopInfoLoaded)) {
          final profile = (state).profile;
          return Column(children: [
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.5],
                      colors: [
                        ThemeColors.bgColor,
                        Colors.white,
                      ],
                    ),
                    shape: BoxShape.circle),
              ),
              StatsWidget(
                  localIcon: 'assets/images/rainbow.png',
                  number: profile.remaining_points.toString(),
                  label: 'Aktyvios ' +
                      AppLocalizations.of(context)!.profile_page_stats_rainbows)
            ]),
          ]);
        }
        return Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}

class _PrizeList extends StatelessWidget {
  const _PrizeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShopPrizeCubit>(context).fetchPrize();
    return BlocBuilder<ShopPrizeCubit, ShopPrizeState>(
        builder: (context, state) {
      if ((state is ShopPrizeLoaded)) {
        final prizesList = (state).prizesList;
        return GridView.builder(
            // scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: MediaQuery.of(context).size.width * 0.0018,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2),
            itemCount: prizesList.length,
            itemBuilder: (BuildContext context, int index) {
              return prizesList
                  .map((e) => _prizesItem(e, context, index))
                  .toList()[index];
            });
      }
      return Center(child: CircularProgressIndicator());
    });
  }

  Widget _prizesItem(Prize prizeItem, context, index) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ShopItemPage(
            amount_remaining: prizeItem.amount_remaining,
            image: prizeItem.image,
            uuid: prizeItem.uuid,
            description: prizeItem.description ?? '',
            name: prizeItem.name,
            price: prizeItem.price.toString(),
          );
        }));
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
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (prizeItem.image != null)
                ImageExternalWidget(
                  url: prizeItem.image!,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.12,
                )
              else
                _RandomPlaceholderImage(),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(prizeItem.name,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style:
                        Theme.of(context).textTheme.bodyMedium!.merge(TextStyle(
                              fontWeight: FontWeight.bold,
                            ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(prizeItem.description ?? '',
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RainbowPriceWidget(
                    localIcon: 'assets/images/rainbow.png',
                    price: prizeItem.price.toString(),
                    priceHight: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: ThemeColors.secondaryColor,
                  )
                ],
              )
            ]),
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
