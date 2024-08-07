import 'package:formz/formz.dart';
import 'package:rainbow_challenge/localization/localization_helper.dart';

enum CurrentPasswordValidationError { invalid, empty }

class CurrentPassword
    extends FormzInput<String, CurrentPasswordValidationError> {
  const CurrentPassword.pure() : super.pure('');
  const CurrentPassword.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');

  @override
  CurrentPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return CurrentPasswordValidationError.empty;
    }
    return _passwordRegExp.hasMatch(value)
        ? null
        : CurrentPasswordValidationError.invalid;
  }
}

extension Explanation on CurrentPasswordValidationError? {
  String? get title {
    switch (this) {
      case CurrentPasswordValidationError.invalid:
        return LocalizationHelper.current.password_rules;
      default:
        return null;
    }
  }
}
