import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rainbow_challenge/theme/colors.dart';
// import 'package:url_launcher/url_launcher.dart';

// A widget that uses flutter_html package to render html. This custom widget
// adds some basic styling to the rendered content.

// TO DO: integrate url_launcher package to html widget.
// It's not working at the moment.

class HtmlWidget extends StatelessWidget {
  final String data;
  // Optional parameter `center` lets you apply global centering of text where needed.
  // Centering of text is useful for short texts snippets (e.g., in MessageWidget())
  final bool center;

  const HtmlWidget({Key? key, required this.data, this.center = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Html(data: data,
        // TO DO: Make links work with url_launcher
        //onLinkTap: (url) async {
        //  if (await canLaunch(url)) {
        //    await launch(
        //      url,
        //    );
        //  } else {
        //    throw 'Could not launch $url';
        //  }
        // },
        style: {
          'body': Style(
              margin: const EdgeInsets.all(0),
              color: ThemeColors.neutralColor,
              lineHeight: const LineHeight(1.4),
              textAlign: (center == false) ? TextAlign.left : TextAlign.center),
          'p': Style(margin: const EdgeInsets.only(bottom: 10)),
          'a': Style(color: ThemeColors.secondaryColor)
        });
  }
}
