import 'package:formz/formz.dart';

enum NewPasswordValidationError { invalid, empty }

class NewPassword extends FormzInput<String, NewPasswordValidationError> {
  const NewPassword.pure() : super.pure('');
  const NewPassword.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');

  @override
  NewPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return NewPasswordValidationError.empty;
    }
    return _passwordRegExp.hasMatch(value)
        ? null
        : NewPasswordValidationError.invalid;
  }
}

extension Explanation on NewPasswordValidationError? {
  String? get title {
    switch (this) {
      case NewPasswordValidationError.invalid:
        return "Slaptažodis turi būti ne trumpesnis negu 8 simboliai, iš jų bent 1 skaičius";
      default:
        return null;
    }
  }
}
