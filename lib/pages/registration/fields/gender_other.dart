import 'package:formz/formz.dart';

enum GenderOtherError {
  empty,
  invalid
}

class GenderOther extends FormzInput<String, GenderOtherError> {
  const GenderOther.pure([String value = '']) : super.pure(value);
  const GenderOther.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  @override
  GenderOtherError? validator(String value) {
    if (value.isNotEmpty == false) {
      return GenderOtherError.empty;
    }
    return _nameRegExp.hasMatch(value)
        ? null
        : GenderOtherError.invalid;
  }
}