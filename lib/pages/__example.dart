import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/colored_area.dart';
import 'package:rainbow_challenge/widgets/heading_lined.dart';
import 'package:rainbow_challenge/widgets/headline.dart';
import 'package:rainbow_challenge/widgets/html.dart';
import 'package:rainbow_challenge/widgets/bottom_menu.dart';

// Example page. Testing, playing with widgets and compositions.
class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _ImageSection(
                  'https://tja.lt/wp-content/uploads/2021/08/vidutinis.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
                child: Column(
                  children: [
                    const HeadingLinedWidget(title: 'Labas rytas'),
                    const ColoredAreaWidget(
                      content: Text("labas rytas"),
                      //  backgroundColor: ThemeColors.primaryColor
                    ),
                    const _TitleSection(
                        '2021 08 16',
                        'This title can be long, and it also can be short.'
                            ' It depends.'),
                    _textSection,
                    const HeadlineWidget(
                        title: 'Užduotys',
                        subtitle: 'Labas! Smagu tave matyti ir vėl!'),
                    const HeadlineWidget(title: 'Regionai'),
                    ElevatedButton(
                      child: Text('Prisijungti'.toUpperCase()),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 5),
                    OutlinedButton(
                      child: Text('Prisijungti'.toUpperCase()),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                      child: const Text('Prisijungti'),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomMenuWidget());
  }
}

class _ImageSection extends StatelessWidget {
  final String src;
  const _ImageSection(this.src);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.network(
        src,
        fit: BoxFit.cover,
      ),
    );
  }
}

// A local class that consists of date, title and a divider used above the
// main content of the article.
class _TitleSection extends StatelessWidget {
  final String date;
  final String title;

  const _TitleSection(this.date, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date),
          const SizedBox(height: 5),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .merge(const TextStyle(color: Colors.black, height: 1)),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

Widget _textSection = const HtmlWidget(
    data: '<p>Content with html tags comes here. <strong>This is bold text'
        '</strong> and <em>this is italics</em>.</p><p>Next paragraph comes here. '
        'Content with html tags comes here. Content with html tags comes here.'
        ' <strong>This is bold text'
        '</strong> and <em>this is italics</em>.</p><p>Next paragraph comes here. '
        'Here comes a <a href="https://rainbowchallenge.lt">link</a>.'
        ' Content with html tags comes here. <strong>This is bold text'
        '</strong> and <em>this is italics</em>.</p><p>Next paragraph comes here. '
        'Here comes more text that we are writing here. A placeholder.'
        ' Content with html tags comes here. <strong>This is bold text'
        '</strong> and <em>this is italics</em>.</p><p>Next paragraph comes here. '
        'Here comes a <a href="https://rainbowchallenge.lt">link</a>.</p>'
        '<p>Content with html tags comes here. <strong>This is bold text'
        '</strong> and <em>this is italics</em>.</p><p>Next paragraph comes here. ');
