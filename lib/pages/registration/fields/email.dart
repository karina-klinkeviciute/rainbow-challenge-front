import 'package:formz/formz.dart';
import 'package:rainbow_challenge/localization/localization_helper.dart';

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value == "") return null;

    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

extension Explanation on EmailValidationError {
  String? get title {
    switch (this) {
      case EmailValidationError.invalid:
        return LocalizationHelper.current.email_enter_valid;
      default:
        return null;
    }
  }
}
