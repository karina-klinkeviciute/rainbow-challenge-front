import 'package:flutter/material.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuizPageConfirm extends StatelessWidget {
  final int count;
  const QuizPageConfirm({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      useAppBar: false,
      index: 2,
      mainArea: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            '${AppLocalizations.of(context)!.correct_answers_amount}: ${count}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '${AppLocalizations.of(context)!.rainbows_added_amount}: ${count}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            child: Text(AppLocalizations.of(context)!.action_back_to_challenges),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NewsPage(index: 2);
                  },
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
