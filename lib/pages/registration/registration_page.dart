import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/registration_form.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';

class RegistrationPage extends StatelessWidget {
  final UserRepository userRepository;
  const RegistrationPage({Key? key, required this.userRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      child: BlocProvider(
        create: (_) => RegistrationBloc(userRepository: userRepository),
        child: RegistrationForm(),
      ),
    ));
  }
}
