import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

// This page is a suggestion on how the home page can look while
// the ArticlesPage() is empty.

class HomeEmptyPage extends StatelessWidget {
  const HomeEmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: ThemeColors.bgColorLight,
        body: SafeArea(
          bottom: true,
          top: true,
          child: MessageWidget(
            icon: Icons.favorite,
            title: 'Šiuo metu turinys ruošiamas, tačiau jau dabar gali'
                ' pradėti spręsti užduotis!',
            //   message:
            //      '<p>Čia galima, esant reikalui, įdėti išsamesnę žinutę su HtmlWidget().'
            //      ' Pavyzdžiui, kai norime lankytojui <strong>suteikti daugiau </strong> '
            //      ' <a href="https://tja.lt">informacijos</a>.</p>',
          ),
        ),
        bottomNavigationBar: BottomMenuWidget());
  }
}
