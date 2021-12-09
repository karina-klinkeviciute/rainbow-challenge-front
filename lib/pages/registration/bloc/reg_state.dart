import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:rainbow_challenge/pages/registration/fields/email.dart';
import 'package:rainbow_challenge/pages/registration/fields/name.dart';
import 'package:rainbow_challenge/pages/registration/fields/password.dart';
import 'package:rainbow_challenge/pages/registration/fields/confirm_password.dart';
import 'package:rainbow_challenge/pages/registration/fields/gender.dart';
import 'package:rainbow_challenge/pages/registration/fields/gender_other.dart';
import 'package:rainbow_challenge/pages/registration/fields/username.dart';
import 'package:rainbow_challenge/pages/registration/fields/region.dart';
import 'package:rainbow_challenge/pages/registration/fields/is_lgbtqia.dart';
import 'package:rainbow_challenge/pages/registration/fields/rules.dart';

class RegState extends Equatable {
  const RegState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.gender = const Gender.pure(),
    this.gender_other = const GenderOther.pure(),
    this.username = const Username.pure(),
    this.region = const Region.pure(),
    this.is_lgbtqia = const IsLgbtqia.pure(),
    this.rules = const Rules.pure(),
    this.status = FormzStatus.pure,
  });

  final Name name;
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final Gender gender;
  final GenderOther gender_other;
  final Username username;
  final Region region;
  final IsLgbtqia is_lgbtqia;
  final Rules rules;
  final FormzStatus status;

  @override
  List<Object?> get props => [
    name,
    email,
    password,
    confirmPassword,
    gender,
    gender_other,
    username,
    region,
    is_lgbtqia,
    rules,
    status
  ];

  RegState copyWith({
    String? image,
    Name? name,
    Email? email,
    Password? password,
    ConfirmPassword? confirmPassword,
    Gender? gender,
    GenderOther? gender_other,
    Username? username,
    Region? region,
    IsLgbtqia? is_lgbtqia,
    Rules? rules,
    FormzStatus? status,
  }) {
    return RegState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      gender: gender ?? this.gender,
      gender_other: gender_other ?? this.gender_other,
      username: username ?? this.username,
      region: region ?? this.region,
      is_lgbtqia: is_lgbtqia ?? this.is_lgbtqia,
      rules: rules ?? this.rules,
      status: status ?? this.status,
    );
  }
}