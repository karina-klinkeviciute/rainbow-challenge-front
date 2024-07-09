import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';

class LanguageCubit extends Cubit<AppLanguage> {
  final UserRepository userRepository;

  LanguageCubit({
    required this.userRepository,
    required AppLanguage initLanguage,
  }) : super(initLanguage);

  void setLanguage(AppLanguage lang) {
    userRepository.setLanguage(lang);
    emit(lang);
  }
}

class AppLanguage {
  static final supported = {
    'lt': AppLanguage('🇱🇹', 'Lietuvių', Locale('lt', 'LT')),
    'en': AppLanguage('🇬🇧', 'English', Locale('en', 'GB')),
    // 'pt': AppLanguage('🇵🇹', 'Português', Locale('pt', 'PT')),
    // 'sk': AppLanguage('🇸🇰', 'Slovenský', Locale('sk', 'SK')),
  };

  final String icon;
  final String name;
  final Locale locale;

  AppLanguage(this.icon, this.name, this.locale);
}