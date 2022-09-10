import 'package:flutter/material.dart';
import 'package:rainbow_challenge/utils/repository/texts_repository.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/about_cubit.dart';

// About page
// TO DO: further functionality, create and add LogosWidget(), API connection

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AboutCubit>(context)
        .fetchText('b2197f44-b4ce-491b-b1aa-9852a44845fa');
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
                const HeadlineWidget(title: 'Apie projektą'),
                _About(),
                const HtmlWidget(
                    data: '<p style="text-align:center;">info@tja.lt</p>'),
                const SizedBox(height: 20),
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
        return Center(child: CircularProgressIndicator());
      final about = (state).text;
      return HtmlWidget(data: about.body);
    });
  }
}

class _Logos extends StatelessWidget {
  const _Logos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            '',
            width: 100,
          ),
        ],
      ),
    );
  }
}

const _url = 'https://tja.lt';
void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
