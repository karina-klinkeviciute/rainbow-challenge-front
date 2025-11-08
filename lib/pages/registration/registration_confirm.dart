import 'package:flutter/material.dart';
import 'package:rainbow_challenge/pages/login/login_page.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/localization/app_localizations.dart'; 

class RegistrationPageConfirm extends StatelessWidget {
  const RegistrationPageConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(30.0),
      child: SafeArea(
        bottom: true,
        top: true,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.registration_successful,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.action_login),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(
                        userRepository: UserRepository(),
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    ));
  }
}
