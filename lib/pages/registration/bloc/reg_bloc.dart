import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/pages/registration/fields/confirm_password.dart';
import 'package:rainbow_challenge/pages/registration/fields/email.dart';
import 'package:rainbow_challenge/pages/registration/fields/password.dart';
import 'reg_event.dart';
import 'reg_state.dart';

class RegistrationBloc extends Bloc<RegEvent, RegState> {

  final UserRepository userRepository;

  RegistrationBloc({
    required this.userRepository,
  })  : assert(userRepository != null),
        super(RegState());

  @override
  void onTransition(Transition<RegEvent, RegState> transition) {
    //print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<RegState> mapEventToState(RegEvent event) async* {

      if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : Email.pure(),
        status: Formz.validate([
          //state.name,
          email,
          state.password,
          state.confirmPassword,
        ]),
      );
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      final confirm = ConfirmPassword.dirty(
        password: password.value,
        value: state.confirmPassword.value,
      );
      yield state.copyWith(
        password: password.valid ? password : Password.pure(),
        status: Formz.validate([
          //state.name,
          state.email,
          password,
          confirm,
        ]),
      );
    } else if (event is ConfirmPasswordChanged) {
      final password = ConfirmPassword.dirty(
          password: state.password.value,
          value: event.confirmPassword
      );

      yield state.copyWith(
        confirmPassword: password.valid ? password : ConfirmPassword.pure(),
        status: Formz.validate([
          //state.name,
          state.email,
          state.password,
          password,
        ]),
      );
    } else if (event is FormSubmitted) {

      if (!state.status.isValidated) return;

      yield state.copyWith(status: FormzStatus.submissionInProgress);

      try {

        await userRepository.register(
            year_of_birth: 2021,
            email: state.email.value,
            password: state.password.value,
            re_password: state.confirmPassword.value
        );
        /*
            gender: state.gender.value,
            gender_other: 'kita lytis',
            username: 'nickname',
            region: 'fb48c6cf-6a2d-41e3-9c2f-b9e4b1048f10',
            is_lgbtqia: 'yes'
            gender: state.gender.value,
            gender_other: state.gender_other.value,
            username: state.username.value,
            region: state.region.value,
            is_lgbtqia: state.is_lgbtqia.value
            */

        //await Future.delayed(Duration(seconds: 2));
        yield state.copyWith(status: FormzStatus.submissionSuccess);

      } catch (error) {
        //print(error.toString());
        //yield RegFailure(error: error.toString());
        //_msg(error.toString());
         yield state.copyWith(status: FormzStatus.submissionFailure);
      }
      //} on Exception {}

    }
  }

}

