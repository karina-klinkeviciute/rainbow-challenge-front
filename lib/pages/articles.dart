import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/image_external.dart';

// Articles page that will be used as a landing page for those who log in.
// TO DO: Everything. Articles list will be added here.
// Now it's just an empty space.

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [
        ImageExternalWidget(url: 'URL', width: 80, height: 80)
      ]),
    );
  }
}
