import 'package:flutter/material.dart';
import 'package:rainbow_challenge/utils/repository/texts_repository.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/about_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WrapperMainWidget(mainArea: _PageContent());
  }
}

class _PageContent extends StatelessWidget {
  const _PageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        const ImageLocalWidget(
            url: 'assets/images/dialogs/thanks.png', width: 300),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeadlineWidget(
                    title: AppLocalizations.of(context)!.about_page_title),
                _About(),
                _Logos(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _About extends StatelessWidget {
  const _About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AboutCubit>(context)
        .fetchText('b2197f44-b4ce-491b-b1aa-9852a44845fa');
    return BlocBuilder<AboutCubit, AboutState>(builder: (context, state) {
      if (!(state is AboutLoaded))
        return Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CircularProgressIndicator(),
        ));
      final about = (state).text;
      return HtmlWidget(data: about.body);
    });
  }
}

class _Logos extends StatelessWidget {
  const _Logos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = 110;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeadingLinedWidget(
              title: AppLocalizations.of(context)!.about_page_logos),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_ac.png',
                width: 220,
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/tja.jpg',
                width: _width,
              ),
              const SizedBox(width: 20),
              Image.asset(
                'assets/images/logo_jra.png',
                width: _width,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_rosa.png',
                width: _width,
              ),
              const SizedBox(width: 20),
              Image.asset(
                'assets/images/logo_frida.png',
                width: _width,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const _url = 'https://tja.lt';
void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
