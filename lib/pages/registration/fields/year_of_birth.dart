import 'package:formz/formz.dart';

enum YearOfBirthError { empty, invalid }

class YearOfBirth extends FormzInput<int, YearOfBirthError> {
  const YearOfBirth.pure([int value = 2010]) : super.pure(value);
  const YearOfBirth.dirty([int value = 2010]) : super.dirty(value);

  @override
  YearOfBirthError? validator(int value) {
    if (value.isNegative == false) {
      return YearOfBirthError.empty;
    }
    return YearOfBirthError.invalid;
  }
}
