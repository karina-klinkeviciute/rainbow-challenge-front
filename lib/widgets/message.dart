import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/html.dart';

// A message widget that can be used in dialog messages, action boxes
// and similar.
// TO DO: More styles, (animated) illustrations can be added here in the future.

class MessageWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? message;
  // const MessageWidget({ Key  key }) : super(key: key);

  const MessageWidget(
      {Key? key,
      this.icon = Icons.info_outline,
      required this.title,
      this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            Stack(children: [
              const SizedBox(
                width: 100,
                height: 90,
              ),
              Positioned(
                top: 25,
                left: 5,
                child: ClipOval(
                  child: Container(
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ThemeColors.secondaryColor.withOpacity(0.4),
                        //  boxShadow: BoxShadow
                      )),
                ),
              ),
              Positioned(
                top: 35,
                left: 0,
                child: ClipOval(
                  child: Container(
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ThemeColors.tetriaryColor.withOpacity(0.5),
                        //  boxShadow: BoxShadow
                      )),
                ),
              ),
              Positioned(
                top: 35,
                right: 0,
                child: ClipOval(
                  child: Container(
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        //  boxShadow: BoxShadow
                      )),
                ),
              ),
              Positioned(
                top: 2,
                left: 20,
                child: Icon(icon,
                    color: ThemeColors.primaryColor,
                    size: 60,
                    semanticLabel: title),
              ),
            ]),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3!.merge(
                  const TextStyle(color: ThemeColors.primaryColor, height: 1)),
            ),
            const SizedBox(height: 10),
            if (message != null)
              Center(child: HtmlWidget(data: message!, center: true))
          ]),
        ),
      ],
    );
  }
}
