import 'package:formz/formz.dart';
import 'package:rainbow_challenge/localization/localization_helper.dart';

enum ReNewPasswordValidationError {
  invalid,
  mismatch,
}

class ReNewPassword extends FormzInput<String, ReNewPasswordValidationError> {
  final String newPassword;

  const ReNewPassword.pure({this.newPassword = ''}) : super.pure('');

  const ReNewPassword.dirty({required this.newPassword, String value = ''})
      : super.dirty(value);

  @override
  ReNewPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return ReNewPasswordValidationError.invalid;
    }
    return newPassword == value ? null : ReNewPasswordValidationError.mismatch;
  }
}

extension Explanation on ReNewPasswordValidationError? {
  String? get name {
    switch (this) {
      case ReNewPasswordValidationError.mismatch:
        return LocalizationHelper.current.passwords_must_match;
      default:
        return null;
    }
  }
}
