import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/widgets/headline.dart';
import 'package:rainbow_challenge/widgets/html.dart';
//import 'package:rainbow_challenge/pages/registration/fields/email.dart';
import 'package:rainbow_challenge/widgets/auth_text_field.dart';
import 'package:rainbow_challenge/pages/registration/fields/password.dart';
import 'package:rainbow_challenge/pages/registration/fields/confirm_password.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_event.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_state.dart';
import 'package:rainbow_challenge/pages/registration/registration_confirm.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            _msg(context,'Registracija nesėkminga. Toks vartotojas egzistuoja.');
          } else if (state.status.isSubmissionSuccess) {
            //Navigator.of(context).pushNamed('/success');
            Navigator.push(context,MaterialPageRoute(builder: (context) => RegistrationPageConfirm()));
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(38.0, 0, 38.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeadlineWidget(title: 'Naujas vartotojas'),

              _EmailInputField(),
              _PasswordInputField(),
              _ConfirmPasswordInput(),
              //_NameInputField(),
              //_AgeInputField(),
              //_GenderInputField(),
              //_GenderOtherInputField(),
              //_UsernameInputField(),
              //_RegionInputField(),
              //_IsLgbtqiaInputField(),
              _RulesCheckbox(),
              _RegSubmit()
            ],
          ),
        )
    );
  }

}

/*
Widget _ageField(title, nvalue, items) {

  return Column(
    //mainAxisAlignment: MainAxisAslignment.center,
    children: [

      DropdownButton<int>(
          hint: Text(title),
          value: ageSelected,
          items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((int value) {
            return new DropdownMenuItem<int>(
              value: value,
              child: new Text(value.toString()),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              ageSelected = val!;
            });
          }),
    ],
  );
}
 */

class _AgeInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'Amžius',
            key: const Key('Age_textField'),
            isRequiredField: true,
            keyboardType: TextInputType.text,
            onChanged: (name) => context.read<RegistrationBloc>().add(NameChanged(name: name)),
          ),
        );
      },
    );
  }
}

class _EmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'El. pašto adresas',
            key: const Key('Email_textField'),
            isRequiredField: true,
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) => context.read<RegistrationBloc>().add(EmailChanged(email: email)),
          ),
        );
      },
    );
  }
}

class _PasswordInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'Slaptažodis',
            key: const Key('Password_textField'),
            isPasswordField: true,
            isRequiredField: true,
            keyboardType: TextInputType.text,
            error: state.password.error.name,
            onChanged: (password) =>
                context.read<RegistrationBloc>().add(PasswordChanged(password: password)),
          ),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) =>
      previous.password != current.password ||
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return AuthTextField(
          hint: 'Pakartokite slaptažodį',
          isRequiredField: true,
          key: const Key('RePassword_textField'),
          isPasswordField: true,
          keyboardType: TextInputType.text,
          error: state.confirmPassword.error.name,
          onChanged: (confirmPassword) => context
              .read<RegistrationBloc>()
              .add(ConfirmPasswordChanged(confirmPassword: confirmPassword)),
        );
      },
    );
  }
}


class _GenderInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'Lytis',
            key: const Key('Gender_textField'),
            isRequiredField: false,
            keyboardType: TextInputType.text,
            onChanged: (name) => context.read<RegistrationBloc>().add(NameChanged(name: name)),
          ),
        );
      },
    );
  }
}

class _GenderOtherInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'GenderOther',
            key: const Key('GenderOther_textField'),
            isRequiredField: false,
            keyboardType: TextInputType.text,
            onChanged: (name) => context.read<RegistrationBloc>().add(NameChanged(name: name)),
          ),
        );
      },
    );
  }
}


class _UsernameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'Username',
            key: const Key('Username_textField'),
            isRequiredField: false,
            keyboardType: TextInputType.text,
            onChanged: (name) => context.read<RegistrationBloc>().add(NameChanged(name: name)),
          ),
        );
      },
    );
  }
}

class _RegionInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'Regionas',
            key: const Key('Region_textField'),
            isRequiredField: false,
            keyboardType: TextInputType.text,
            onChanged: (name) => context.read<RegistrationBloc>().add(NameChanged(name: name)),
          ),
        );
      },
    );
  }
}

class _IsLgbtqiaInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'IsLgbtqia',
            key: const Key('IsLgbtqia_textField'),
            isRequiredField: false,
            keyboardType: TextInputType.text,
            onChanged: (name) => context.read<RegistrationBloc>().add(NameChanged(name: name)),
          ),
        );
      },
    );
  }
}

class _RulesCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.rules != current.rules,
      builder: (context, state) {
        return
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                    child:
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {
                        //setState(() {
                        //this.value = value!;
                        //isCheckedRules = this.value;
                        // });
                      },
                      //onChanged: (rules) => context.read<RegistrationBloc>().add(RulesChanged(rules: rules)),
                    ),
                  ),
                ],
               ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 225,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: HtmlWidget(
                            data: '<p>Aš sutinku su paslaugų <a href="https://rainbowchallenge.lt/taisykles/">taisyklėmis</a><br> ir <a href="https://rainbowchallenge.lt/privatumas/">privatumo politika</a>.</p>'
                        ),
                      ),

                    ),
                  ],
                ),
              ],
          );

          /*
          Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'IsLgbtqia',
            key: const Key('IsLgbtqia_textField'),
            isRequiredField: false,
            keyboardType: TextInputType.text,
            onChanged: (name) => context.read<RegistrationBloc>().add(NameChanged(name: name)),
          ),
        );
        */
      },
    );
  }
}

class _RegSubmit extends StatelessWidget {
  const _RegSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            child: Text('Registruotis'),
            onPressed: state.status.isValidated
                ? () => context.read<RegistrationBloc>().add(FormSubmitted())
                : null,
          ),
        );
      },
    );
  }
}




void _msg(_,txt){
  ScaffoldMessenger.of(_).showSnackBar(SnackBar(
    content: Text(txt),
    backgroundColor: Colors.redAccent,
  ));
}