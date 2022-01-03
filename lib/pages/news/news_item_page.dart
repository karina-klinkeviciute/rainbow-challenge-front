import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:intl/intl.dart';

// TODO: date format adapted for different languages/countries

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
                      Text(DateFormat('yyyy MM dd').format(date)),
                      // Text(date.toString("yyyy MM dd")),
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
