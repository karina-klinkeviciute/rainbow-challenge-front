import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';

import 'package:rainbow_challenge/bloc/authentication_bloc.dart';
import 'package:rainbow_challenge/pages/login/bloc/login_bloc.dart';
import 'package:rainbow_challenge/pages/login/login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
