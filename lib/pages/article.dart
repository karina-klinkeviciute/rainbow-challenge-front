import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

// A single article page.
// TO DO: continue with both layout and functionality
class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Image.asset('assets/images/placeholder4.jpg', fit: BoxFit.cover),
        Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(children: const [_TitleSection(), _TextSection()])),
        ),
      ]),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('2021 09 08'),
          SizedBox(height: 5),
          Text(
            'Article title comes here. It might be short and it might be long.',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, height: 1.2),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  const _TextSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HtmlWidget(
        data: '<p>Content with html tags comes here. <strong>This is bold text'
            '</strong> and <em>this is italics</em>.</p><p>Next paragraph comes here. '
            'Here comes a <a href="https://rainbowchallenge.lt">link</a>.</p>');
  }
}
