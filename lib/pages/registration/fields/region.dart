import 'package:formz/formz.dart';

enum RegionError {
  empty,
  invalid
}

class Region extends FormzInput<String, RegionError> {
  const Region.pure([String value = '']) : super.pure(value);
  const Region.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  @override
  RegionError? validator(String value) {
    if (value.isNotEmpty == false) {
      return RegionError.empty;
    }
    return _nameRegExp.hasMatch(value)
        ? null
        : RegionError.invalid;
  }
}