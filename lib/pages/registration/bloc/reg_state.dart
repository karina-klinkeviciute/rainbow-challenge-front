part of 'reg_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends RegistrationState {}

class LoginLoading extends RegistrationState {}

class LoginFailure extends RegistrationState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' RegFailure { error: $error }';
}
