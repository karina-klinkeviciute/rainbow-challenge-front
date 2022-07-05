import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/login/change_password_form.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/user_setting_page.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/headings.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/widgets/wrapper_custom_appbar.dart';
import 'cubit/profile_info_cubit.dart';
import 'package:rainbow_challenge/bloc/authentication_bloc.dart';
import 'package:rainbow_challenge/theme/icons.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Profile page
// TODO: get medals data and fix conditional view for them.
// TODO: add option to logout.
// TODO: Lithuanian localizations for Vaivorykstes (word variations).

class ProfilePage extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();
  ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileInfoCubit>(context).fetchProfile();
    return WrapperCustomAppbarWidget(
      appBar: AppBar(
        leading: IconButton(
          color: ThemeColors.neutralColorLight,
          icon: Icon(Icons.settings),
          // TODO: go to user settings
          onPressed: () {
            final UserRepository _userRepository = UserRepository();
            BlocProvider.of<AuthenticationBloc>(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (_) =>
                      RegistrationBloc(userRepository: _userRepository),
                  child: UserSettingsForm(),
                ),
              ),
            );
          },
        ),
        actions: [
          TextButton.icon(
            //   style: style,
            label: Text(AppLocalizations.of(context)!.action_logout),
            icon: Icon(Icons.logout),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegistrationPage(
                            userRepository: _userRepository,
                          )));
            },
          ),
        ],
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
      final List profileMedals = profile.medals;
      return Column(children: [
        Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.8],
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
        (profile.region != null)
            ? Text(profile.region!.name,
                style: ThemeHeadings.themeHeading4
                    .merge(TextStyle(color: Colors.black)))
            : Container(),
        Column(
          children: [
            if (profileMedals.length > 0) ...[
              SizedBox(height: 20),
              MiniHeadingLinedWidget(
                  title:
                      AppLocalizations.of(context)!.profile_page_achievements),
              Column(children: <Widget>[
                for (int i = 0; i < profileMedals.length; i++)
                  profileMedals
                      .map((medal) => _medal(medalType: medal.level))
                      .toList()[i]
              ]),
            ],
            // END HERE

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
              icon: ThemeIcons.shop,
              number: profile.remaining_points.toString(),
              label: AppLocalizations.of(context)!.profile_page_stats_rainbows,
            ),
            SizedBox(width: 20),
            StatsWidget(
                icon: Icons.rotate_right,
                number: profile.streak?.streak.toString() ?? '0',
                label: AppLocalizations.of(context)!
                    .profile_page_stats_active_weeks),
          ],
        ),
        TextButton(
          onPressed: () {
            final UserRepository _userRepository = UserRepository();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (_) =>
                      RegistrationBloc(userRepository: _userRepository),
                  child: ChangePasswordForm(),
                ),
              ),
            );
          },
          child: Text('Change password'),
        )
      ]);
    },
  );
}

class _medal extends StatelessWidget {
  _medal({Key? key, required this.medalType}) : super(key: key);
  final String medalType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ImageLocalWidget(
        url: 'assets/images/achievements/medal_${medalType}.png',
        width: 60,
      ),
    );
  }
}
