import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/pages/registration/fields/confirm_password.dart';
import 'package:rainbow_challenge/pages/registration/fields/email.dart';
import 'package:rainbow_challenge/pages/registration/fields/password.dart';
import '../fields/rules.dart';
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
        email: email,
        status: Formz.validate([
          //state.name,
          email,
          state.password,
          state.confirmPassword,
          state.rules
        ]),
      );
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      final confirm = ConfirmPassword.dirty(
        password: password.value,
        value: state.confirmPassword.value,
      );
      yield state.copyWith(
        password: password,
        status: Formz.validate([
          //state.name,
          state.email,
          password,
          confirm,
          state.rules
        ]),
      );
    } else if (event is ConfirmPasswordChanged) {
      final password = ConfirmPassword.dirty(
          password: state.password.value, value: event.confirmPassword);

      yield state.copyWith(
        confirmPassword: password,
        status: Formz.validate([
          //state.name,
          state.email,
          state.password,
          password,
          state.rules
        ]),
      );
    } else if (event is RulesChanged) {
      final rules = Rules.dirty(value: event.rules);

      yield state.copyWith(
        rules: rules,
        status: Formz.validate([
          //state.name,
          state.email,
          state.password,
          state.confirmPassword,
          rules
        ]),
      );
    } else if (event is FormSubmitted) {
      if (!state.status.isValidated) return;

      yield state.copyWith(status: FormzStatus.submissionInProgress);

      try {
        var errorMessage = await userRepository.register(
            year_of_birth: 2021,
            email: state.email.value,
            password: state.password.value,
            re_password: state.confirmPassword.value);

        if (errorMessage == "")
          yield state.copyWith(status: FormzStatus.submissionSuccess);
        else
          yield state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: errorMessage);
      } catch (error) {
        //print(error.toString());
        //yield RegFailure(error: error.toString());
        //_msg(error.toString());
        yield state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: error.toString());
      }
      //} on Exception {}

    }
  }
}
