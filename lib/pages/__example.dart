import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

// Example page. Testing, playing with widgets and compositions.
class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);
//  static const routeName = 'example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Test'),
            const _ImageSection(
                'https://tja.lt/wp-content/uploads/2021/08/vidutinis.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
              child: Column(
                children: [
                  // _ConnectionInfo(),
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
    );
  }
}

/*
class _ConnectionInfo extends StatelessWidget {
  const _ConnectionInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(builder: (context, state) {
      if (state is InternetConnected &&
          state.connectionType == Connection.Type.Wifi) {
        return Text('Wifi');
      } else if (state is InternetConnected &&
          state.connectionType == ConnectionType.Mobile) {
        return Text('Mobile');
      } else if (state is InternetDisconnected) {
        return Text('No connection');
      }
      return CircularProgressIndicator();
    });
  }
}
*/

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
                .displaySmall!
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
