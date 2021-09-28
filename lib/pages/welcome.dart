import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/theme/headings.dart';

import 'dart:math' as math;

// A welcome page that could be showed after the app has loaded.
// TO DO: add functionality

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.bgColor,
        body: Center(
            child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height - 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // children: [_HeadLine(), _Login(), _Register()],
                children: [
                  const _HeadLine(),
                  ElevatedButton(
                    child: Text('Prisijungti'.toUpperCase()),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 5),
                  OutlinedButton(
                    child: Text('Registruotis'.toUpperCase()),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text('Taisyklės'),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text('Sąlygos'),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/active-citizens.png', height: 50),
                  const SizedBox(width: 15),
                  Image.asset('assets/images/tja.jpg'),
                ],
              ),
            ),
          ],
        )));
  }
}

class _HeadLine extends StatelessWidget {
  final String headline;

  const _HeadLine({this.headline = "Rainbow Challenge"});
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 30.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(),
        child: Text(headline.toUpperCase(),
            textAlign: TextAlign.center, style: ThemeHeadings.mainTitle),
      ),
    );
  }
}
