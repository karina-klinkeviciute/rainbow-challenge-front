import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Change this to your localization file path
import 'package:rainbow_challenge/main.dart'; // Ensure you import the main file where MyApp is defined

class LocalizationHelper {
  static AppLocalizations get current {
    final context = App.navigatorKey.currentContext;
    if (context == null) {
      throw Exception("Navigator context is not available");
    }
    return AppLocalizations.of(context)!;
  }
}
