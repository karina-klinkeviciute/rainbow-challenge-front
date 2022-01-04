import 'package:formz/formz.dart';

enum UsernameError {
  empty,
  invalid
}

class Username extends FormzInput<String, UsernameError> {
  const Username.pure([String value = '']) : super.pure(value);
  const Username.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  @override
  UsernameError? validator(String value) {
    if (value.isNotEmpty == false) {
      return UsernameError.empty;
    }
    return _nameRegExp.hasMatch(value)
        ? null
        : UsernameError.invalid;
  }
}