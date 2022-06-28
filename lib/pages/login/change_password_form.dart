import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_state.dart';
import 'package:rainbow_challenge/pages/registration/registration_confirm.dart';
import 'package:rainbow_challenge/pages/registration/registration_form.dart';
import 'package:rainbow_challenge/widgets/headline.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            _msg(context, state.errorMessage);
          } else if (state.status.isSubmissionSuccess) {
            //Navigator.of(context).pushNamed('/success');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrationPageConfirm()));
          }
        },
        child: WrapperMainWidget(
          mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeadlineWidget(title: 'Chenge Password'),
                PasswordInputField(),
                ConfirmPasswordInput(),
              ],
            ),
          ),
        ));
  }
}

void _msg(_, txt) {
  ScaffoldMessenger.of(_).showSnackBar(SnackBar(
    content: Text(txt),
    backgroundColor: Colors.redAccent,
  ));
}
