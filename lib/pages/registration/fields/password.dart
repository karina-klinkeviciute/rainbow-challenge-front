import 'package:formz/formz.dart';
import 'package:rainbow_challenge/localization/localization_helper.dart';

enum PasswordValidationError { invalid, empty }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}

extension Explanation on PasswordValidationError? {
  String? get title {
    switch (this) {
      case PasswordValidationError.invalid:
        return LocalizationHelper.current.password_rules;
      default:
        return null;
    }
  }
}
