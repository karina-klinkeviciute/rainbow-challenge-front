import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/constants/drop_down_lists.dart';
import 'package:rainbow_challenge/pages/login/recovery_page.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/model/gender_model/gender_model.dart';
import 'package:rainbow_challenge/utils/model/region/region_class.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';
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

import 'fields/email.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(38.0, 20, 38.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeadlineWidget(title: 'Naujas vartotojas'),
              _EmailInputField(),
              _PasswordInputField(),
              _ConfirmPasswordInput(),
              //_NameInputField(),
              _AgeInputField(),
              _GenderInputField(),
              _GenderOtherInputField(),
              // _UsernameInputField(),
              _RegionInputField(),
              //_IsLgbtqiaInputField(),
              _RulesCheckbox(),
              _RegSubmit(),
              SignInButton(
                Buttons.Google,
                text: "Registruotis su Google", // TODO: localisations
                onPressed: () => _handleGoogleRegister(context),
              ),
              _LoginButton(context),
              _recoveryPassword(context)
            ],
          ),
        ));
  }
}

_handleGoogleRegister (BuildContext ctx) {
  print("wassup");
}

Widget _LoginButton(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginPage(
                    userRepository: UserRepository(),
                  )));
    },
    child: const Text('Turi paskyrą? Prisijunk'), //TODO localizations
  );
}

Widget _recoveryPassword(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => RecoveryPage(
                    userRepository: UserRepository(),
                  )));
    },
    child: const Text(
      'Užmiršai slaptažodį? Spausk čia',
      textAlign: TextAlign.center,
    ), //TODO localizations
  );
}

class _AgeInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    int currentYear = dateTime.year;
    int oldestYear = currentYear - 100;
    List<DropdownMenuItem<int>> _years = <int>[
      for (var i = currentYear; i >= oldestYear; i--) i
    ].map((int value) {
      return new DropdownMenuItem<int>(
        value: value,
        child: new Text(value.toString()),
      );
    }).toList();

    var _selectedValue;

    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) =>
          previous.year_of_birth != current.year_of_birth,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: DropdownButtonFormField<int>(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 3),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ThemeColors.primaryColor, width: 1))),
            hint: Text('Gimimo metai*'),
            isDense: false,
            value: _selectedValue,
            key: const Key('Age_textField'),
            onChanged: (year_of_birth) => context
                .read<RegistrationBloc>()
                .add(YearOfBirthChanged(year_of_birth: year_of_birth ?? 0)),
            items: _years,
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
            error: state.email.error != null
                ? (state.email.error as EmailValidationError).title
                : null,
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) => context
                .read<RegistrationBloc>()
                .add(EmailChanged(email: email)),
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
            error: state.password.error.title,
            onChanged: (password) => context
                .read<RegistrationBloc>()
                .add(PasswordChanged(password: password)),
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
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: AuthTextField(
            hint: 'Pakartokite slaptažodį',
            isRequiredField: true,
            key: const Key('RePassword_textField'),
            isPasswordField: true,
            keyboardType: TextInputType.text,
            error: state.confirmPassword.error.name,
            onChanged: (confirmPassword) => context
                .read<RegistrationBloc>()
                .add(ConfirmPasswordChanged(confirmPassword: confirmPassword)),
          ),
        );
      },
    );
  }
}

