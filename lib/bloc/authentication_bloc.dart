import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/utils/model/user_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required this.userRepository})
      : assert(UserRepository != null),
        super(AuthenticationUnauthenticated());

  final UserRepository userRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        if(userRepository.fcmToken != null){
          userRepository.sendFCMToken(fcmToken: userRepository.fcmToken);
        }
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();

      //print(event.user);
      await userRepository.persistToken(user: event.user);

      // Register FCM token after auth
      if(userRepository.fcmToken != null){
        userRepository.sendFCMToken(fcmToken: userRepository.fcmToken);
      }

      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();

      await userRepository.deleteToken(id: 0);

      try {
        await GoogleSignIn().signOut();
      } catch (e) {
        // Ignoring
      }

      yield AuthenticationUnauthenticated();
    }
  }
}
