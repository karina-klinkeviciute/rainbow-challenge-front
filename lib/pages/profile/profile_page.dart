import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/profile/cubit/profile_info_cubit.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Profile page
// Data now:
// username, region, all_points
// Design prio: points, username
// To do: profile - get streaks and other nested data.
// Get region names from their uuids.
// Streaks design.

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
      useAppBar: false,
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
        MessageWidget(
          icon: ThemeIcons.profile,
          title: profile.username ?? profile.email,
          // Get region name instead of uuid
          //  message: profile.region,
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatsWidget(
              // To do: fix loading the asset
              localIcon: 'assets/icons/rainbow.svg',
              icon: Icons.looks,
              number: profile.all_points.toString(),
              label: AppLocalizations.of(context)!.profile_page_stats_rainbows,
            ),
            SizedBox(width: 20),
            StatsWidget(
                icon: Icons.rotate_right,
                number: '2',
                label: AppLocalizations.of(context)!
                    .profile_page_stats_active_weeks),
          ],
        )
      ]);
    },
  );
}
