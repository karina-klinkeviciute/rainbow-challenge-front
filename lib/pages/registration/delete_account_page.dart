import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/pages/registration/delete_account_confirm.dart';
import 'package:rainbow_challenge/pages/registration/fields/current_password.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/widgets/auth_text_field.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_event.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_state.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository();

    return BlocListener<RegistrationBloc, RegState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            _msg(context, state.errorMessage);
          } else if (state.status.isSubmissionSuccess) {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text(
            //     'Užklausa pavyko',
            //     textAlign: TextAlign.center,
            //   ),
            //   backgroundColor: Colors.green,
            // ));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DeleteAccountConfirm()));
          }
        },
        child: WrapperMainWidget(
          index: 1,
          mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeadlineWidget(
                    title: AppLocalizations.of(context)!.delete_account),
                _CurrentPasswordInputField(),
                _DeleteSubmit(),
              ],
            ),
          ),
        ));
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

class _DeleteSubmit extends StatelessWidget {
  const _DeleteSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 20),
          child: ElevatedButton(
              child: Text(AppLocalizations.of(context)!.delete_account),
              onPressed: () =>
                  context.read<RegistrationBloc>().add(SendDeleteRequest())),
        );
      },
    );
  }
}

void _msg(_, txt) {
  ScaffoldMessenger.of(_).showSnackBar(SnackBar(
    content: Text(AppLocalizations.of(_)!.wrong_password),
    backgroundColor: Colors.redAccent,
  ));
}
