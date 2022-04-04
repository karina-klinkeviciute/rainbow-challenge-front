import 'package:equatable/equatable.dart';

abstract class RegEvent extends Equatable {
  const RegEvent();

  @override
  List<Object> get props => [];
}

class RegionsLoaded extends RegEvent {
  @override
  List<Object> get props => [];
}

class NameChanged extends RegEvent {
  const NameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class EmailChanged extends RegEvent {
  const EmailChanged({
    required this.email,
  });

  final String email;

  @override
  List<Object> get props => [email];
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

class RegionChanged extends RegEvent {
  const RegionChanged({required this.region});

  final String region;

  @override
  List<Object> get props => [region];
}

class FormSubmitted extends RegEvent {}
