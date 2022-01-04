import 'package:formz/formz.dart';

enum GenderError {
  empty,
  invalid
}

class Gender extends FormzInput<String, GenderError> {
  const Gender.pure([String value = '']) : super.pure(value);
  const Gender.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  @override
  GenderError? validator(String value) {
    if (value.isNotEmpty == false) {
      return GenderError.empty;
    }
    return _nameRegExp.hasMatch(value)
        ? null
        : GenderError.invalid;
  }
}