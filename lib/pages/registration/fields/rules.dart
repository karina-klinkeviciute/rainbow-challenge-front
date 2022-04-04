import 'package:formz/formz.dart';

enum RulesError { empty, invalid }

class Rules extends FormzInput<bool, RulesError> {
  const Rules.pure() : super.pure(false);
  const Rules.dirty({bool value = false}) : super.dirty(value);

  @override
  RulesError? validator(bool value) {
    return value == true ? null : RulesError.empty;
  }
}
