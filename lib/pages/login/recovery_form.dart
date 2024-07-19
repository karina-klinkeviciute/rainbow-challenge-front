import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_event.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_state.dart';
import 'package:rainbow_challenge/pages/registration/fields/email_recovery.dart';
import 'package:rainbow_challenge/pages/registration/recovery_confirm.dart';
import 'package:rainbow_challenge/pages/registration/registration_page.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';
import 'package:rainbow_challenge/widgets/auth_text_field.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/widgets/headline.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
              Center(child: HeadlineWidget(title: AppLocalizations.of(context)!.new_user)),
              _RecoveryEmailInputField(),
              _RecoverySubmit(),
              Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage(
                                      userRepository: UserRepository(),
                                    )));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.action_register,
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}

class _RecoveryEmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) =>
          previous.email_recovery != current.email_recovery,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: AppLocalizations.of(context)!.enter_email,
            key: const Key('Recovery_email_textField'),
            isRequiredField: true,
            error: state.email_recovery.error != null
                ? (state.email_recovery.error as EmailRecoveryValidationError)
                    .title
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
            child: Text(AppLocalizations.of(context)!.enter_email),
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
