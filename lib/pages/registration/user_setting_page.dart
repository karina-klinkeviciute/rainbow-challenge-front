import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/constants/drop_down_lists.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/model/gender_model/gender_model.dart';
import 'package:rainbow_challenge/utils/model/region/region_class.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_event.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_state.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:rainbow_challenge/pages/registration/delete_account_page.dart';
import 'package:rainbow_challenge/localization/app_localizations.dart'; 
import 'package:rainbow_challenge/localization/localization_helper.dart';

class UserSettingsForm extends StatelessWidget {
  const UserSettingsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository();
    userRepository.getOldUserData().then((value) => context
        .read<RegistrationBloc>()
        .add(GetOldData(
            genderOther: value.genderOther,
            regionName: value.region?.name ?? '',
            regionUuid: value.region?.uuid ?? '',
            username: value.username,
            year_of_birth: value.yearOfBirth,
            gender: value.gender)));

    return BlocListener<RegistrationBloc, RegState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            _msg(context, state.errorMessage);
          } else if (state.status.isSubmissionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                AppLocalizations.of(context)!.settings_changed,
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.green,
            ));
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
                HeadlineWidget(title: AppLocalizations.of(context)!.user_settings),
                _AgeInputField(),
                _RegionInputField(),
                _GenderInputField(),
                // _GenderOtherInputField(),
                // _UsernameInputField(),
                _RegSubmit(),
                TextButton(
                    onPressed: () {
                      final UserRepository _userRepository = UserRepository();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (_) => RegistrationBloc(
                                userRepository: _userRepository),
                            child: DeleteAccountPage(),
                          ),
                        ),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.delete_account)),
              ],
            ),
          ),
        ));
  }
}

class _AgeInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> _years = <int>[
      for (var i = DateTime.now().year; i >= 1930; i--) i
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
            hint: Text('${AppLocalizations.of(context)!.year_of_birth}: ${state.year_of_birth.value}'),
            value: _selectedValue,
            isDense: false,
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

class _GenderInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> _genders = [
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.gender_man),
        value: Genders().man,
      ),
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.gender_woman),
        value: Genders().woman,
      ),
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.gender_non_binary),
        value: Genders().nonBinary,
      ),
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.gender_other),
        value: Genders().other,
      ),
      DropdownMenuItem(
        child: Text(AppLocalizations.of(context)!.gender_prefer_not_to_say),
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
            isDense: false,
            hint: Text('${AppLocalizations.of(context)!.gender}: ${_translate(state.gender.value)}'),
            value: _selectedValue,
            key: const Key('Gender_textField'),
            onChanged: (gender) {
              context
                  .read<RegistrationBloc>()
                  .add(GenderChanged(gender: gender ?? 'man'));
              print(state.gender.value);
            },
            items: _genders,
          ),
        );
      },
    );
  }
}

// class _GenderOtherInputField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegistrationBloc, RegState>(
//       buildWhen: (previous, current) =>
//           current.gender_other.value != '' || current.gender.value == 'other',
//       builder: (context, state) {
//         if (state.gender_other.value != '' || state.gender.value == 'other') {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 16.0),
//             child: AuthTextField(
//               hint: 'Lytis, jei kita: ${state.gender_other.value}',
//               key: const Key('GenderOther_textField'),
//               isRequiredField: false,
//               keyboardType: TextInputType.text,
//               onChanged: (genderOther) => context
//                   .read<RegistrationBloc>()
//                   .add(GenderOtherChanged(genderOther: genderOther)),
//             ),
//           );
//         }
//         return SizedBox.shrink();
//       },
//     );
//   }
// }

// class _UsernameInputField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegistrationBloc, RegState>(
//       buildWhen: (previous, current) => previous.username != current.username,
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 16.0),
//           child: AuthTextField(
//             hint: 'Naudotojo vardas: ${state.username.value}',
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
        child: Text(element.name),
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
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 3),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ThemeColors.primaryColor, width: 1))),
            value: _selectedValue,
            isDense: false,
            hint: SingleChildScrollView(
              child: Text(
                '${AppLocalizations.of(context)!.region}: ${state.region.value.length > 22 ? '${state.region.value.substring(0, 22)}' : state.region.value}',
                textScaler: TextScaler.linear(
                    MediaQuery.of(context).size.width < 350 ? 0.75 : 1),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: true),
              ),
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
              child: Text(AppLocalizations.of(context)!.action_update_settings),
              onPressed: () =>
                  context.read<RegistrationBloc>().add(SendNewUserData())),
        );
      },
    );
  }
}

void _msg(_, txt) {
  if (txt)
    ScaffoldMessenger.of(_).showSnackBar(SnackBar(
      content: Text(txt),
      backgroundColor: Colors.redAccent,
    ));
}

String _translate(String text) {
  if (text == 'man') {
    return LocalizationHelper.current.gender_man;
  }
  if (text == 'woman') {
    return LocalizationHelper.current.gender_woman;
  }
  if (text == 'non-binary') {
    return LocalizationHelper.current.gender_non_binary;
  }
  if (text == 'other') {
    return LocalizationHelper.current.gender_other;
  }
  if (text == 'prefer_not_to_say') {
    return LocalizationHelper.current.gender_prefer_not_to_say;
  }
  return '';
}
