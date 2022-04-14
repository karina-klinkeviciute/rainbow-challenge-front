import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

// About page
// TO DO: further functionality, create and add LogosWidget(), API connection

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
                const HeadlineWidget(title: 'Apie projektą'),
                const HtmlWidget(
                    data:
                        '<p style="text-align:center;">Turinys kuriamas!</p>'),
                const SizedBox(height: 20),
                /*     ElevatedButton(
                  child: Text('Daugiau apie mus'.toUpperCase()),
                  onPressed: () {
                    _launchURL();
                  },
                ),
                */
              ],
            ),
          ),
        ),
      ],
    );
  }
}

const _url = 'https://tja.lt';
void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
