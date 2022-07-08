import 'package:formz/formz.dart';

enum EmailRecoveryValidationError { invalid }

class EmailRecovery extends FormzInput<String, EmailRecoveryValidationError> {
  const EmailRecovery.pure() : super.pure('');
  const EmailRecovery.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailRecoveryValidationError? validator(String value) {
    if (value == "") return null;

    return _emailRegExp.hasMatch(value)
        ? null
        : EmailRecoveryValidationError.invalid;
  }
}

extension Explanation on EmailRecoveryValidationError {
  String? get title {
    switch (this) {
      case EmailRecoveryValidationError.invalid:
        return "Prašom įvesti tinkamą el. pašto adresą";
      default:
        return null;
    }
  }
}
