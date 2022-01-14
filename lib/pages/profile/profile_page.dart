import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/headings.dart';
import 'cubit/profile_info_cubit.dart';
import 'package:rainbow_challenge/bloc/authentication_bloc.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Profile page
// TODO: fix streaks model and data.
// TODO: get medals data and fix conditional view for them.
// TODO: Lithuanian localizations for Vaivorykstes (word variations).

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    BlocProvider.of<ProfileInfoCubit>(context).fetchProfile();
    return WrapperMainWidget(
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
              title: AppLocalizations.of(context)!.profile_page_title),
          _profileInfo,
        ],
      ),
    );
  }

  Widget _profileInfo = BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
    builder: (context, state) {
      if (!(state is ProfileInfoLoaded))
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
                  stops: [
                    0,
                    0.8,
                  ],
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
        Text(profile.username ?? profile.email,
            style: ThemeHeadings.themeHeading3),
        Text(profile.region!.name,
            style: ThemeHeadings.themeHeading4
                .merge(TextStyle(color: Colors.black))),
        Column(
          children: [
            SizedBox(height: 20),
            MiniHeadingLinedWidget(
                title: AppLocalizations.of(context)!.profile_page_achievements),
            // TODO: fix achievements func
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ImageLocalWidget(
                url: 'assets/images/achievements/medal_platinum.png',
                width: 60,
              ),
              SizedBox(width: 10),
              ImageLocalWidget(
                url: 'assets/images/achievements/medal_gold.png',
                width: 60,
              ),
              SizedBox(width: 10),
              ImageLocalWidget(
                url: 'assets/images/achievements/medal_silver.png',
                width: 60,
              ),
              SizedBox(width: 10),
              ImageLocalWidget(
                url: 'assets/images/achievements/medal_bronze.png',
                width: 60,
              ),
              SizedBox(width: 10)
            ]),
            SizedBox(height: 20),
            Divider(
                height: 1,
                color: ThemeColors.neutralColorLight.withOpacity(0.5))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatsWidget(
              // To do: fix loading the asset
              icon: ThemeIcons.shop,
              number: profile.remaining_points.toString(),
              // number: '5',
              label: AppLocalizations.of(context)!.profile_page_stats_rainbows,
            ),
            SizedBox(width: 20),
            StatsWidget(
                icon: Icons.rotate_right,
                //  number: profile.streak.toString(),
                number: profile.remaining_points.toString(),
                label: AppLocalizations.of(context)!
                    .profile_page_stats_active_weeks),
          ],
        )
      ]);
    },
  );
}

class _UserProfileInfo extends StatelessWidget {
  const _UserProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text('Logout'),
      onPressed: () {
        //  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
      },
    );
  }
}
