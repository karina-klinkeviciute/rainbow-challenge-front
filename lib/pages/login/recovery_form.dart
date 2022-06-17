import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_event.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_state.dart';
import 'package:rainbow_challenge/pages/registration/fields/email_recovery.dart';
import 'package:rainbow_challenge/pages/registration/recovery_confirm.dart';
import 'package:rainbow_challenge/widgets/auth_text_field.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/widgets/headline.dart';
import 'package:rainbow_challenge/pages/registration/registration_confirm.dart';

class RecoveryEmailForm extends StatelessWidget {
  const RecoveryEmailForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegState>(
        listener: (context, state) {
          // if (state.status.isSubmissionFailure) {
          //   _msg(context, state.errorMessage);
          // } else
          if (state.status.isSubmissionSuccess ||
              state.status.isSubmissionFailure) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecoveryPageConfirm()));
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(38.0, 20, 38.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeadlineWidget(title: 'Naujas vartotojas'),
              _RecoveryEmailInputField(),
              _RecoverySubmit(),
            ],
          ),
        ));
  }
}

class _RecoveryEmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'Įvesk el. pašto adresą',
            key: const Key('Recovery_email_textField'),
            isRequiredField: true,
            error: state.email.error != null
                ? (state.email.error as EmailRecoveryValidationError).title
                : null,
            keyboardType: TextInputType.emailAddress,
            onChanged: (email_recovery) => context
                .read<RegistrationBloc>()
                .add(RecoveryEmailChanged(email_recovery: email_recovery)),
          ),
        );
      },
    );
  }
}

class _RecoverySubmit extends StatelessWidget {
  const _RecoverySubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            child: Text('Submit Email'),
            onPressed: state.status.isValidated
                ? () => context
                    .read<RegistrationBloc>()
                    .add(EmailRecoverySubmitted())
                : null,
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