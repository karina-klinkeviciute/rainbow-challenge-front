import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class NewsItemPage extends StatelessWidget {
  NewsItemPage(
      {Key? key,
      required this.title,
      required this.body,
      required this.date,
      this.image})
      : super(key: key);
  String title;
  String body;
  DateTime date;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        if (image != null)
          Hero(
              tag: title,
              child: ImageExternalWidget(
                url: image!,
                borderRadius: 0,
              )),
        Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2021 09 08'),
                      SizedBox(height: 5),
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            height: 1.2),
                      ),
                      Divider(),
                    ],
                  ),
                ),
                HtmlWidget(data: body)
              ])),
        ),
      ]),
    );
  }
}

/*
class _TitleSection extends StatelessWidget {
  const _TitleSection({Key? key, this.title}) : super(key: key);

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
            title,
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
*/