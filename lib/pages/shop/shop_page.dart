import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/pages/shop/cubit/shop_info_cubit.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/headings.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/widgets/wrapper_custom_appbar.dart';
import 'package:rainbow_challenge/bloc/authentication_bloc.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO: get medals data and fix conditional view for them.
// TODO: add option to logout.
// TODO: Lithuanian localizations for Vaivorykstes (word variations).

class ShopItemsPage extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();
  ShopItemsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShopInfoCubit>(context).fetchProfile();
    return WrapperCustomAppbarWidget(
      appBar: AppBar(),
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
            subtitle: AppLocalizations.of(context)!.menu_shop_subtitle,
          ),
          // _keiskText,
          _profileInfo,
        ],
      ),
    );
  }

  Widget _profileInfo = BlocBuilder<ShopInfoCubit, ShopInfoState>(
    builder: (context, state) {
      if (!(state is ShopInfoLoaded))
        return Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: CircularProgressIndicator(),
        ));
      final profile = (state).profile;
      return Column(children: [
        Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          Container(
            width: 150,
            height: 150,
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
              number: profile.all_points.toString(),
              label: AppLocalizations.of(context)!.profile_page_stats_rainbows)
        ]),
      ]);
    },
  );
}
