import 'package:formz/formz.dart';

enum RegionError { empty, invalid }

class Region extends FormzInput<String, RegionError> {
  const Region.pure([String value = '']) : super.pure(value);
  const Region.dirty([String value = '']) : super.dirty(value);

  @override
  RegionError? validator(String value) {
    return null;
  }
}
