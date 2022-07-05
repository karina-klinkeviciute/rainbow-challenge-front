import 'package:formz/formz.dart';

enum RegionIdError {
  empty,
  invalid
}

class RegionId extends FormzInput<String, RegionIdError> {
  const RegionId.pure([String value = '']) : super.pure(value);
  const RegionId.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  @override
  RegionIdError? validator(String value) {
    if (value.isNotEmpty == false) {
      return RegionIdError.empty;
    }
    return _nameRegExp.hasMatch(value)
        ? null
        : RegionIdError.invalid;
  }
}