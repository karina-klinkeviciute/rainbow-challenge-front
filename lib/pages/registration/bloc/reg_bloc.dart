import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rainbow_challenge/bloc/authentication_bloc.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'reg_event.dart';
part 'reg_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  RegistrationBloc({
    required this.userRepository,
    required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial())
  ;

  @override
  Stream<RegistrationState> mapEventToState(
      RegistrationEvent event,
      ) async* {
    if (event is RegButtonPressed) {
      yield LoginInitial();

      try {
        final user = await userRepository.authenticate(
          email: event.email,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(user: user));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());//error.toString()
      }
    }
  }
}
