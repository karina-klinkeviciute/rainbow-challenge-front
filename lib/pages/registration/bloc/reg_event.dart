import 'package:equatable/equatable.dart';

abstract class RegEvent extends Equatable {
  const RegEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends RegEvent {
  const NameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class UserNameChanged extends RegEvent {
  const UserNameChanged({required this.username});

  final String username;

  @override
  List<Object> get props => [username];
}

class EmailChanged extends RegEvent {
  const EmailChanged({
    required this.email,
  });

  final String email;

  @override
  List<Object> get props => [email];
}

class RecoveryEmailChanged extends RegEvent {
  const RecoveryEmailChanged({
    required this.email_recovery,
  });

  final String email_recovery;

  @override
  List<Object> get props => [email_recovery];
}

class PasswordChanged extends RegEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends RegEvent {
  const ConfirmPasswordChanged({
    required this.confirmPassword,
  });

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class RulesChanged extends RegEvent {
  const RulesChanged({required this.rules});

  final bool rules;

  @override
  List<Object> get props => [rules];
}

class GenderChanged extends RegEvent {
  const GenderChanged({required this.gender});

  final String gender;
  @override
  List<Object> get props => [gender];
}

class GenderOtherChanged extends RegEvent {
  const GenderOtherChanged({required this.genderOther});

  final String genderOther;
  @override
  List<Object> get props => [genderOther];
}

class GenderChangedKita extends RegEvent {
  const GenderChangedKita({required this.kita});

  final String kita;
  @override
  List<Object> get props => [kita];
}

class RegionChanged extends RegEvent {
  const RegionChanged({required this.regionId});

  final String regionId;
  @override
  List<Object> get props => [regionId];
}

class YearOfBirthChanged extends RegEvent {
  const YearOfBirthChanged({required this.year_of_birth});

  final int year_of_birth;
  @override
  List<Object> get props => [year_of_birth];
}

class EmailRecoverySubmitted extends RegEvent {}

class FormSubmitted extends RegEvent {}
