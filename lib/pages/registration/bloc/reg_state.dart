import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:rainbow_challenge/pages/registration/fields/email.dart';
import 'package:rainbow_challenge/pages/registration/fields/email_recovery.dart';
import 'package:rainbow_challenge/pages/registration/fields/name.dart';
import 'package:rainbow_challenge/pages/registration/fields/password.dart';
import 'package:rainbow_challenge/pages/registration/fields/confirm_password.dart';
import 'package:rainbow_challenge/pages/registration/fields/gender.dart';
import 'package:rainbow_challenge/pages/registration/fields/gender_other.dart';
import 'package:rainbow_challenge/pages/registration/fields/username.dart';
import 'package:rainbow_challenge/pages/registration/fields/region.dart';
import 'package:rainbow_challenge/pages/registration/fields/is_lgbtqia.dart';
import 'package:rainbow_challenge/pages/registration/fields/rules.dart';
import 'package:rainbow_challenge/pages/registration/fields/year_of_birth.dart';

class RegState extends Equatable {
  const RegState(
      {this.name = const Name.pure(),
      this.email = const Email.pure(),
      this.email_recovery = const EmailRecovery.pure(),
      this.password = const Password.pure(),
      this.confirmPassword = const ConfirmPassword.pure(),
      this.gender = const Gender.pure(),
      this.gender_other = const GenderOther.pure(),
      this.username = const Username.pure(),
      this.year_of_birth = const YearOfBirth.pure(),
      this.region = const Region.pure(),
      this.is_lgbtqia = const IsLgbtqia.pure(),
      this.rules = const Rules.pure(),
      this.status = FormzStatus.pure,
      this.errorMessage = null});

  final Name name;
  final Email email;
  final EmailRecovery email_recovery;
  final Password password;
  final ConfirmPassword confirmPassword;
  final Gender gender;
  final GenderOther gender_other;
  final Username username;
  final YearOfBirth year_of_birth;
  final Region region;
  final IsLgbtqia is_lgbtqia;
  final Rules rules;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        name,
        email,
        email_recovery,
        password,
        confirmPassword,
        gender,
        gender_other,
        username,
        year_of_birth,
        region,
        is_lgbtqia,
        rules,
        status
      ];

  RegState copyWith({
    String? image,
    Name? name,
    Email? email,
    EmailRecovery? email_recovery,
    Password? password,
    ConfirmPassword? confirmPassword,
    Gender? gender,
    GenderOther? gender_other,
    Username? username,
    YearOfBirth? year_of_birth,
    Region? region,
    IsLgbtqia? is_lgbtqia,
    Rules? rules,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return RegState(
        name: name ?? this.name,
        email: email ?? this.email,
        email_recovery: email_recovery ?? this.email_recovery,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        gender: gender ?? this.gender,
        gender_other: gender_other ?? this.gender_other,
        username: username ?? this.username,
        year_of_birth: year_of_birth ?? this.year_of_birth,
        region: region ?? this.region,
        is_lgbtqia: is_lgbtqia ?? this.is_lgbtqia,
        rules: rules ?? this.rules,
        status: status ?? this.status,
        errorMessage: errorMessage);
  }
}
