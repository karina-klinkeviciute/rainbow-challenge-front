import 'package:formz/formz.dart';

enum RulesError {
  empty, invalid
}

class Rules extends FormzInput<String, RulesError> {
  const Rules.pure() : super.pure('');
  const Rules.dirty({String value = ''}) : super.dirty(value);

  @override
  RulesError? validator(String value) {
    return value.isNotEmpty == true ? null : RulesError.empty;
  }
}