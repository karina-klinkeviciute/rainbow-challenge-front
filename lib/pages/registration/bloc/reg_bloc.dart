import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:rainbow_challenge/pages/registration/fields/current_password.dart';
import 'package:rainbow_challenge/pages/registration/fields/email_recovery.dart';
import 'package:rainbow_challenge/pages/registration/fields/gender.dart';
import 'package:rainbow_challenge/pages/registration/fields/gender_other.dart';
import 'package:rainbow_challenge/pages/registration/fields/new_password.dart';
import 'package:rainbow_challenge/pages/registration/fields/re_new_password.dart';
import 'package:rainbow_challenge/pages/registration/fields/reg_id.dart';
import 'package:rainbow_challenge/pages/registration/fields/region.dart';
import 'package:rainbow_challenge/pages/registration/fields/username.dart';
import 'package:rainbow_challenge/pages/registration/fields/year_of_birth.dart';
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
  }) : super(RegState()) {
    on<RegEvent>((event, emit) async {
      if (event is GetOldData) {
        final username = Username.pure(event.username);
        final year_of_birth = YearOfBirth.pure(event.year_of_birth);
        final gender = Gender.pure(event.gender);
        final gender_other = GenderOther.pure(event.genderOther);
        final region = Region.pure(event.regionName);
        final regionId = RegionId.pure(event.regionUuid);
        emit(state.copyWith(
          year_of_birth: year_of_birth,
          gender_other: gender_other,
          gender: gender,
          username: username,
          region: region,
          regionId: regionId,
        ));
      } else if (event is EmailChanged) {
        final email = Email.dirty(event.email);
        emit(state.copyWith(
          email: email,
          status: Formz.validate([
            //state.name,
            email,
            // state.username,
            // state.gender,
            state.password,
            state.confirmPassword,
            state.rules
          ]),
        ));
      } else if (event is PasswordChanged) {
        final password = Password.dirty(event.password);
        final confirm = ConfirmPassword.dirty(
          password: password.value,
          value: state.confirmPassword.value,
        );
        emit(state.copyWith(
          password: password,
          status: Formz.validate([
            //state.name,
            // state.username,
            // state.gender,
            state.email,
            password,
            confirm,
            state.rules
          ]),
        ));
      } else if (event is NewPasswordChanged) {
        final newPassword = NewPassword.dirty(event.newPassword);
        final confirm = ReNewPassword.dirty(
          newPassword: newPassword.value,
          value: state.reNewPassword.value,
        );
        emit(state.copyWith(
          newPassword: newPassword,
          status: Formz.validate([
            newPassword,
            confirm,
          ]),
        ));
      } else if (event is ConfirmPasswordChanged) {
        final password = ConfirmPassword.dirty(
            password: state.password.value, value: event.confirmPassword);

        emit(state.copyWith(
          confirmPassword: password,
          status: Formz.validate([
            //state.name,
            // state.username,
            // state.gender,
            state.email,
            state.password,
            password,
            state.rules
          ]),
        ));
      } else if (event is ReNewPasswordChanged) {
        final newPassword = ReNewPassword.dirty(
            newPassword: state.newPassword.value, value: event.reNewPassword);

        emit(state.copyWith(
          reNewPassword: newPassword,
          status: Formz.validate([
            state.newPassword,
            newPassword,
          ]),
        ));
      } else if (event is CurrentPasswordChanged) {
        final currentPassword = CurrentPassword.dirty(event.currentPassword);
        emit(state.copyWith(
          currentPassword: currentPassword,
          status: Formz.validate([
            currentPassword,
          ]),
        ));
      } else if (event is RulesChanged) {
        final rules = Rules.dirty(value: event.rules);

        emit(state.copyWith(
          rules: rules,
          status: Formz.validate([
            //state.name,
            // state.username,
            // state.gender,
            state.email,
            state.password,
            state.confirmPassword,
            rules
          ]),
        ));
      } else if (event is GenderChanged) {
        final gender = Gender.dirty(event.gender);

        emit(state.copyWith(
          gender: gender,
          status: Formz.validate([
            //state.name,
            // state.username,
            state.gender,
            // state.email,
            // state.password,
            // state.confirmPassword,
            // rules
          ]),
        ));
      } else if (event is GenderOtherChanged) {
        final gender_other = GenderOther.dirty(event.genderOther);

        emit(state.copyWith(
          gender_other: gender_other,
          status: Formz.validate([
            //state.name,
            // state.username,
            state.gender_other,
            // state.email,
            // state.password,
            // state.confirmPassword,
            // rules
          ]),
        ));
      } else if (event is RegionChanged) {
        final regionId = RegionId.dirty(event.regionId);

        emit(state.copyWith(
          regionId: regionId,
          status: Formz.validate([
            //state.name,
            // state.username,
            state.regionId,
            // state.email,
            // state.password,
            // state.confirmPassword,
            // rules
          ]),
        ));
      } else if (event is YearOfBirthChanged) {
        final year_of_birth = YearOfBirth.dirty(event.year_of_birth);

        emit(state.copyWith(
          year_of_birth: year_of_birth,
          status: Formz.validate([
            //state.name,
            // state.username,
            state.year_of_birth,
            // state.email,
            // state.password,
            // state.confirmPassword,
            // rules
          ]),
        ));
      } else if (event is RecoveryEmailChanged) {
        final email_recovery = EmailRecovery.dirty(event.email_recovery);
        emit(state.copyWith(
          email_recovery: email_recovery,
          status: Formz.validate([
            //state.name,
            state.email_recovery,
            // state.username,
            // state.gender,
            // state.password,
            // state.confirmPassword,
            // state.rules
          ]),
        ));
      } else if (event is EmailRecoverySubmitted) {
        if (!state.status.isValidated) return;

        emit(state.copyWith(status: FormzStatus.submissionInProgress));

        try {
          var errorMessage = await userRepository.registerRecoveryEmail(
            email_recovery: state.email_recovery.value,
          );

          if (errorMessage == "")
            emit(state.copyWith(status: FormzStatus.submissionSuccess));
          else
            emit(state.copyWith(
                status: FormzStatus.submissionFailure,
                errorMessage: errorMessage));
        } catch (error) {
          emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: error.toString()));
        }
        //} on Exception {}

      } else if (event is PasswordResetSubmitted) {
        if (!state.status.isValidated) return;

        emit(state.copyWith(status: FormzStatus.submissionInProgress));

        try {
          var errorMessage = await userRepository.registerReSetPassword(
            current_password: state.currentPassword.value,
            new_password: state.newPassword.value,
            re_new_password: state.reNewPassword.value,
          );

          if (errorMessage == "")
            emit(state.copyWith(status: FormzStatus.submissionSuccess));
          else
            emit(state.copyWith(
                status: FormzStatus.submissionFailure,
                errorMessage: errorMessage));
        } catch (error) {
          emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: error.toString()));
        }
        //} on Exception {}

      } else if (event is SendNewUserData) {
        try {
          var errorMessage = await userRepository.patchNewUserData(
            year_of_birth: state.year_of_birth.value,
            gender_other: state.gender_other.value,
            gender: state.gender.value,
            username: state.username.value,
            regionId: state.regionId.value,
          );
          print(errorMessage);
          if (errorMessage == "OK")
            emit(state.copyWith(
                status: FormzStatus.submissionSuccess, errorMessage: 'Data Sent'));
          else
            emit(state.copyWith(status: FormzStatus.submissionFailure));
        } catch (error) {
          emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: error.toString()));
        }
        //} on Exception {}

      } else if (event is SendDeleteRequest) {
        try {
          var errorMessage = await userRepository.deleteUserRequest(
            current_password: state.currentPassword.value,
          );
          print(errorMessage);
          if (errorMessage == "" || errorMessage == "No Content")
            emit(state.copyWith(
                status: FormzStatus.submissionSuccess, errorMessage: 'Data Sent'));
          else
            emit(state.copyWith(status: FormzStatus.submissionFailure));
        } catch (error) {
          emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: error.toString()));
        }
        //} on Exception {}
      }

      if (event is FormSubmitted) {
        if (!state.status.isValidated) return;

        emit(state.copyWith(status: FormzStatus.submissionInProgress));

        try {
          var errorMessage = await userRepository.register(
              year_of_birth: state.year_of_birth.value,
              email: state.email.value,
              password: state.password.value,
              gender_other: state.gender_other.value,
              gender: state.gender.value,
              // username: 'qw',
              region: state.regionId.value,
              re_password: state.confirmPassword.value);

          if (errorMessage == "")
            emit(state.copyWith(status: FormzStatus.submissionSuccess));
          else
            emit(state.copyWith(
                status: FormzStatus.submissionFailure,
                errorMessage: errorMessage));
        } catch (error) {
          //print(error.toString());
          //emit(RegFailure(error: error.toString());
          //_msg(error.toString());
          emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: error.toString()));
        }
        //} on Exception {}

      }
    });
  }

}
