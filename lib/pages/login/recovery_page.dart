import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/login/recovery_form.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class RecoveryPage extends StatelessWidget {
  final UserRepository userRepository;

  RecoveryPage({Key? key, required this.userRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      useAppBar: true,
      mainArea: SafeArea(
        top: true,
        child: BlocProvider(
            create: (_) => RegistrationBloc(userRepository: userRepository),
            child: RecoveryEmailForm()),
      ),
    );
  }
}
