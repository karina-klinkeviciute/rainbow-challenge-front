import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_sk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('lt'),
    Locale('pt'),
    Locale('sk')
  ];

  /// No description provided for @app_title.
  ///
  /// In lt, this message translates to:
  /// **'Rainbow Challenge'**
  String get app_title;

  /// No description provided for @email.
  ///
  /// In lt, this message translates to:
  /// **'El. paštas'**
  String get email;

  /// No description provided for @enter_email.
  ///
  /// In lt, this message translates to:
  /// **'Įvesk el. pašto adresą'**
  String get enter_email;

  /// No description provided for @email_enter_valid.
  ///
  /// In lt, this message translates to:
  /// **'Prašom įvesti tinkamą el. pašto adresą'**
  String get email_enter_valid;

  /// No description provided for @password.
  ///
  /// In lt, this message translates to:
  /// **'Slaptažodis'**
  String get password;

  /// No description provided for @testing.
  ///
  /// In lt, this message translates to:
  /// **'Test'**
  String get testing;

  /// No description provided for @new_user.
  ///
  /// In lt, this message translates to:
  /// **'Naujas naudotojas'**
  String get new_user;

  /// No description provided for @change_password.
  ///
  /// In lt, this message translates to:
  /// **'Keisti slaptažodį'**
  String get change_password;

  /// No description provided for @password_hint.
  ///
  /// In lt, this message translates to:
  /// **'Slaptažodis'**
  String get password_hint;

  /// No description provided for @repeat_password.
  ///
  /// In lt, this message translates to:
  /// **'Pakartokite slaptažodį'**
  String get repeat_password;

  /// No description provided for @current_password.
  ///
  /// In lt, this message translates to:
  /// **'Dabartinis slaptažodis'**
  String get current_password;

  /// No description provided for @passwords_must_match.
  ///
  /// In lt, this message translates to:
  /// **'Slaptažodžiai turi sutapti'**
  String get passwords_must_match;

  /// No description provided for @password_rules.
  ///
  /// In lt, this message translates to:
  /// **'Slaptažodis turi būti ne trumpesnis negu 8 simboliai, iš jų bent 1 skaičius'**
  String get password_rules;

  /// No description provided for @password_update_success.
  ///
  /// In lt, this message translates to:
  /// **'Slaptažodis pakeistas sėkmingai'**
  String get password_update_success;

  /// No description provided for @password_recovery_url.
  ///
  /// In lt, this message translates to:
  /// **'Slaptažodžio atstatymo nuoroda nusiųsta nurodytu el. pašto adresu'**
  String get password_recovery_url;

  /// No description provided for @registration_successful.
  ///
  /// In lt, this message translates to:
  /// **'Registracija sėkminga. Prisijungti galėsi po to, kai aktyvuosi paskyrą. Aktyvavimo nuorodą nusiuntėme nurodytu el. pašto adresu.'**
  String get registration_successful;

  /// No description provided for @user_settings.
  ///
  /// In lt, this message translates to:
  /// **'Naudotojo nustatymai'**
  String get user_settings;

  /// No description provided for @settings_changed.
  ///
  /// In lt, this message translates to:
  /// **'Nustatymai pakeisti'**
  String get settings_changed;

  /// No description provided for @action_back_to_profile.
  ///
  /// In lt, this message translates to:
  /// **'Atgal į profilį'**
  String get action_back_to_profile;

  /// No description provided for @action_back_to_challenges.
  ///
  /// In lt, this message translates to:
  /// **'Atgal į užduotis'**
  String get action_back_to_challenges;

  /// No description provided for @action_login.
  ///
  /// In lt, this message translates to:
  /// **'Prisijungti'**
  String get action_login;

  /// No description provided for @action_logout.
  ///
  /// In lt, this message translates to:
  /// **'Atsijungti'**
  String get action_logout;

  /// No description provided for @action_submit.
  ///
  /// In lt, this message translates to:
  /// **'Pateikti'**
  String get action_submit;

  /// No description provided for @action_register.
  ///
  /// In lt, this message translates to:
  /// **'Neturi paskyros? Registruokis'**
  String get action_register;

  /// No description provided for @action_have_account_login.
  ///
  /// In lt, this message translates to:
  /// **'Turi paskyrą? Prisijunk'**
  String get action_have_account_login;

  /// No description provided for @action_forgot_password.
  ///
  /// In lt, this message translates to:
  /// **'Užmiršai slaptažodį? Spausk čia'**
  String get action_forgot_password;

  /// No description provided for @action_update_settings.
  ///
  /// In lt, this message translates to:
  /// **'Atnaujinti nustatymus'**
  String get action_update_settings;

  /// No description provided for @action_back.
  ///
  /// In lt, this message translates to:
  /// **'Grįžti'**
  String get action_back;

  /// No description provided for @menu_home.
  ///
  /// In lt, this message translates to:
  /// **'Pradžia'**
  String get menu_home;

  /// No description provided for @menu_profile.
  ///
  /// In lt, this message translates to:
  /// **'Profilis'**
  String get menu_profile;

  /// No description provided for @menu_challenges.
  ///
  /// In lt, this message translates to:
  /// **'Užduotys'**
  String get menu_challenges;

  /// No description provided for @menu_regions.
  ///
  /// In lt, this message translates to:
  /// **'Regionai'**
  String get menu_regions;

  /// No description provided for @menu_navigation.
  ///
  /// In lt, this message translates to:
  /// **'Navigacija'**
  String get menu_navigation;

  /// No description provided for @menu_challenges_joined.
  ///
  /// In lt, this message translates to:
  /// **'Pradėtos užduotys'**
  String get menu_challenges_joined;

  /// No description provided for @menu_about.
  ///
  /// In lt, this message translates to:
  /// **'Apie'**
  String get menu_about;

  /// No description provided for @menu_qr_code.
  ///
  /// In lt, this message translates to:
  /// **'QR kodas'**
  String get menu_qr_code;

  /// No description provided for @menu_shop.
  ///
  /// In lt, this message translates to:
  /// **'Parduotuvė'**
  String get menu_shop;

  /// No description provided for @menu_messages.
  ///
  /// In lt, this message translates to:
  /// **'Žinutės'**
  String get menu_messages;

  /// No description provided for @rules.
  ///
  /// In lt, this message translates to:
  /// **'Taisyklės'**
  String get rules;

  /// No description provided for @conditions.
  ///
  /// In lt, this message translates to:
  /// **'Sąlygos'**
  String get conditions;

  /// No description provided for @home_empty_title.
  ///
  /// In lt, this message translates to:
  /// **'Šiuo metu turinys ruošiamas, tačiau jau dabar gali pradėti spręsti užduotis!'**
  String get home_empty_title;

  /// No description provided for @gender.
  ///
  /// In lt, this message translates to:
  /// **'Lytis'**
  String get gender;

  /// No description provided for @gender_if_other.
  ///
  /// In lt, this message translates to:
  /// **'Lytis, jei kita'**
  String get gender_if_other;

  /// No description provided for @region.
  ///
  /// In lt, this message translates to:
  /// **'Regionas'**
  String get region;

  /// No description provided for @gender_woman.
  ///
  /// In lt, this message translates to:
  /// **'Moteris'**
  String get gender_woman;

  /// No description provided for @gender_man.
  ///
  /// In lt, this message translates to:
  /// **'Vyras'**
  String get gender_man;

  /// No description provided for @gender_non_binary.
  ///
  /// In lt, this message translates to:
  /// **'Nebinarinė'**
  String get gender_non_binary;

  /// No description provided for @gender_other.
  ///
  /// In lt, this message translates to:
  /// **'Kita'**
  String get gender_other;

  /// No description provided for @gender_prefer_not_to_say.
  ///
  /// In lt, this message translates to:
  /// **'Nenoriu nurodyti'**
  String get gender_prefer_not_to_say;

  /// No description provided for @year_of_birth.
  ///
  /// In lt, this message translates to:
  /// **'Gimimo metai'**
  String get year_of_birth;

  /// No description provided for @challenge_type_article.
  ///
  /// In lt, this message translates to:
  /// **'Straipsniai ir medija'**
  String get challenge_type_article;

  /// No description provided for @challenge_type_custom.
  ///
  /// In lt, this message translates to:
  /// **'Įvairūs'**
  String get challenge_type_custom;

  /// No description provided for @challenge_type_event.
  ///
  /// In lt, this message translates to:
  /// **'Dalyvavimas renginiuose'**
  String get challenge_type_event;

  /// No description provided for @challenge_type_event_org.
  ///
  /// In lt, this message translates to:
  /// **'Renginio organizavimas'**
  String get challenge_type_event_org;

  /// No description provided for @challenge_type_project.
  ///
  /// In lt, this message translates to:
  /// **'Projekto įgyvendinimas'**
  String get challenge_type_project;

  /// No description provided for @challenge_type_quiz.
  ///
  /// In lt, this message translates to:
  /// **'Žinių patikrinimas'**
  String get challenge_type_quiz;

  /// No description provided for @challenge_type_reacting.
  ///
  /// In lt, this message translates to:
  /// **'Reagavimas į įvykius'**
  String get challenge_type_reacting;

  /// No description provided for @challenge_type_school_gsa.
  ///
  /// In lt, this message translates to:
  /// **'Mokyklų GSA'**
  String get challenge_type_school_gsa;

  /// No description provided for @challenge_type_story.
  ///
  /// In lt, this message translates to:
  /// **'Pasidalink savo istorija'**
  String get challenge_type_story;

  /// No description provided for @challenge_type_support.
  ///
  /// In lt, this message translates to:
  /// **'Parama'**
  String get challenge_type_support;

  /// No description provided for @challenge_type_completed.
  ///
  /// In lt, this message translates to:
  /// **'Atliktos užduotys'**
  String get challenge_type_completed;

  /// No description provided for @challenge_event_name_hint_text.
  ///
  /// In lt, this message translates to:
  /// **'Renginio pavadinimas *'**
  String get challenge_event_name_hint_text;

  /// No description provided for @challenge_event_description_hint_text.
  ///
  /// In lt, this message translates to:
  /// **'Renginio aprašymas *'**
  String get challenge_event_description_hint_text;

  /// No description provided for @challenge_event_link_hint_text.
  ///
  /// In lt, this message translates to:
  /// **'Renginio nuoroda *'**
  String get challenge_event_link_hint_text;

  /// No description provided for @challenge_event_organizing_alone.
  ///
  /// In lt, this message translates to:
  /// **'Organizuoju viena/s'**
  String get challenge_event_organizing_alone;

  /// No description provided for @challenge_event_touch_black_screen_for_qr.
  ///
  /// In lt, this message translates to:
  /// **'Paliesk juodą ekraną QR kodo skenavimui'**
  String get challenge_event_touch_black_screen_for_qr;

  /// No description provided for @challenge_event_qr_scanned.
  ///
  /// In lt, this message translates to:
  /// **'QR kodas nuskenuotas'**
  String get challenge_event_qr_scanned;

  /// No description provided for @challenge_event_qr_code_incorrect.
  ///
  /// In lt, this message translates to:
  /// **'QR kodas neteisingas'**
  String get challenge_event_qr_code_incorrect;

  /// No description provided for @challenge_project_name_hint_text.
  ///
  /// In lt, this message translates to:
  /// **'Projekto pavadinimas *'**
  String get challenge_project_name_hint_text;

  /// No description provided for @challenge_project_description_hint_text.
  ///
  /// In lt, this message translates to:
  /// **'Description of the project *'**
  String get challenge_project_description_hint_text;

  /// No description provided for @challenge_project_link_hint_text.
  ///
  /// In lt, this message translates to:
  /// **'Projekto nuoroda *'**
  String get challenge_project_link_hint_text;

  /// No description provided for @challenge_project_completed_alone.
  ///
  /// In lt, this message translates to:
  /// **'Atlikau viena/s'**
  String get challenge_project_completed_alone;

  /// No description provided for @action_join_challenge.
  ///
  /// In lt, this message translates to:
  /// **'Pradėk užduotį'**
  String get action_join_challenge;

  /// No description provided for @joined_challenge_event_field_qr_code.
  ///
  /// In lt, this message translates to:
  /// **'Skenuoti QR kodą'**
  String get joined_challenge_event_field_qr_code;

  /// No description provided for @joined_challenge_event_field_qr_code_wrong.
  ///
  /// In lt, this message translates to:
  /// **'Atsiprašome, neteisingas QR kodas'**
  String get joined_challenge_event_field_qr_code_wrong;

  /// No description provided for @joined_challenge_event_field_qr_code_right.
  ///
  /// In lt, this message translates to:
  /// **'Užduotis atlikta'**
  String get joined_challenge_event_field_qr_code_right;

  /// No description provided for @correct_answers_amount.
  ///
  /// In lt, this message translates to:
  /// **'Teisingai atsakei įį tiek klausimų'**
  String get correct_answers_amount;

  /// No description provided for @rainbows_added_amount.
  ///
  /// In lt, this message translates to:
  /// **'Tau įskaičiuota tiek vaivorykščių'**
  String get rainbows_added_amount;

  /// No description provided for @error.
  ///
  /// In lt, this message translates to:
  /// **'Klaida'**
  String get error;

  /// No description provided for @error_unknown_error.
  ///
  /// In lt, this message translates to:
  /// **'Nenumatyta klaida, mėginkite dar kartą'**
  String get error_unknown_error;

  /// No description provided for @message_fields_are_required.
  ///
  /// In lt, this message translates to:
  /// **'Laukai privalomi'**
  String get message_fields_are_required;

  /// No description provided for @message_field_is_required.
  ///
  /// In lt, this message translates to:
  /// **'Laukas privalomas'**
  String get message_field_is_required;

  /// No description provided for @message_thank_you.
  ///
  /// In lt, this message translates to:
  /// **'Thank you!'**
  String get message_thank_you;

  /// No description provided for @message_challenge_completed_volunteer_will_take_a_look.
  ///
  /// In lt, this message translates to:
  /// **'Ačiū už atliktą užduotį! Savanoris peržiūrės jūsų atsakymą ir įskaitys vaivorykštes. Apie tai būsite informuoti pranešimų skiltyje.'**
  String get message_challenge_completed_volunteer_will_take_a_look;

  /// No description provided for @message_challenge_completed_rainbows_issued.
  ///
  /// In lt, this message translates to:
  /// **'Ačiū už atliktą užduotį. Jums vaivorykštės įskaičiuotos.'**
  String get message_challenge_completed_rainbows_issued;

  /// No description provided for @message_changes_where_saved.
  ///
  /// In lt, this message translates to:
  /// **'Pakeitimai išsaugoti'**
  String get message_changes_where_saved;

  /// No description provided for @challenge_completed_already.
  ///
  /// In lt, this message translates to:
  /// **'Šią užduotį jau atlikote'**
  String get challenge_completed_already;

  /// No description provided for @challenge_continue_single.
  ///
  /// In lt, this message translates to:
  /// **'Tęsti jau pradėtą užduotį'**
  String get challenge_continue_single;

  /// No description provided for @challenge_continue.
  ///
  /// In lt, this message translates to:
  /// **'Tęsti'**
  String get challenge_continue;

  /// No description provided for @challenge_save_and_submit_later.
  ///
  /// In lt, this message translates to:
  /// **'Saugoti ir pateikti vėliau'**
  String get challenge_save_and_submit_later;

  /// No description provided for @challenge_description_hint_text.
  ///
  /// In lt, this message translates to:
  /// **'Aprašykite, kaip atlikote užduotį *'**
  String get challenge_description_hint_text;

  /// No description provided for @challenge_link_hint_text.
  ///
  /// In lt, this message translates to:
  /// **'Nuoroda *'**
  String get challenge_link_hint_text;

  /// No description provided for @challenges_no_completed_challenges.
  ///
  /// In lt, this message translates to:
  /// **'Atliktų užduočių nėra'**
  String get challenges_no_completed_challenges;

  /// No description provided for @challenges_no_joined_challenges.
  ///
  /// In lt, this message translates to:
  /// **'Pradėtų užduočių nėra'**
  String get challenges_no_joined_challenges;

  /// No description provided for @challenge_name.
  ///
  /// In lt, this message translates to:
  /// **'Užduoties pavadinimas'**
  String get challenge_name;

  /// No description provided for @article_name_hint_text.
  ///
  /// In lt, this message translates to:
  /// **'Straipsnio pavadinimas *'**
  String get article_name_hint_text;

  /// No description provided for @article_url.
  ///
  /// In lt, this message translates to:
  /// **'Straipsnio nuoroda'**
  String get article_url;

  /// No description provided for @profile_page_title.
  ///
  /// In lt, this message translates to:
  /// **'Mano profilis'**
  String get profile_page_title;

  /// No description provided for @profile_page_stats_rainbows.
  ///
  /// In lt, this message translates to:
  /// **'Vaivorykštės'**
  String get profile_page_stats_rainbows;

  /// No description provided for @profile_page_stats_active_weeks.
  ///
  /// In lt, this message translates to:
  /// **'Aktyvios savaitės'**
  String get profile_page_stats_active_weeks;

  /// No description provided for @profile_page_medals.
  ///
  /// In lt, this message translates to:
  /// **'Medaliai'**
  String get profile_page_medals;

  /// No description provided for @profile_page_achievements.
  ///
  /// In lt, this message translates to:
  /// **'Pasiekimai'**
  String get profile_page_achievements;

  /// No description provided for @action_challenge_end.
  ///
  /// In lt, this message translates to:
  /// **'Atlik šią užduotį iki'**
  String get action_challenge_end;

  /// No description provided for @rainbows_summary.
  ///
  /// In lt, this message translates to:
  /// **'Vaivorykščių suvestinė'**
  String get rainbows_summary;

  /// No description provided for @rainbows.
  ///
  /// In lt, this message translates to:
  /// **'Vaivorykštės'**
  String get rainbows;

  /// No description provided for @rainbows_received.
  ///
  /// In lt, this message translates to:
  /// **'Gautos Vaivorykštės'**
  String get rainbows_received;

  /// No description provided for @rainbows_active.
  ///
  /// In lt, this message translates to:
  /// **'Aktyvios Vaivorykštės'**
  String get rainbows_active;

  /// No description provided for @rainbows_received_for_tasks.
  ///
  /// In lt, this message translates to:
  /// **'Vaivorykštes gavai už šias užduotis:'**
  String get rainbows_received_for_tasks;

  /// No description provided for @rainbows_spent_on.
  ///
  /// In lt, this message translates to:
  /// **'Vaivorykštes išleidai'**
  String get rainbows_spent_on;

  /// No description provided for @shop_welcome_text.
  ///
  /// In lt, this message translates to:
  /// **'Čia galėsi keisti vaivorykštes į mielus daikčiukus'**
  String get shop_welcome_text;

  /// No description provided for @shop_subtitle_text.
  ///
  /// In lt, this message translates to:
  /// **'Keisk vaivorykštes į mielus daikčiukus'**
  String get shop_subtitle_text;

  /// No description provided for @price.
  ///
  /// In lt, this message translates to:
  /// **'Kaina'**
  String get price;

  /// No description provided for @amount.
  ///
  /// In lt, this message translates to:
  /// **'Kiekis'**
  String get amount;

  /// No description provided for @total.
  ///
  /// In lt, this message translates to:
  /// **'Viso'**
  String get total;

  /// No description provided for @order.
  ///
  /// In lt, this message translates to:
  /// **'Užsakyti'**
  String get order;

  /// No description provided for @order_sent.
  ///
  /// In lt, this message translates to:
  /// **'Užsakymas išsiųstas. Susisieksim su tavim el. paštu ir pranešim, kaip atsiimti prizus.'**
  String get order_sent;

  /// No description provided for @choose_amount.
  ///
  /// In lt, this message translates to:
  /// **'Pasirink kiekį'**
  String get choose_amount;

  /// No description provided for @about_page_title.
  ///
  /// In lt, this message translates to:
  /// **'Apie projektą'**
  String get about_page_title;

  /// No description provided for @about_page_logos.
  ///
  /// In lt, this message translates to:
  /// **'Projekto partneriai ir rėmėjai'**
  String get about_page_logos;

  /// No description provided for @messages_message.
  ///
  /// In lt, this message translates to:
  /// **'Pranešimas'**
  String get messages_message;

  /// No description provided for @delete_account.
  ///
  /// In lt, this message translates to:
  /// **'Ištrinti paskyrą'**
  String get delete_account;

  /// No description provided for @delete_account_confirm.
  ///
  /// In lt, this message translates to:
  /// **'Paskyra bus ištrinta per 7 dienas. Apsigalvojai? Susisiek su info@rainbowchallenge.lt per 3 dienas.'**
  String get delete_account_confirm;

  /// No description provided for @wrong_password.
  ///
  /// In lt, this message translates to:
  /// **'Neteisingas slaptažodis!'**
  String get wrong_password;

  /// No description provided for @user_logged_in.
  ///
  /// In lt, this message translates to:
  /// **'Prisijungęs'**
  String get user_logged_in;

  /// No description provided for @sign_in_with_google.
  ///
  /// In lt, this message translates to:
  /// **'Prisijungti su Google'**
  String get sign_in_with_google;

  /// No description provided for @social_sign_in_failed.
  ///
  /// In lt, this message translates to:
  /// **'Prisijungimas su {provider} nepavyko'**
  String social_sign_in_failed(String provider);

  /// No description provided for @sign_in_with_apple.
  ///
  /// In lt, this message translates to:
  /// **'Prisijungti su Apple'**
  String get sign_in_with_apple;

  /// No description provided for @files_attach_file.
  ///
  /// In lt, this message translates to:
  /// **'Prijungti failą'**
  String get files_attach_file;

  /// No description provided for @files_too_big.
  ///
  /// In lt, this message translates to:
  /// **'Klaida. Failas, kurį bandote pridėti, per didelis'**
  String get files_too_big;

  /// No description provided for @label_active.
  ///
  /// In lt, this message translates to:
  /// **'Aktyvios'**
  String get label_active;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'lt', 'pt', 'sk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'lt':
      return AppLocalizationsLt();
    case 'pt':
      return AppLocalizationsPt();
    case 'sk':
      return AppLocalizationsSk();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
