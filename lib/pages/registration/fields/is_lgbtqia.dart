import 'package:formz/formz.dart';

enum IsLgbtqiaError {
  empty,
  invalid
}

class IsLgbtqia extends FormzInput<String, IsLgbtqiaError> {
  const IsLgbtqia.pure([String value = '']) : super.pure(value);
  const IsLgbtqia.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  @override
  IsLgbtqiaError? validator(String value) {
    if (value.isNotEmpty == false) {
      return IsLgbtqiaError.empty;
    }
    return _nameRegExp.hasMatch(value)
        ? null
        : IsLgbtqiaError.invalid;
  }
}