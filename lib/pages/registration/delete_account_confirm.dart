import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rainbow_challenge/widgets/headline.dart';

class DeleteAccountConfirm extends StatelessWidget {
  const DeleteAccountConfirm({Key? key}) : super(key: key);

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
            Text(
              AppLocalizations.of(context)!.delete_account_confirm,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    ));
  }
}
