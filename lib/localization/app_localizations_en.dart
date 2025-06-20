// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Rainbow Challenge';

  @override
  String get email => 'Email';

  @override
  String get enter_email => 'Enter your email';

  @override
  String get email_enter_valid => 'Please enter a valid email.';

  @override
  String get password => 'Password';

  @override
  String get testing => 'Test';

  @override
  String get new_user => 'New user';

  @override
  String get change_password => 'Change password';

  @override
  String get password_hint => 'Password';

  @override
  String get repeat_password => 'Repeat password';

  @override
  String get current_password => 'Current Password';

  @override
  String get passwords_must_match => 'Passwords must match';

  @override
  String get password_rules =>
      'Password has to be not shorter than 8 symbols, and has to contain at least 1 number.';

  @override
  String get password_update_success => 'Password changed successfully';

  @override
  String get password_recovery_url =>
      'Password recovery link sent to the specified email';

  @override
  String get registration_successful =>
      'Registration successful. You will be able to login after account activation. We\'ve sent the activation link to your email.';

  @override
  String get user_settings => 'User Settings';

  @override
  String get settings_changed => 'Settings have been changed';

  @override
  String get action_back_to_profile => 'Back to profile';

  @override
  String get action_back_to_challenges => 'Back to challenges';

  @override
  String get action_login => 'Login';

  @override
  String get action_logout => 'Logout';

  @override
  String get action_submit => 'Submit';

  @override
  String get action_register => 'No account yet? Register!';

  @override
  String get action_have_account_login => 'Already have an account? Login';

  @override
  String get action_forgot_password => 'Forgot password? Click here';

  @override
  String get action_update_settings => 'Update settings';

  @override
  String get action_back => 'Go back';

  @override
  String get menu_home => 'Home';

  @override
  String get menu_profile => 'Profile';

  @override
  String get menu_challenges => 'Challenges';

  @override
  String get menu_regions => 'Regions';

  @override
  String get menu_navigation => 'Navigation';

  @override
  String get menu_challenges_joined => 'Joined challenges';

  @override
  String get menu_about => 'About';

  @override
  String get menu_qr_code => 'Scan QR code';

  @override
  String get menu_shop => 'Shop';

  @override
  String get menu_messages => 'Messages';

  @override
  String get rules => 'Rules';

  @override
  String get conditions => 'Conditions';

  @override
  String get home_empty_title =>
      'Content is being prepared, but you can start with challenges!';

  @override
  String get gender => 'Gender';

  @override
  String get gender_if_other => 'Lytis, jei kita';

  @override
  String get region => 'Region';

  @override
  String get gender_woman => 'Woman';

  @override
  String get gender_man => 'Man';

  @override
  String get gender_non_binary => 'Non-binary';

  @override
  String get gender_other => 'Other';

  @override
  String get gender_prefer_not_to_say => 'Prefer not to say';

  @override
  String get year_of_birth => 'Year o birth';

  @override
  String get challenge_type_article => 'Articles';

  @override
  String get challenge_type_custom => 'Custom';

  @override
  String get challenge_type_event => 'Event participation';

  @override
  String get challenge_type_event_org => 'Event organization';

  @override
  String get challenge_type_project => 'Project';

  @override
  String get challenge_type_quiz => 'Quiz';

  @override
  String get challenge_type_reacting => 'Reaction to events';

  @override
  String get challenge_type_school_gsa => 'School GSA';

  @override
  String get challenge_type_story => 'Story';

  @override
  String get challenge_type_support => 'Support';

  @override
  String get challenge_type_completed => 'Completed challenges';

  @override
  String get challenge_event_name_hint_text => 'Name of the event *';

  @override
  String get challenge_event_description_hint_text =>
      'Description of the event *';

  @override
  String get challenge_event_link_hint_text => 'Link to the event *';

  @override
  String get challenge_event_organizing_alone => 'Organizing alone';

  @override
  String get challenge_event_touch_black_screen_for_qr =>
      'Touch the black screen to scan the QR code';

  @override
  String get challenge_event_qr_scanned => 'QR code has been scanned';

  @override
  String get challenge_event_qr_code_incorrect => 'QR code is incorrect';

  @override
  String get challenge_project_name_hint_text => 'Project name *';

  @override
  String get challenge_project_description_hint_text =>
      'Description of the project *';

  @override
  String get challenge_project_link_hint_text => 'Link to the project *';

  @override
  String get challenge_project_completed_alone => 'Completed alone';

  @override
  String get action_join_challenge => 'Join the challenge';

  @override
  String get joined_challenge_event_field_qr_code => 'Scan QR code';

  @override
  String get joined_challenge_event_field_qr_code_wrong =>
      'Sorry! Wrong QR code';

  @override
  String get joined_challenge_event_field_qr_code_right =>
      'Challenge accomplished!';

  @override
  String get correct_answers_amount => 'Amount of correct answers';

  @override
  String get rainbows_added_amount => 'Amount of Rainbows received';

  @override
  String get error => 'Error';

  @override
  String get error_unknown_error => 'Unknown error, try again';

  @override
  String get message_fields_are_required => 'Fields are required';

  @override
  String get message_field_is_required => 'Field is required';

  @override
  String get message_thank_you => 'Thank you!';

  @override
  String get message_challenge_completed_volunteer_will_take_a_look =>
      'Thank you or the completion o this challenge! Our volunteer will check your answer and will issue you your rainbows. You will get a notification about this.';

  @override
  String get message_challenge_completed_rainbows_issued =>
      'Thank you or the completion o this challenge! Rainbows have been issued to you.';

  @override
  String get message_changes_where_saved => 'Changes where saved';

  @override
  String get challenge_completed_already => 'Challenge already accomplished';

  @override
  String get challenge_continue_single => 'Continue challenge';

  @override
  String get challenge_continue => 'Continue';

  @override
  String get challenge_save_and_submit_later => 'Save and submit later';

  @override
  String get challenge_description_hint_text =>
      'Describe how you completed this task *';

  @override
  String get challenge_link_hint_text => 'Link *';

  @override
  String get challenges_no_completed_challenges =>
      'There are no completed challenges';

  @override
  String get challenges_no_joined_challenges =>
      'There are no joined challenges';

  @override
  String get challenge_name => 'Challenge name';

  @override
  String get article_name_hint_text => 'Article name *';

  @override
  String get article_url => 'Article link';

  @override
  String get profile_page_title => 'My profile';

  @override
  String get profile_page_stats_rainbows => 'Rainbows';

  @override
  String get profile_page_stats_active_weeks => 'Active weeks';

  @override
  String get profile_page_medals => 'Medals';

  @override
  String get profile_page_achievements => 'Achievements';

  @override
  String get action_challenge_end => 'Accomplish the challenge until';

  @override
  String get rainbows_summary => 'Rainbows summary';

  @override
  String get rainbows => 'Rainbows';

  @override
  String get rainbows_received => 'Rainbows received';

  @override
  String get rainbows_active => 'Active Rainbows';

  @override
  String get rainbows_received_for_tasks =>
      'You received Rainbows or those challenges:';

  @override
  String get rainbows_spent_on => 'You spent Rainbows on:';

  @override
  String get shop_welcome_text => 'Exchange rainbows to nice little things!';

  @override
  String get shop_subtitle_text => 'Exchange rainbows';

  @override
  String get price => 'Price';

  @override
  String get amount => 'Amount';

  @override
  String get total => 'Total';

  @override
  String get order => 'Order';

  @override
  String get order_sent =>
      'Order sent. we will contact you by email and will let you know hohw you can receive your prize.';

  @override
  String get choose_amount => 'Choose amount';

  @override
  String get about_page_title => 'About the project';

  @override
  String get about_page_logos => 'Project partners and sponsors';

  @override
  String get messages_message => 'Message';

  @override
  String get delete_account => 'Delete account';

  @override
  String get delete_account_confirm =>
      'Your account will be deleted in 7 days. Changed your mind? Contact info@rainbowchallenge.lt during next 3 days.';

  @override
  String get wrong_password => 'Wrong password!';

  @override
  String get user_logged_in => 'Logged in';

  @override
  String get sign_in_with_google => 'Sign in with Google';

  @override
  String social_sign_in_failed(String provider) {
    return 'Sign in with $provider failed';
  }

  @override
  String get sign_in_with_apple => 'Sign in with Apple';

  @override
  String get files_attach_file => 'Attach file';

  @override
  String get files_too_big =>
      'Error. File that you are trying to attach is too big';

  @override
  String get label_active => 'Active';
}
