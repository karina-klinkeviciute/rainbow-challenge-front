import 'package:formz/formz.dart';

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
        return "Slaptažodis turi būti ne trumpesnis negu 8 simboliai,\niš jų bent 1 skaičius";
      default:
        return null;
    }
  }
}
