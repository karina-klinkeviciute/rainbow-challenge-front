import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/login/recovery_form.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_event.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_state.dart';
import 'package:rainbow_challenge/pages/registration/fields/email.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/widgets/auth_text_field.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

class RecoveryPage extends StatelessWidget {
  final UserRepository userRepository;

  RecoveryPage({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      child: BlocProvider(
          create: (_) => RegistrationBloc(userRepository: userRepository),
          child: RecoveryEmailForm()),
    ));
  }
}
