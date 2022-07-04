import 'package:formz/formz.dart';

enum YearOfBirthError { empty, invalid }

class YearOfBirth extends FormzInput<int, YearOfBirthError> {
  const YearOfBirth.pure([int? value]) : super.pure(value ?? 0);
  const YearOfBirth.dirty([int? value]) : super.dirty(value ?? 0);

  @override
  YearOfBirthError? validator(int value) {
    if (value.isNegative == false) {
      return YearOfBirthError.empty;
    }
    return YearOfBirthError.invalid;
  }
}
