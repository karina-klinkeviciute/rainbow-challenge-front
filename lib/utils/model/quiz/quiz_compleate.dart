import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/constants/app.dart';
import 'package:rainbow_challenge/pages/challenges/challenges_page.dart';
import 'package:rainbow_challenge/pages/challenges/cubit/challenges_cubit.dart';
import 'package:rainbow_challenge/pages/login/login_page.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/utils/model/challenge/challenge_class.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';

class QuizPageConfirm extends StatelessWidget {
  final int count;
  const QuizPageConfirm({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: SafeArea(
          bottom: true,
          top: true,
          child: Column(children: [
            Text(
              'Slaptažodžio atstatymo nuoroda nusiųsta nurodytu el. pašto adresu',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              child: Text('You answer correct on ${count - 1} question'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewsPage();
                    },
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
