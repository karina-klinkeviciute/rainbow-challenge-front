import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';

import 'package:rainbow_challenge/bloc/authentication_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  final UserRepository userRepository;

  RegistrationPage({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registracija: | Naujas vartotojas'),
      ),
      body: BlocProvider(
        create: (context) {
          return RegistrationBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: RegistrationForm(),
      ),
    );
  }
}