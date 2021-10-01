import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/headline.dart';
import 'package:rainbow_challenge/widgets/html.dart';
import 'package:rainbow_challenge/widgets/image_external.dart';
import 'package:rainbow_challenge/widgets/wrapper_main.dart';
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
        const ImageExternalWidget(
            borderRadius: 0,
            url: 'https://tja.lt/wp-content/uploads/2021/08/vidutinis.png'),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeadlineWidget(title: 'Apie projektą'),
                const HtmlWidget(
                    data:
                        '<p>Content with html tags comes here. <strong>This is bold text'
                        '</strong> and <em>this is italics</em>.</p><p>Next paragraph comes here. '
                        'Content with html tags comes here. Content with html tags comes here.'
                        ' <strong>This is bold text'
                        '</strong> and <em>this is italics</em>.</p><p>Next paragraph comes here. '
                        'Here comes a <a href="https://rainbowchallenge.lt">link</a>.'),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Daugiau apie mus'.toUpperCase()),
                  onPressed: () {
                    _launchURL();
                  },
                ),
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
