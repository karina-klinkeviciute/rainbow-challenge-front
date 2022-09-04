import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/pages/challenges/challenges_page.dart';
import 'package:rainbow_challenge/pages/challenges/cubit/challenges_cubit.dart';
import 'package:rainbow_challenge/pages/login/login_page.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_class.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

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
            'Teisingai atsakei ${count} klausimų',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Tau įskaičiuota ${count} vaivorykščių',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            child: Text('Grįžti į užduotis'),
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
