import 'package:flutter/material.dart';

class RegistrationPageConfirm extends StatelessWidget {
  const RegistrationPageConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //  backgroundColor: ThemeColors.bgColorLight,
        body: SafeArea(
            bottom: true,
            top: true,
            child: Text('Registracija sėkminga.')
        )
    );
  }
}