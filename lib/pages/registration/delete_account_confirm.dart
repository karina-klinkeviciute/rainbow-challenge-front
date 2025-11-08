import 'package:flutter/material.dart';
import 'package:rainbow_challenge/localization/app_localizations.dart'; 
import 'package:rainbow_challenge/widgets/headline.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/bloc/authentication_bloc.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';

class DeleteAccountConfirm extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();
  DeleteAccountConfirm({Key? key}) : super(key: key);

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
            HeadlineWidget(title: AppLocalizations.of(context)!.delete_account),
            SizedBox(height: 50),
            Text(AppLocalizations.of(context)!.delete_account_confirm,
                textAlign: TextAlign.center),
            TextButton.icon(
              //   style: style,
              label: Text(AppLocalizations.of(context)!.action_logout),
              icon: Icon(Icons.logout),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationPage(
                              userRepository: _userRepository,
                            )));
              },
            ),
          ],
        ),
      ),
    ));
  }
}
