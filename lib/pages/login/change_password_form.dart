import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_event.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_state.dart';
import 'package:rainbow_challenge/pages/registration/fields/current_password.dart';
import 'package:rainbow_challenge/pages/registration/fields/new_password.dart';
import 'package:rainbow_challenge/pages/registration/fields/re_new_password.dart';
import 'package:rainbow_challenge/pages/registration/password_change_confirm.dart';
import 'package:rainbow_challenge/pages/registration/registration_confirm.dart';
import 'package:rainbow_challenge/pages/registration/registration_form.dart';
import 'package:rainbow_challenge/widgets/auth_text_field.dart';
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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PasswordChangeConfirm()));
          }
        },
        child: WrapperMainWidget(
          useAppBar: false,
          index: 1,
          mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeadlineWidget(title: 'Keisti slaptažodį'),
                _NewPasswordInputField(),
                _ReNewPasswordInput(),
                _CurrentPasswordInputField(),
                _PassworsSetSubmit()
              ],
            ),
          ),
        ));
  }
}

class _NewPasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) =>
          previous.newPassword != current.newPassword,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'Slaptažodis',
            key: const Key('Password_textField'),
            isPasswordField: true,
            isRequiredField: true,
            keyboardType: TextInputType.text,
            error: state.newPassword.error != null
                ? (state.newPassword.error as NewPasswordValidationError).title
                : null,
            onChanged: (newPassword) => context
                .read<RegistrationBloc>()
                .add(NewPasswordChanged(newPassword: newPassword)),
          ),
        );
      },
    );
  }
}

class _ReNewPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) =>
          previous.newPassword != current.newPassword ||
          previous.reNewPassword != current.reNewPassword,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'Pakartokite slaptažodį',
            isRequiredField: true,
            key: const Key('RePassword_textField'),
            isPasswordField: true,
            keyboardType: TextInputType.text,
            error: state.reNewPassword.error != null
                ? (state.reNewPassword.error as ReNewPasswordValidationError)
                    .name
                : null,
            onChanged: (reNewPassword) => context
                .read<RegistrationBloc>()
                .add(ReNewPasswordChanged(reNewPassword: reNewPassword)),
          ),
        );
      },
    );
  }
}

class _PassworsSetSubmit extends StatelessWidget {
  const _PassworsSetSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            child: Text('Keisti slaptažodį'),
            onPressed: state.status.isValidated
                ? () => context
                    .read<RegistrationBloc>()
                    .add(PasswordResetSubmitted())
                : null,
          ),
        );
      },
    );
  }
}

class _CurrentPasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) =>
          previous.currentPassword != current.currentPassword,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'Dabartinis slaptažodis',
            key: const Key('Password_textField'),
            isPasswordField: true,
            isRequiredField: true,
            keyboardType: TextInputType.text,
            error: state.currentPassword.error != null
                ? (state.currentPassword.error
                        as CurrentPasswordValidationError)
                    .title
                : null,
            onChanged: (currentPassword) => context
                .read<RegistrationBloc>()
                .add(CurrentPasswordChanged(currentPassword: currentPassword)),
          ),
        );
      },
    );
  }
}

void _msg(_, txt) {
  ScaffoldMessenger.of(_).showSnackBar(SnackBar(
    content: Text(txt),
    backgroundColor: Colors.redAccent,
  ));
}
