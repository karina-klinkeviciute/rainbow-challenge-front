import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:equatable/equatable.dart';

import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/utils/model/user_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required this.userRepository})
    : super(AuthenticationUnauthenticated()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AppStarted) {
        final bool hasToken = await userRepository.hasToken();

        if (hasToken) {
          if(userRepository.fcmToken != null){
            userRepository.sendFCMToken(fcmToken: userRepository.fcmToken);
          }
          emit(AuthenticationAuthenticated());
        } else {
          emit(AuthenticationUnauthenticated());
        }
      }

      if (event is LoggedIn) {
        emit(AuthenticationLoading());

        //print(event.user);
        await userRepository.persistToken(user: event.user);

        // Register FCM token after auth
        if(userRepository.fcmToken != null){
          userRepository.sendFCMToken(fcmToken: userRepository.fcmToken);
        }

        emit(AuthenticationAuthenticated());
      }

      if (event is LoggedOut) {
        emit(AuthenticationLoading());

        await userRepository.deleteToken(id: 0);

        try {
          await GoogleSignIn().signOut();
        } catch (e) {
          // Ignoring
        }

        emit(AuthenticationUnauthenticated());
      }
    });
  }

  final UserRepository userRepository;
}