class _GenderInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> _genders = [
      DropdownMenuItem(
        child: Text('Moteris'),
        value: Genders().woman,
      ),
      DropdownMenuItem(
        child: Text('Vyras'),
        value: Genders().man,
      ),
      DropdownMenuItem(
        child: Text('Nebinarinė'),
        value: Genders().nonBinary,
      ),
      DropdownMenuItem(
        child: Text('Kita'),
        value: Genders().other,
      ),
      DropdownMenuItem(
        child: Text('Nenoriu nurodyti'),
        value: Genders().preferNotToSay,
      )
    ];
    var _selectedValue;

    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 3),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: ThemeColors.primaryColor, width: 1),
              ),
            ),
            hint: Text('Lytis*'),
            isDense: false,
            value: _selectedValue,
            key: const Key('Gender_textField'),
            onChanged: (gender) => context
                .read<RegistrationBloc>()
                .add(GenderChanged(gender: gender ?? 'man')),
            items: _genders,
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
      buildWhen: (previous, current) =>
          current.gender_other.value != '' || current.gender.value == 'other',
      builder: (context, state) {
        if (state.gender_other.value != '' || state.gender.value == 'other') {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: AuthTextField(
              hint: 'Lytis, jei kita',
              key: const Key('GenderOther_textField'),
              isRequiredField: false,
              keyboardType: TextInputType.text,
              onChanged: (genderOther) => context
                  .read<RegistrationBloc>()
                  .add(GenderOtherChanged(genderOther: genderOther)),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

// class _UsernameInputField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegistrationBloc, RegState>(
//       buildWhen: (previous, current) => previous.username != current.username,
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 16.0),
//           child: AuthTextField(
//             hint: 'Username',
//             key: const Key('Username_textField'),
//             isRequiredField: false,
//             keyboardType: TextInputType.text,
//             onChanged: (username) => context
//                 .read<RegistrationBloc>()
//                 .add(UserNameChanged(username: username)),
//           ),
//         );
//       },
//     );
//   }
// }

class _RegionInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> _regions = [];
    var regi = RegionDropDownLists.regionList
        .map((e) => RegionModel.fromJson(e))
        .toList();
    regi.sort((a, b) => a.name.compareTo(b.name));
    var regionsList = regi.forEach((element) {
      _regions.add(DropdownMenuItem(
        child: Text(
          element.name,
          style: TextStyle(fontSize: 20),
        ),
        value: element.uuid,
      ));
    });
    var _selectedValue;

    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.region != current.region,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: DropdownButtonFormField<String>(
            isExpanded: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 3),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ThemeColors.primaryColor, width: 1))),
            value: _selectedValue,
            isDense: false,
            hint: Text(
              'Regionas*',
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: true),
            ),
            key: const Key('Region_textField'),
            items: _regions,
            onChanged: (regionId) => context
                .read<RegistrationBloc>()
                .add(RegionChanged(regionId: regionId!)),
          ),
        );
      },
    );
  }
}

// class _IsLgbtqiaInputField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegistrationBloc, RegState>(
//       buildWhen: (previous, current) => previous.name != current.name,
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 16.0),
//           child: AuthTextField(
//             hint: 'IsLgbtqia',
//             key: const Key('IsLgbtqia_textField'),
//             isRequiredField: false,
//             keyboardType: TextInputType.text,
//             onChanged: (name) =>
//                 context.read<RegistrationBloc>().add(NameChanged(name: name)),
//           ),
//         );
//       },
//     );
//   }
// }

class _RulesCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegState>(
      buildWhen: (previous, current) => previous.rules != current.rules,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                  child: Checkbox(
                    value: state.rules.value,
                    onChanged: (bool? value) {
                      //setState(() {
                      //this.value = value!;
                      //isCheckedRules = this.value;
                      // });
                      context
                          .read<RegistrationBloc>()
                          .add(RulesChanged(rules: value ?? false));
                    },
                    //onChanged: (bool?rules) => context.read<RegistrationBloc>().add(RulesChanged(rules: rules)),
                  ),
                ),
              ],
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: HtmlWidget(
                        data:
                            '<p>Aš sutinku su paslaugų <a href="https://rainbowchallenge.lt/taisykles/">taisyklėmis</a><br> ir <a href="https://rainbowchallenge.lt/privatumas/">privatumo politika</a>.</p>'),
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

void _msg(_, txt) {
  var er = txt.toString();
  if (er.contains(RegExp('[)]|[(]|[}]|[{]|\\]|[[]'))) {
    er = er.replaceAll(RegExp('[)]|[(]|[}]|[{]|\\]|[[]'), '');
  }
  er = er.replaceAll(RegExp('Å¡'), 'š');

  ScaffoldMessenger.of(_).showSnackBar(SnackBar(
    content: Text(er),
    backgroundColor: Colors.redAccent,
  ));
}
