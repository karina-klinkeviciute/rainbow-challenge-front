import 'package:formz/formz.dart';
import 'package:rainbow_challenge/localization/localization_helper.dart';

enum ConfirmedPasswordValidationError {
  invalid,
  mismatch,
}

class ConfirmPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  final String password;

  const ConfirmPassword.pure({this.password = ''}) : super.pure('');

  const ConfirmPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return ConfirmedPasswordValidationError.invalid;
    }
    return password == value ? null : ConfirmedPasswordValidationError.mismatch;
  }
}

extension Explanation on ConfirmedPasswordValidationError? {
  String? get name {
    switch (this) {
      case ConfirmedPasswordValidationError.mismatch:
        return LocalizationHelper.current.passwords_must_match;
      default:
        return null;
    }
  }
}
