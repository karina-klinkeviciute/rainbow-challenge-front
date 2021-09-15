part of 'reg_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class RegButtonPressed extends RegistrationEvent {
  final String email;
  final String password;

  const RegButtonPressed({
    required this.email,
    required this.password
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'RegButtonPressed { email: $email, password: $password }';
}
