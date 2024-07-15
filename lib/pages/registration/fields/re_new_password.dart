import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ReNewPasswordValidationError {
  invalid,
  mismatch,
}

class ReNewPassword extends FormzInput<String, ReNewPasswordValidationError> {
  final String newPassword;

  const ReNewPassword.pure({this.newPassword = ''}) : super.pure('');

  const ReNewPassword.dirty({required this.newPassword, String value = ''})
      : super.dirty(value);

  @override
  ReNewPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return ReNewPasswordValidationError.invalid;
    }
    return newPassword == value ? null : ReNewPasswordValidationError.mismatch;
  }
}

extension Explanation on ReNewPasswordValidationError? {
  String? get name {
    switch (this) {
      case ReNewPasswordValidationError.mismatch:
        return AppLocalizations.of(context)!.passwords_must_match;
      default:
        return null;
    }
  }
}
